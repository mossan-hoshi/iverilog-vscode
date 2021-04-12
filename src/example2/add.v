module add(
    input  [BIT_NUM-1:0] A,
    input  [BIT_NUM-1:0] B,
    output [BIT_NUM-1:0] O,
    output               C
);

parameter BIT_NUM = 8;

wire [BIT_NUM-1:0] C_o;

generate 
    genvar i;
    for(i = 1; i < BIT_NUM; i = i + 1) begin:generate_add
        add1bit add1bit_1 (
            .A   (A[i]    ),
            .B   (B[i]    ),
            .C_i (C_o[i-1]),
            .O   (O[i]    ),
            .C_o (C_o[i]  )
        );
    end
endgenerate
add1bit add1bit_0 (
    .A   (A[0]   ),
    .B   (B[0]   ),
    .C_i (1'b0   ),
    .O   (O[0]   ),
    .C_o (C_o[0] )
);

assign C = C_o[BIT_NUM-1];

endmodule