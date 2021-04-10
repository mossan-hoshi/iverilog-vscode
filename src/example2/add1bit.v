module add1bit(
    input  A,
    input  B,
    output O,
    output C
);

assign O = A ^ B;
assign C = A & B;

endmodule