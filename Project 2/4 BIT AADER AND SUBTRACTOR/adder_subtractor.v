module adder_subtractor (
    input  [3:0] A,
    input  [3:0] B,
    input        mode,         // 0 = add, 1 = subtract
    output [3:0] result,
    output       carry
);

    wire [4:0] sum;

    assign sum    = mode ? (A - B) : (A + B);
    assign result = sum[3:0];
    assign carry  = sum[4];

endmodule