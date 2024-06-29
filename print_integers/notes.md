# _printRAX Subroutine

Example: `rax = #123`

Steps:
1. Divide the number by 10, store the remainder
2. Store remainder as the next digit in the string's memory
3. Set the number to the quotient
4. Repeat from step 1 until number is zero
5. Print the string

This process generates the digits of the number in reverse order.