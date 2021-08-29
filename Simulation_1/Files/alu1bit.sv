// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);
logic w1, w2, w3, w4, w5;

NOT #(.Tpdlh(10), .Tpdhl(8)) g1 (
    .A(op[0]),
    .Z(w1)
);

fas fas1(
    .a(a),
    .b(b),
    .cin(cin),
    .a_ns(w1),
    .cout(cout),
    .s(w2)
);

XOR2 #(.Tpdlh(8), .Tpdhl(8)) g2 (
    .A(a),
    .B(b),
    .Z(w3)
);

OR2 #(.Tpdlh(5), .Tpdhl(4)) g3 (
    .A(a),
    .B(b),
    .Z(w4)
);

NOT #(.Tpdlh(10), .Tpdhl(8)) g4 (
    .A(w4),
    .Z(w5)
);

mux4 mux1(
    .d0(w5),
    .d1(w3),
    .d2(w2),
    .d3(w2),
    .sel(op),
    .z(s)
);

endmodule
