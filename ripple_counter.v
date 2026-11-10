`timescale 1ns/1ps

// 3-stage ripple counter (divide-by-8)
// Each stage is a T-FF clocked by the previous stage's Q
module ripple_counter (
    input  wire clk,   // btnC
    input  wire rst,   // btnU, active-high
    output wire [2:0] q
);
    // Stage 0: toggles on every rising edge of clk
    tff t0 (
        .clk(clk),
        .rst(rst),
        .t  (1'b1),
        .q  (q[0])
    );

    // Stage 1: toggles on rising edge of q[0]
    tff t1 (
        .clk(q[0]),
        .rst(rst),
        .t  (1'b1),
        .q  (q[1])
    );

    // Stage 2: toggles on rising edge of q[1]
    tff t2 (
        .clk(q[1]),
        .rst(rst),
        .t  (1'b1),
        .q  (q[2])
    );
endmodule