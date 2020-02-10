            .data
array1:     .space 20       # declare 20 bytes of storage to hold array of 5 integers
            .text

main:
    la		$t0, array1     # load base address of array into reg t0

    li		$t1, 3          # t1 = 3
    sw		$t1, ($t0)      # first array element set to 5, indirect addressing

    li      $t1, 5          # t1 = 5
    sw      $t1, 4($t0)     # second array element set to 5

    li      $t1, 6          # t1 = 6
    sw      $t1, 8($t0)     # third array element set to 6

    li      $t1, 8          # t1 = 8
    sw      $t1, 12($t0)    # fourth array element set to 8

    li      $t1, 10         # t1 = 10
    sw		$t1, 16($t0)    # fifth array element set to 10

    li      $v0, 1
    lw		$a0, 8($t0)     # a0 = the element that exists in 8($t0)
    syscall

    li      $v0, 10
    syscall
