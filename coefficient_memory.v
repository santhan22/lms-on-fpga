module coefficient_memory (
    input clk,
    input reset,
    input [15:0] w_in,         // New weight to store
    output reg [15:0] w_out,   // Output weight
    input en_wr,               // Write enable
    input en_rd                // Read enable
);
    reg [15:0] coeff_reg;      // Register to hold weight

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            coeff_reg <= 16'b0;
        end else if (en_wr) begin
            coeff_reg <= w_in;  // Store the weight
        end
    end

    assign w_out = (en_rd) ? coeff_reg : 16'b0;
endmodule
