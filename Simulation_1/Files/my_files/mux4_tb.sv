// 4->1 multiplexer test bench template
module mux4_tb;
	logic d0;
    logic d1;
    logic d2;
    logic d3;
    logic [1:0] sel;
    logic z;

	mux4 uut (.d0(d0), .d1(d1), .d2(d2), .d3(d3), .sel(sel), .z(z));
	
	initial begin
		d0 = 1'b0;
		d1 = 1'b0;
		d2 = 1'b0;
		d3 = 1'b0;
		sel = 2'b00;
		
		#100;
		d0 = 1'b1;
		d1 = 1'b0;
		d2 = 1'b0;
		d3 = 1'b0;
		sel = 2'b00;
		
		#100;
		d0 = 1'b1;
		d1 = 1'b0;
		d2 = 1'b0;
		d3 = 1'b0;
		sel = 2'b01;
		
		#100;
		d0 = 1'b1;
		d1 = 1'b0;
		d2 = 1'b0;
		d3 = 1'b0;
		sel = 'b10;
		
		#100;
		d0 = 1'b1;
		d1 = 1'b0;
		d2 = 1'b0;
		d3 = 1'b0;
		sel = 2'b11;
		
		#100;
		d0 = 1'b0;
		d1 = 1'b1;
		d2 = 1'b1;
		d3 = 1'b1;
		sel = 2'b00;
		
		#100;
		d0 = 1'b1;
		d1 = 1'b1;
		d2 = 1'b0;
		d3 = 1'b0;
		sel = 2'b01;
		
		#100;
		d0 = 1'b1;
		d1 = 1'b0;
		d2 = 1'b1;
		d3 = 1'b0;
		sel = 2'b10;
		
		#100;
		d0 = 1'b1;
		d1 = 1'b0;
		d2 = 1'b0;
		d3 = 1'b1;
		sel = 2'b11;
		
		#100;
	end
endmodule
	
	

	