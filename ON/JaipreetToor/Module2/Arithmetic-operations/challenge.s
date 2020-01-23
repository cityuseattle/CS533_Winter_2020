.data

sumMsg:  .asciiz "sum of numbers: "
divMsg:  .asciiz "div of numbers is: "
mulMsg:  .asciiz "mul of numbers is: "
            .text



main:
            
            li      $t1, 30          # t1 is assigned 30
            li      $t2, 5           # t2 is assigned 5

            li      $v0, 4           # print string
            la      $a0, sumMsg      # string is retrived from sumMsg
            syscall
            
            add     $t3, $t1, $t2    # t1 and t2 added
            add     $a0, $t3, 7      # 7 is added to the total
            li      $v0, 1           # print integer
            syscall

            li      $v0, 4           # print string
            la      $a0, divMsg      # string is retrieved from divMsg
            syscall

            div     $t1, $t2        
            mflo    $a0              # t1/t2
            li      $v0, 1           # print integer
            syscall

            li      $v0, 4           # print string
            la      $a0, mulMsg      # message loaded from mulMsg
            syscall

            mult    $t1, $t2       
            mflo    $a0              # t1 * t2
            li      $v0, 1           # print integer
            syscall

            li      $v0, 10         # print integer
            syscall