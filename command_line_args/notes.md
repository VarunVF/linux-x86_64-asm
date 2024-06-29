# Command-Line Arguments
Arguments passed to the program from the command-line are pushed onto the stack. The state of the stack will be as such:

- `argc` - The number of command-line arguments
- `*argv[0]` - The command used to run the program (file path)
- `*argv[1]`
- `*argv[2]`
- `*argv[3]`
- ...
- `*argv[argc - 1]`

The strings are zero-delimited.