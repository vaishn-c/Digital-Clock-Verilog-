module tb_digital_clock;
    reg clk, reset;
    wire [4:0] hours;
    wire [5:0] minutes, seconds;

    digital_clock uut(clk, reset, hours, minutes, seconds);

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end

    initial begin
        reset = 1; #5;
        reset = 0;
        #200 $stop;
    end
endmodule
