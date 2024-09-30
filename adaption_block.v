module adaptation_block (
    input clk,
    input reset,
    input [15:0] e_in,        // Error signal
    input [15:0] x_in,        // Input sample
    input [15:0] w_in,        // Current weight
    input [15:0] mu,          // Step size
    output reg [15:0] w_out,  // Updated weight
    input en                  // Enable signal
);
    reg [31:0] weight_update;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            w_out <= 16'b0;
        end else if (en) begin
            weight_update <= w_in + (mu * e_in * x_in) >> 16; // LMS update
            w_out <= weight_update[15:0];
        end
    end
endmodule
