        .data
n1:     .asciiz "\n"
        .text

main:
        li  $t0,2
        li  $t1,7
        li  $t2,5
        li  $t3,8

        add     $a0, $t0, $t3
        li      $v0, 1
        syscall

        li  $v0, 4
        la  $a0, n1     #newline
        syscall

        addi    $a0, $t2, 17    # $a0 = t2 + 17
        li      $v0, 1
        syscall

        li  $v0, 4
        la  $a0, n1     #newline
        syscall

        sub     $a0, $t0, $t1
        li      $v0, 1
        syscall

        li  $v0, 4
        la  $a0, n1     #newline
        syscall

        mult    $t1,$t2

        mflo    $a0
        li      $v0, 1
        syscall

        li  $v0, 4
        la  $a0, n1     #newline
        syscall

        div     $t1, $t2    # Hi = Remainder, Lo = Quotient = $t1 / $t2
        mflo    $a0
        li      $v0, 1
        syscall

        li  $v0, 4
        la  $a0, n1     #newline
        syscall

        mfhi    $a0     # Copy the remainder from Hi to $a0
        li      $v0, 1
        syscall

        li  $v0, 4
        la  $a0, n1     #newline
        syscall

        rem     $a0, $t1, $t0   #another way to get remainder a0 = t1%t0
        li      $v0, 1
        syscall

        li  $v0, 4
        la  $a0, n1     #newline
        syscall

        li  $v0, 10
        syscall