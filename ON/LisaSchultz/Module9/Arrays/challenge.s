        .data
space:  .asciiz " "
X:      .word 3, 2, 1, 8, 6
N:      .word 5
msg:    .asciiz "The sum of the array elements is: "
        .text

arr_square:
        li		$t0, 0		    # $t0 = 0 loop iterator
        li		$t1, 0		    # $t1 = 0 offset to access the memory location
        li      $t3, 0

loop:
        
        bge		$t0, $a1, final	# if $t0 >= $a1 then final
        lw		$a0, X($t1)		# $a0 = X(i)
        
        add 	$t3, $a0, $t3	
        
        la		$a0, space		# load a space
        li      $v0, 4          # print string
        syscall

        addi	$t1, $t1, 4		# $t1 = $t1 + 4
        addi	$t0, $t0, 1		# $t0 = $t0 + 1
        j		loop			# jump to loop

final:
        la		$a0, msg		# load string 
        li      $v0, 4          # print string
        syscall

        li      $v0, 1          # print integer
        move 	$a0, $t3		# $a0 = $t3 (sum)
        syscall                 # print sum of elements
        
        jr		$ra				# jump to $ra
        
main:
        la		$a0, X		    # $a0 = load address of array X
        lw      $a1, N          # $a1 = 10 number of elements
        jal		arr_square		# jump to arr_square and save position to $ra
        
        li      $v0, 10
        syscall
        
        
        