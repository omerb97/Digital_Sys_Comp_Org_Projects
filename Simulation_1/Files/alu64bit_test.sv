// 64-bit ALU test bench template
module alu64bit_test;
	logic [63:0] a;
    logic [63:0] b;
    logic cin;
    logic [1:0] op;
    logic [63:0] s;
    logic cout;
	
	alu64bit uut (.a(a), .b(b), .cin(cin), .op(op), .s(s), .cout(cout));
	
	initial begin
		a = {1'b0,{62{1'b1}},1'b0};
		b = {{63{1'b0}},1'b0};
		cin = 1'b1;
		op = 2'b10;
	
		#3000
		a = {1'b0,{62{1'b1}},1'b1};
		b = {{63{1'b0}},1'b0};
		cin = 1'b1;
		op = 2'b10;
		// tpd = 2267
		
		#3000;
	end
endmodule
