`timescale 1ns / 1ps
module dff (
    input  wire clk,
    input  wire rst,   // active-high asynchronous reset
    input  wire d,
    output reg  q
);
    initial q = 1'b0;  // guards against a time-0 race with rst going X->1

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule