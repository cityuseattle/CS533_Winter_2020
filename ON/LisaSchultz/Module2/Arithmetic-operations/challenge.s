            .data
sumOfNums:  .asciiz "sum of numbers: "
divOfNums:  .asciiz "\ndiv of numbers is: "
mulOfNums:  .asciiz "\nmul of numbers is: "
            .text

main:
            li      $t1, 30
            li      $t2, 5

            li      $v0, 4
            la      $a0, sumOfNums  # print string
            syscall
            
            add     $t3, $t1, $t2   # t3 = t1 + t2
            add     $a0, $t3, 7     # a0 = t3 + t7
            li      $v0, 1          # print int
            syscall

            li      $v0, 4
            la      $a0, divOfNums  # print string
            syscall

            div     $t1, $t2        # $t1/$t2
            mflo    $a0             # a0 = t1 / t2
            li      $v0, 1          # print int
            syscall

            li      $v0, 4
            la      $a0, mulOfNums  # print string
            syscall

            mult    $t1, $t2       
            mflo    $a0             # we mult small numbers so we used mflo to see the result, a0 = t1 * t2
            li      $v0, 1          # print int
            syscall

            li      $v0, 10
            syscall
