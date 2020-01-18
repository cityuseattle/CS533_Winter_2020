.data
prompt: .asciiz "Enter an integer: "
respon: .asciiz "You entered "
endl:   .asciiz "\n"
.text

main:
    li $v0, 4      #load immediate for string
    la $a0, prompt #load address for asciiz prompt
    syscall        #look at me

    li $v0, 5      #load immediate for input
    syscall        #look at me, receive input
    move $t0, $v0  #take input from $v0 and put it in temporary register $t0

    li $v0, 4      #ready for string
    la $a0, respon #load address for asciiz respon
    syscall        #look at me

    li $v0, 1      #load immediate for integer
    move $a0, $t0  #move stored int in $t0 but $a0
    syscall        #look at me

    li $v0, 4      #load immediate for string
    la $a0, endl   #load address for asciiz endl (newline)
    syscall        #look at me

    li $v0, 10     #load immediate for end
    syscall        #time to end