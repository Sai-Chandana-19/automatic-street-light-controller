module automatic_street_light_controller (
    input  clk,
    input  reset,
    input  night,
    input  motion,
    output reg street_light
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        street_light <= 1'b0;
    end
    else begin
        // Street light ON only at night
        // Motion is used to turn the light ON during night

        if (night && motion)
            street_light <= 1'b1;
        else
            street_light <= 1'b0;
    end
end

endmodule