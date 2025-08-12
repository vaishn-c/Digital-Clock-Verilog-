module digital_clock(clk, reset, hours, minutes, seconds);
    input clk, reset;
    output reg [4:0] hours;
    output reg [5:0] minutes, seconds;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hours <= 0;
            minutes <= 0;
            seconds <= 0;
        end else begin
            if (seconds == 59) begin
                seconds <= 0;
                if (minutes == 59) begin
                    minutes <= 0;
                    if (hours == 23)
                        hours <= 0;
                    else
                        hours <= hours + 1;
                end else begin
                    minutes <= minutes + 1;
                end
            end else begin
                seconds <= seconds + 1;
            end
        end
    end
endmodule
