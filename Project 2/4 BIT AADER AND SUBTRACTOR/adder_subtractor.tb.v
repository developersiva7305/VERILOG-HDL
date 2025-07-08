module  adder_subtractor_tb;

    reg  [3:0] A, B;
    reg        mode;
    wire [3:0] result;
    wire       carry;

    // Instantiate the Unit Under Test
    adder_subtractor uut (
        A,
        B,
        mode,
        result,
        carry
    );

    initial begin
        // Addition examples
        mode = 0; A = 4'd2; B = 4'd3; #10;
        A = 4'd7; B = 4'd6; #10;

        // Subtraction examples
        mode = 1; A = 4'd8; B = 4'd3; #10;
        A = 4'd9; B = 4'd5; #10;

        // Finish simulation
        #10;
        $finish;
    end

endmodule