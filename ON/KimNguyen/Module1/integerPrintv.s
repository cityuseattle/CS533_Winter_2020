main:
li $v0, 1 #print_int [$v0 = register, 1 = system code]
li $a0, 17 #li = load immediate
syscall

li $v0, 10 #exit
syscall