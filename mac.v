module mac_filter (
    input clk,
    input reset,
    input [15:0] x_in,        // Input sample
    input [15:0] w_in,        // Weight
    output reg [31:0] mac_out, // MAC output
    input en                  // Enable signal
);
    reg [31:0] mac_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            mac_reg <= 32'b0;
        end else if (en) begin
            mac_reg <= mac_reg + x_in * w_in;  // MAC operation
        end
    end

    assign mac_out = mac_reg;
endmodule
