`timescale 1ns / 1ps

module digital_time_tb;
    reg clk, rst, start;
    wire [7:0] sec;

    digital_time uut(.clk(clk), .rst(rst), .start(start), .sec(sec));

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // 20ns period -> 50MHz simulated
    end

    // Test sequence
    initial begin
        rst = 1; start = 0; #50; // reset on
        rst = 0; start = 1; // start stopwatch
    end

    // Display seconds every time it changes
    always @(posedge clk) begin
        $display("Time=%0t ns, Seconds=%0d", $time, sec);
    end
endmodule
