# Math Operations, ASCII, and the Stack


## Math Operations

| Operation Name | Signed |
| -------------- | ------ |
| `add`          | -      |
| `sub`          | -      |
| `mul`          | `imul` |
| `div`          | `idiv` |
| `neg`          | -      |
| `inc`          | -      |
| `dec`          | -      |
| `adc`          | -      |
| `sbb`          | -      |


**ASCII:**
Computers can only store numbers, so ASCII works by mapping numbers to specific characters.
ASCII uses 7-bit binary codes to represent characters, however modern computers support extended ASCII, which are 8-bit (1 byte) binary codes.


**The stack:**
Another way of temporarily storing data other than registers.
**push:** add data on top of the stack
**pop:** remove data from the top of the stack
**peek:** check the value on the top of the stack without adding or removing to it