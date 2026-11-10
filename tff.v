`timescale 1ns / 1ps
module tff(
    input  wire clk,
    input  wire rst,   // active-high reset
    input  wire t,     // toggle enable (usually tied high)
    output wire q
);
    wire d;
    // T=1 -> d = ~q ; T=0 -> d = q   (that's just q XOR t)
    xor (d, q, t);

    dff u_dff (
        .clk(clk),
        .rst(rst),
        .d  (d),
        .q  (q)
    );
endmodule