        .data         # expect data
hello:  .asciiz "Hello \n"    # ascii text "Hello \n" at address hello
        .text         # expect code

main:                 # label for main entry
        li $v0, 4     # load immediate with system call 4 for string
        la $a0, hello # v0 prints loaded string from a0 from address hello
        syscall       # notify OS

        li $v0, 1     # load immediate with system call 1 for integer
        li $a0, 2020  # v0 prints integer stored in address a0
        syscall       # notify OS

        li $v0, 10    # load immediate with system call 10 to exit
        syscall       # notify OS