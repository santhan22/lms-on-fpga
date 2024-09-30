module system_output (
    input [15:0] d_in,        // Desired signal
    input [15:0] y_in,        // Filtered output
    output reg [15:0] e_out,  // Error signal
    input en                  // Enable signal
);
    always @(*) begin
        if (en) begin
            e_out = d_in - y_in; // Error calculation
        end
    end
endmodule
