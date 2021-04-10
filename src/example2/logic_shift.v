module logic_shift(
    input   [BIT_NUM-1:0]       data_in,
    input   [SHIFT_BIT_NUM-1:0] shift_bit_num,
    input                       is_right_shift,
    output  [BIT_NUM-1:0]       data_out
);
    
parameter BIT_NUM = 8;
parameter SHIFT_BIT_NUM = 8;

assign data_out = (is_right_shift)?(data_in >> shift_bit_num):
                                   (data_in << shift_bit_num);

endmodule