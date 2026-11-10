# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names Ashley Johnson and Jared Lackerman 

## Summary
We used the center button on the Basys3 board as our input clock signal and the up button as a reset. Then we implemented a 3-stage ripple counter with T-Flip-Flops to divide the clock by 8. That displays each stage's output on LEDs led[0], led[1], led[2]. Next, we built a modulo counter that counts to 6, toggles output, and resets to divide by 12. This displays the counter's stage bits on LEDs led[3], led[4], and led[5], and the output on led[6]. Then we used our previously built T-flip-flop, full adder, and D-flip-flop modules. Then we verified that the ripple counter divides the input frequency by 8 and the modulo counter divides by 12 by the Basys3 board.
## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
THe modulo counter toggles its output each time it counts to the set value, so it takes two counts(up and down) to complete a full output cycle. This means it divides the clock by 2x count, not just the count value.
### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
The ring counter's output goes all to 1s on the first clock cycle if it starts in a state where all flip-flops are set to 1. Without a defined reset to a single 1 bit and the rests 0s, the flip flops can all be high initially. Proper reset is needed to set only one 1 for correct operation.
### 3 - What width of ring counter would you use to get to an output of ~1KHz?
The width of the ring counter would have to be 17 bit to get close to a 1KHz output frequency.

