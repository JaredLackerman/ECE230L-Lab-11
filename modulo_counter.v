`timescale 1ns/1ps

// 3-bit modulo-6 counter
// Counts 0 -> 1 -> 2 -> 3 -> 4 -> 5 -> 0 ...
// Toggles mc_out every time it returns to 0 (i.e., every 6 clocks)
module modulo_counter (
    input  wire       clk,   // btnC
    input  wire       rst,   // btnU, active-high
    output wire [2:0] state, // current count
    output wire       mc_out // toggled output
);
    // Next-state adder: state + 1
    wire [2:0] sum;
    wire       c1, c2;

    full_adder fa0 (
        .a   (state[0]),
        .b   (1'b1),
        .cin (1'b0),
        .sum (sum[0]),
        .cout(c1)
    );
    full_adder fa1 (
        .a   (state[1]),
        .b   (1'b0),
        .cin (c1),
        .sum (sum[1]),
        .cout(c2)
    );
    full_adder fa2 (
        .a   (state[2]),
        .b   (1'b0),
        .cin (c2),
        .sum (sum[2]),
        .cout()          // unused
    );

    // Detect count == 5 (101): s2 & ~s1 & s0
    wire n_s1, is_five, n_five;
    not (n_s1, state[1]);
    and (is_five, state[2], n_s1, state[0]);
    not (n_five, is_five);

    // next_state = is_five ? 000 : sum   ->   sum & ~is_five
    wire [2:0] next_state;
    and (next_state[0], sum[0], n_five);
    and (next_state[1], sum[1], n_five);
    and (next_state[2], sum[2], n_five);

    // Three DFFs hold the state
    dff d0 (.clk(clk), .rst(rst), .d(next_state[0]), .q(state[0]));
    dff d1 (.clk(clk), .rst(rst), .d(next_state[1]), .q(state[1]));
    dff d2 (.clk(clk), .rst(rst), .d(next_state[2]), .q(state[2]));

    // Output toggles when is_five: mc_d = mc_out XOR is_five
    wire mc_d;
    xor (mc_d, mc_out, is_five);
    dff dout (.clk(clk), .rst(rst), .d(mc_d), .q(mc_out));
endmodule