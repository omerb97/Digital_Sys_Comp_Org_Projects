// 32X32 Multiplier FSM
module mult32x32_fsm (
    input logic clk,              // Clock
    input logic reset,            // Reset
    input logic start,            // Start signal
    output logic busy,            // Multiplier busy indication
    output logic [1:0] a_sel,     // Select one byte from A
    output logic b_sel,           // Select one 2-byte word from B
    output logic [2:0] shift_sel, // Select output from shifters
    output logic upd_prod,        // Update the product register
    output logic clr_prod         // Clear the product register
);

// Put your code here
// ------------------

	typedef enum {
		idle_st,
		start_st,
		a_st,
		b_st,
		c_st,
		d_st,
		e_st,
		f_st,
		g_st
	} sm_type;
	sm_type current_state;
	sm_type next_state;
	
	always_ff @(posedge clk, posedge reset) begin
		if (reset == 1'b1) begin
			current_state <= idle_st;
		end
		else begin
			current_state <= next_state;
		end
	end
	
	always_comb begin
		next_state = current_state;
		a_sel = 2'b00;
		b_sel = 1'b0;
		shift_sel = 3'b000;
		upd_prod = 1'b1;
		clr_prod = 1'b0;
		busy = 1'b1;
		
		case (current_state)
			idle_st: begin
				if(start == 1'b1) begin
					next_state = start_st;
					busy = 1'b0;
					upd_prod = 1'b0;
					clr_prod = 1'b1;
				end
				else begin
					busy = 1'b0;
					upd_prod = 1'b0;
				end
			end
			start_st: begin
				next_state = a_st;
				a_sel = 2'b00;
				b_sel = 1'b0;
				shift_sel = 3'b000;
			end
			a_st: begin
				next_state = b_st;
				a_sel = 2'b01;
				b_sel = 1'b0;
				shift_sel = 3'b001;
			end
			b_st: begin
				next_state = c_st;
				a_sel = 2'b10;
				b_sel = 1'b0;
				shift_sel = 3'b010;
			end
			c_st: begin
				next_state = d_st;
				a_sel = 2'b11;
				b_sel = 1'b0;
				shift_sel = 3'b011;
			end
			d_st: begin
				next_state = e_st;
				a_sel = 2'b00;
				b_sel = 1'b1;
				shift_sel = 3'b010;
			end
			e_st: begin
				next_state = f_st;
				a_sel = 2'b01;
				b_sel = 1'b1;
				shift_sel = 3'b011;
			end
			f_st: begin
				next_state = g_st;
				a_sel = 2'b10;
				b_sel = 1'b1;
				shift_sel = 3'b100;
			end
			g_st: begin
				next_state = idle_st;
				a_sel = 2'b11;
				b_sel = 1'b1;
				shift_sel = 3'b101;
			end
		endcase
	end
	
	
// End of your code

endmodule
