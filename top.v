`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: top
// Project Name: lab 11
//////////////////////////////////////////////////////////////////////////////////


module top(
input  wire  btnC,   // clock
    input  wire btnU,   // reset (active-high)
    output wire [6:0] led
);
    // Ripple counter (divide-by-8)
    wire [2:0] rc_state;
    ripple_counter rc (
        .clk(btnC),
        .rst(btnU),
        .q  (rc_state)
    );

    // Modulo-6 counter
    wire [2:0] mc_state;
    wire       mc_out;
    modulo_counter mc (
        .clk   (btnC),
        .rst   (btnU),
        .state (mc_state),
        .mc_out(mc_out)
    );

   
    // led[2:0] = rc_state
    // led[5:3] = mc_state
    // led[6]   = mc_out
    assign led = {mc_out, mc_state, rc_state};
endmodule
