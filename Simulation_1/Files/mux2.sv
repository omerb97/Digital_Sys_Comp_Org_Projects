// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

logic or1out, or2out, selF;
NOT #(.Tpdlh(10), .Tpdhl(8)) g3(.A(sel),.Z(selF));
OR2 #(.Tpdlh(5), .Tpdhl(4)) g1(.A(d0),.B(sel),.Z(or1out));
OR2 #(.Tpdlh(5), .Tpdhl(4)) g2(.A(d1),.B(selF),.Z(or2out));
logic xorout;
XOR2 #(.Tpdlh(8), .Tpdhl(8)) g4(.A(or1out),.B(or2out),.Z(xorout));
NOT #(.Tpdlh(10), .Tpdhl(8)) g5(.A(xorout),.Z(z));

endmodule
