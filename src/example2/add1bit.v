module add1bit(
    input  A,
    input  B,
    input  C_i,
    output O,
    output C_o
);

wire O_1;
wire O_2;
wire C_1;
wire C_2;


add1bit_half add1bit_half_1 (
    .A (A),
    .B (B),
    .O (O_1),
    .C (C_1)
    );

add1bit_half add1bit_half_2 (
    .A (O_1),
    .B (C_i),
    .O (O_2),
    .C (C_2)
    );

assign O = O_2;
assign C_o = C_2 | C_1;

endmodule