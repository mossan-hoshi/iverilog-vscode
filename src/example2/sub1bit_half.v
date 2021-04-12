module sub1bit_half(
    input  A,
    input  B,
    output O,
    output Borrow
);

// | A | B | O | B |
// |---|---|---|---|
// | 0 | 0 | 0 | 0 |
// | 0 | 1 | 1 | 1 |
// | 1 | 0 | 1 | 0 |
// | 1 | 1 | 0 | 0 |


assign O = A ^ B;
assign Borrow = (~A) & B;

endmodule