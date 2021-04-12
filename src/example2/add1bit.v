module add(
    input  [BIT_NUM-1:0] A,
    input  [BIT_NUM-1:0] B,
    output [BIT_NUM-1:0] O,
    output               C_o
);

parameter BIT_NUM = 8;

wire O_1;
wire O_2;
wire C_1;
wire C_2;


genvar i;
generate 
    for(i = 1; i < BIT_NUM; i = i + 1) begin: 
        add add_1 (
            .A   (A[i]  ),
            .B   (B[i]  ),
            .C_i (C_i[i] )
            .O   (O_1   ),
            .C_o (C_1)
        );
    }
endgenerate

assign O = O_2;
assign C_o = C_2 | C_1;

endmodule