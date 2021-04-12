`timescale 1ps/1ps

module test_add();
    parameter CLOCK_CYCLE = 100;
    parameter BIT_NUM = 4;
    parameter COUNTER_BIT_NUM = 4 * 2;
    parameter SIMULATION_PERIOD = 500;

    // signal defenition
    reg clk;
    reg reset;
    reg  [COUNTER_BIT_NUM -1:0] counter;
    wire [BIT_NUM-1:0]          A  ;
    wire [BIT_NUM-1:0]          B  ;
    wire [BIT_NUM-1:0]          O  ;
    wire                        C;
    assign A   = counter[BIT_NUM-1:0];
    assign B   = counter[2*BIT_NUM-1:BIT_NUM];

    // dump wave file
    initial begin
        $dumpfile("tmp/dump.vcd");
        $dumpvars(0, add_1);
    end

    // monitor
    initial begin
        $monitor ("[%t] A=%d, B=%d => O=%d C=%d", $time, 
            add_1.A,
            add_1.B,
            add_1.O,
            add_1.C);
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


add #(
    .BIT_NUM (BIT_NUM)
)add_1(
    .A  (  A  ),
    .B  (  B  ),
    .O  (  O  ),
    .C  (  C  )
);

endmodule