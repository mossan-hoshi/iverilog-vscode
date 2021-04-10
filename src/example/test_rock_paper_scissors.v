`timescale 1ps/1ps

module test_rock_paper_scissors();
    parameter ROCK = 2'b00;
    parameter PAPER = 2'b01;
    parameter SCISORS = 2'b10;
    parameter CLOCK_CYCLE = 100;
    parameter COUNTER_BIT_NUM = 2 * 2;

    // signal defenition
    reg clk;
    reg reset;
    reg [COUNTER_BIT_NUM -1:0] counter;
    wire [1:0] A;
    wire [1:0] B;
    wire is_A_win;
    wire is_error;
    assign A = counter[1:0];
    assign B = counter[3:2];

    // dump wave file
    initial begin
        $dumpfile("tmp/dump.vcd");
        $dumpvars(0, rock_paper_scissors_1);
    end

    // monitor
    initial begin
        $monitor ("[%t] A=(%b,%b,%b), B=(%b,%b,%b) => is_A_win=%b, is_error=%b", $time, 
            rock_paper_scissors_1.is_A_paper,
            rock_paper_scissors_1.is_A_rock,
            rock_paper_scissors_1.is_A_scisors,
            rock_paper_scissors_1.is_B_paper,
            rock_paper_scissors_1.is_B_rock,
            rock_paper_scissors_1.is_B_scisors,
            rock_paper_scissors_1.is_A_win,
            rock_paper_scissors_1.is_error);
    end

    // simulation end
    initial begin
        #(CLOCK_CYCLE*1000) $finish;
    end

    // clock
    initial begin
        #10 clk <= 1'b0;
        forever begin
            #(CLOCK_CYCLE/2) clk <= ~clk;
        end
    end

    // reset
    initial begin
        #10 reset <= 1'b0;
        #300 reset <= 1'b1;
    end

    // counter
    always @(posedge clk or negedge reset) begin
        if(~reset)begin
            counter <= {COUNTER_BIT_NUM{1'b0}};
        end
        else begin
            counter <= counter + {{COUNTER_BIT_NUM-1{1'b0}},1'b1};
        end
    end


    rock_paper_scissors #(
        .ROCK       (ROCK   ),
        .PAPER      (PAPER  ),
        .SCISORS    (SCISORS)
    ) rock_paper_scissors_1 (
        .A(A),
        .B(B),
        .is_A_win(is_A_win),
        .is_error(is_error));

endmodule