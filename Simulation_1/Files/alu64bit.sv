// 64-bit ALU template
module alu64bit (
    input logic [63:0] a,    // Input bit a
    input logic [63:0] b,    // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic [63:0] s,   // Output S
    output logic cout        // Carry out
);
localparam size = 64;
genvar i;
logic [size:0] cVec;
assign cVec[0] = cin;
generate
    for(i = 0; i < size; i=i+1) begin
        alu1bit alu_inst(
            .a(a[i]),
            .b(b[i]),
            .cin(cVec[i]),
            .op(op),
            .s(s[i]),
			.cout(cVec[i+1])
        );
    end
endgenerate 

assign cout = cVec[size];


endmodule
