module digital_time(
    input clk,
    input rst,
    input start,
    output reg [7:0] sec
);
    reg [25:0] clkdiv; // 26-bit counter

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            clkdiv <= 0;
            sec <= 0;
        end else if (start) begin
            clkdiv <= clkdiv + 1;

            // SMALL value for simulation (instead of 50_000_000)
            if (clkdiv >= 10) begin
                clkdiv <= 0;
                sec <= sec + 1;
                if (sec == 59)
                    sec <= 0;
            end
        end
    end
endmodule
