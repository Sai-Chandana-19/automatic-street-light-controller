`timescale 1ns/1ps

module automatic_street_light_controller_tb;

reg clk;
reg reset;
reg night;
reg motion;

wire street_light;

automatic_street_light_controller uut (
    .clk(clk),
    .reset(reset),
    .night(night),
    .motion(motion),
    .street_light(street_light)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    $monitor(
        "Time=%0t | Night=%b | Motion=%b | Street Light=%b",
        $time,
        night,
        motion,
        street_light
    );

    clk    = 1'b0;
    reset  = 1'b1;
    night  = 1'b0;
    motion = 1'b0;

    // Reset
    #10;
    reset = 1'b0;

    // Daytime, no motion
    #10;
    night  = 1'b0;
    motion = 1'b0;

    // Daytime, motion detected
    #10;
    night  = 1'b0;
    motion = 1'b1;

    // Night, no motion
    #10;
    night  = 1'b1;
    motion = 1'b0;

    // Night, motion detected
    #10;
    night  = 1'b1;
    motion = 1'b1;

    // Motion stops
    #10;
    motion = 1'b0;

    // Daytime
    #10;
    night  = 1'b0;

    #10;

    $finish;

end

endmodule