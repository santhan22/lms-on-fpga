module data_memory (
    input clk,
    input reset,
    input [15:0] x_in,        // Input sample
    output reg [15:0] x_out,  // Output to MAC Filter Block
    input en                 // Enable signal
);
    reg [15:0] data_reg;      // Register to hold data

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_reg <= 16'b0;
        end else if (en) begin
            data_reg <= x_in;
        end
    end

    assign x_out = data_reg;
endmodule
