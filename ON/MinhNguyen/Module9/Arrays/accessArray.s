            .data
array1:     .space  20      # declare 20 bytes of storage for 5 integers
            .text

main:
            la      $t0, array1     # load base address of array to t0

            li      $t1, 3          # t1 = 3 
            sw      $t1, ($t0)      # store word t1 to t0 address

            li      $t1, 5          # t1 =5
            sw      $t1, 4($t0)     # store word t1 to t0 at address 4

            li      $t1, 6
            sw      $t1, 8($t0)     # store word t1 to t0 at address 8

            li      $t1, 8
            sw      $t1, 12($t0)    # store word t1 to t0 at address 12

            li      $t1, 10
            sw      $t1, 16($t0)    # store word t1 to t0 at address 16

            li      $v0, 1
            lw      $a0, 8($t0)     # a0 = element at address 8 in t0
            syscall

            li      $v0, 10
            syscall