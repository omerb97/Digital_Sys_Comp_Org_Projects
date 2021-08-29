// 32X32 Multiplier arithmetic unit template
module mult32x32_arith (
    input logic clk,             // Clock
    input logic reset,           // Reset
    input logic [31:0] a,        // Input a
    input logic [31:0] b,        // Input b
    input logic [1:0] a_sel,     // Select one byte from A
    input logic b_sel,           // Select one 2-byte word from B
    input logic [2:0] shift_sel, // Select output from shifters
    input logic upd_prod,        // Update the product register
    input logic clr_prod,        // Clear the product register
    output logic [63:0] product  // Miltiplication product
);

// Put your code here
// ------------------
	logic [7:0] a_out;
	logic [15:0] b_out;
	logic [24:0] mul_out; 
	logic [63:0] shift_sel_out;
	logic [63:0] add64_out;
	logic [63:0] prod_out;
	
	// mux a
	always_comb begin
		case (a_sel)
			2'd0: a_out = a[7:0];
			2'd1: a_out = a[15:8];
			2'd2: a_out = a[23:16];
			2'd3: a_out = a[31:24];
		endcase
	end
	
	// mux b
	always_comb begin
		case (b_sel)
			1'd0: b_out = b[15:0];
			1'd1: b_out = b[31:16];
		endcase
	end
	
	// multiplier
	always_comb begin
		mul_out = a_out*b_out;
	end
	
	// shifter and mux
	always_comb begin
		case (shift_sel)
			3'd0: shift_sel_out = mul_out;
			3'd1: shift_sel_out = mul_out<<8;
			3'd2: shift_sel_out = mul_out<<16;
			3'd3: shift_sel_out = mul_out<<24;
			3'd4: shift_sel_out = mul_out<<32;
			3'd5: shift_sel_out = mul_out<<40;
		endcase
	end
	
	// 64-bit adder
	always_comb begin
		add64_out = shift_sel_out + prod_out;
	end
	
	// product register
	always_ff @(posedge clk) begin
		if (clr_prod == 1'b1) begin
			prod_out <= 63'h00000000;
		end
		else if (upd_prod == 1'b1) begin
			prod_out <= add64_out;
		end
	end
	
	assign product = prod_out;

// End of your code

endmodule
