        .data
nl:     .asciiz "\n"
sumNum: .asciiz "sum of numbers: "
divNum: .asciiz "div of numbers is: "
mulNum: .asciiz "mul of numbers is: "
        .text

main:
        li      $t1, 30                 # $t1=30
        li      $t2, 5                  # $t2=5
        
        li      $v0, 4                  # print integer       
        la      $a0, sumNum             # print sum of numbers: string
        syscall                         # print the result of the addition

        add     $t3, $t1, $t2           # t1 and t2 added and put in t3     
        add     $a0, $t3, 7             # add t3 and 7
        li      $v0, 1                  # print integer
        syscall

        li      $v0, 4
        la      $a0, nl                 # print new line
        syscall

        li      $v0, 4                  # print string
        la      $a0, divNum             # print div of numbers: string
        syscall

        div     $t1, $t2
        mflo    $a0                     # divide t1 / t2
        li      $v0, 1                  # print integer
        syscall

        li      $v0, 4
        la      $a0, nl                 # print new line
        syscall
        
        li      $v0, 4                  # print string
        la      $a0, mulNum             # print mul of numbers: string
        syscall

        mult    $t1, $t2
        mflo    $a0                     # t1 * t2
        li      $v0, 1                  # print
        syscall			

        li $v0, 10
        syscall