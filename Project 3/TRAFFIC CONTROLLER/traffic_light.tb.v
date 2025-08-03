timescale 1ns / 1ps

module traffic_light_tb;
    reg clk, rst;
    wire [1:0] highway, street;

    traffic_light uut(.clk(clk), .rst(rst), .highway(highway), .street(street));
   
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock
    end

    initial begin
        rst = 1; #20; rst = 0;
        #100 $finish;
    end
endmodule
