// 64-bit ALU test bench template
module alu64bit_test;
logic [63:0] a = {64{0}};
logic [63:0] b = {64{0}};
logic cin;
logic[1:0] op;
logic [63:0] s;
logic cout;

alu64bit testing (
    .a(a),
    .b(b),
    .cin(cin),
    .op(op),
    .s(s),
    .cout(cout)
);

initial begin
    a[0] = 1'b0;
    b[0] = 1'b0;
    cin = 1'b0;
    op = 2'b10;
    
    #500
    a[0] = 1'b1;
    b[0] = 1'b1;
    cin = 1'b0;
    op = 2'b10;
end


endmodule
