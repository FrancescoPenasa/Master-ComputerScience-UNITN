# lab 6
- homework-5
- call stack example
- exercises
    + buffer overflow

## homework-5
$(1500 * x + 1200) mod 2^(32) = 0$

to mitigate we can use "library big number"


## call stack
(when calling a function how stack frame grows.)
registries
- ESP -> pointer to the last thing pushed on the stack
- EIP -> pointer to the next instruction
- EBP -> address of the frame's base

when we call a function 
- we push on the stack the arguments
- we move the EIP
- we push on the stack the function
- 


the stack grows from 0xFFFF to 0x0000
the buffer grows from 0xXXX to 0xXXX+len(buffer)