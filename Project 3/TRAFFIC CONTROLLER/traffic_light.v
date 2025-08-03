module traffic_light(
    input clk,
    input rst,
    output reg [1:0] highway,  // 00: Red, 01: Green, 10: Yellow
    output reg [1:0] street
);

reg [2:0] state;
parameter S0=3'd0, S1=3'd1, S2=3'd2, S3=3'd3;

always @(posedge clk or posedge rst) begin
    if (rst)
        state <= S0;
    else
        state <= state + 1;
end

always @(*) begin
    case(state)
        S0: begin highway = 2'b01; street = 2'b00; end  // Hwy Green
        S1: begin highway = 2'b10; street = 2'b00; end  // Hwy Yellow
        S2: begin highway = 2'b00; street = 2'b01; end  // Street Green
        S3: begin highway = 2'b00; street = 2'b10; end  // Street Yellow
        default: begin highway = 2'b00; street = 2'b00; end
    endcase
end

endmodule
