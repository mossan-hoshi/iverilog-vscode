`timescale 1ps/1ps

module test_sub1bit_half();
    parameter CLOCK_CYCLE = 100;
    parameter COUNTER_BIT_NUM = 2;
    parameter SIMULATION_PERIOD = 500;

    // signal defenition
    reg clk;
    reg reset;
    reg  [COUNTER_BIT_NUM -1:0] counter;
    wire  A;
    wire  B;
    wire  O;
    wire  Borrow;
    assign A = counter[0];
    assign B = counter[1];

    // dump wave file
    initial begin
        $dumpfile("tmp/dump.vcd");
        $dumpvars(0, sub1bit_half_1);
    end

    // monitor
    initial begin
        $monitor ("[%t] A=%d, B=%d => O=%d Borrow=%d", $time, 
            sub1bit_half_1.A,
            sub1bit_half_1.B,
            sub1bit_half_1.O,
            sub1bit_half_1.Borrow);
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


    sub1bit_half sub1bit_half_1 (
        .A      (A     ),
        .B      (B     ),
        .O      (O     ),
        .Borrow (Borrow)
        );

endmodule