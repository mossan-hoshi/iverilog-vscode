`timescale 1ps/1ps

module test_logic_shift();
    parameter CLOCK_CYCLE = 100;
    parameter BIT_NUM = 8;
    parameter SHIFT_BIT_NUM = 3;
    parameter COUNTER_BIT_NUM = BIT_NUM + SHIFT_BIT_NUM + 1;
    parameter SIMULATION_PERIOD = 500;

    // signal defenition
    reg clk;
    reg reset;
    reg  [COUNTER_BIT_NUM -1:0] counter;
    wire [BIT_NUM-1:0]          data_in;
    wire [SHIFT_BIT_NUM-1:0]    shift_bit_num;
    wire                        is_right_shift;
    wire [BIT_NUM-1:0]          data_out;
    assign data_in             = counter[BIT_NUM + SHIFT_BIT_NUM + 1 - 1:SHIFT_BIT_NUM + 1];
    assign shift_bit_num        = counter[SHIFT_BIT_NUM - 1:1];
    assign is_right_shift    = counter[0];

    // dump wave file
    initial begin
        $dumpfile("tmp/dump.vcd");
        $dumpvars(0, test_logic_shift);
    end

    // monitor
    initial begin
        $monitor ("[%t] data=%b, shift_bit_num=%d, is_right_shift=%b => data_out=%b", $time, 
            logic_shift_1.data_in,
            logic_shift_1.shift_bit_num,
            logic_shift_1.is_right_shift,
            logic_shift_1.data_out);
    end

    // simulation end
    initial begin
        #(CLOCK_CYCLE*SIMULATION_PERIOD) $finish;
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


    logic_shift #(
        .BIT_NUM       (BIT_NUM         ),
        .SHIFT_BIT_NUM (SHIFT_BIT_NUM   )
    ) logic_shift_1 (
        .data_in        (data_in        ),
        .shift_bit_num  (shift_bit_num  ),
        .is_right_shift (is_right_shift ),
        .data_out       (data_out       )
        );

endmodule