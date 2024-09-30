module saturation_block (
    input [31:0] y_in,       // Input value (before saturation)
    output reg [15:0] y_out, // Saturated output
    input en                 // Enable signal
);
    always @(*) begin
        if (en) begin
            if (y_in > 32767)
                y_out = 32767;
            else if (y_in < -32768)
                y_out = -32768;
            else
                y_out = y_in[15:0];  // Truncate to 16-bit
        end
    end
endmodule
