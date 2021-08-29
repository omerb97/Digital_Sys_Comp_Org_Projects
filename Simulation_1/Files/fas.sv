// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

logic w1, w2, w3, w4, w5, w6 ,w7 ,w8, w9, w10;
XOR2 #(.Tpdlh(8), .Tpdhl(8)) g1 (
    .A(a),
    .B(b),
    .Z(w1)
);

NOT #(.Tpdlh(10), .Tpdhl(8)) g2 (
    .A(a_ns),
    .Z(w3)
);

XOR2 #(.Tpdlh(8), .Tpdhl(8)) g3 (
    .A(w1),
    .B(cin),
    .Z(s)
);

XOR2 #(.Tpdlh(8), .Tpdhl(8)) g4 (
    .A(w1),
    .B(w3),
    .Z(w5)
);

NOT #(.Tpdlh(10), .Tpdhl(8)) g5 (
    .A(b),
    .Z(w6)
);

NOT #(.Tpdlh(10), .Tpdhl(8)) g6 (
    .A(cin),
    .Z(w7)
);

XOR2 #(.Tpdlh(8), .Tpdhl(8)) g7 (
    .A(s),
    .B(w3),
    .Z(w8)
);

OR2 #(.Tpdlh(5), .Tpdhl(4)) g8 (
    .A(w5),
    .B(w6),
    .Z(w9)
);

OR2 #(.Tpdlh(5), .Tpdhl(4)) g9 (
    .A(w7),
    .B(w8),
    .Z(w10)
);

NOT #(.Tpdlh(10), .Tpdhl(8)) g10 (
    .A(w10),
    .Z(w2)
);

NOT #(.Tpdlh(10), .Tpdhl(8)) g11 (
    .A(w9),
    .Z(w4)
);

OR2 #(.Tpdlh(5), .Tpdhl(4)) g12 (
    .A(w2),
    .B(w4),
    .Z(cout)
);


endmodule
