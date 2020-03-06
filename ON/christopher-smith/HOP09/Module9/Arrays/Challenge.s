                    .data
Sum:              .asciiz "The sum of the array elements is: "
X:                  .word 3, 2, 1, 8, 6
N:                  .word 5
                    .text

arr_square:
            li        $t0, 0              #t0=0 loop
            li        $t1, 0              #$t1=0 to access the memory location

            la        $a0, Sum            #load Sum string
            li        $v0, 4              #print string
            syscall

loop:
            bge       $t0, $a1, final     #if $t0 >= $a1
            lw        $a0, X($t1)         #$a0 = X(i)

            add       $t2, $t2, $a0       # sum will equal sum plust list(i)

            addi      $t1, $t1, 4
            addi      $t0, $t0, 1         #$t0=$t0+1
            j         loop                #will go to the loop

final:
            move      $a0, $t2            #Move sum to $a0
            li        $v0, 1              #Print integer
            syscall
            jr        $ra

main:
            la        $a0, X              #$a0=load address of array X
            lw        $a1, N              #$a1=5 --number elements
            jal       arr_square          #call arr_square
            li        $v0, 10             #exit program
            syscall
