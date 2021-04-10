module rock_paper_scissors(
    input [1:0] A,
    input [1:0] B,
    output is_error,
    output is_A_win);
    
parameter ROCK = 2'b00;
parameter PAPER = 2'b01;
parameter SCISORS = 2'b10;

wire is_A_rock, is_A_paper, is_A_scisors;
wire is_B_rock, is_B_paper, is_B_scisors;

assign is_A_rock    = (A ==    ROCK)?1'b1:1'b0;
assign is_A_paper   = (A ==   PAPER)?1'b1:1'b0;
assign is_A_scisors = (A == SCISORS)?1'b1:1'b0;

assign is_B_rock    = (B ==    ROCK)?1'b1:1'b0;
assign is_B_paper   = (B ==   PAPER)?1'b1:1'b0;
assign is_B_scisors = (B == SCISORS)?1'b1:1'b0;

assign is_error = (~|{is_A_rock, is_A_paper, is_A_scisors})|
               (~|{is_B_rock, is_B_paper, is_B_scisors});

assign is_A_win = (is_A_rock    > is_B_scisors)|
                  (is_A_paper   > is_B_rock)|
                  (is_A_scisors > is_B_paper);

endmodule