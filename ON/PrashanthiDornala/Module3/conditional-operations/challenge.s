main:
        li		$t0, 2          #t0=2
        li      $t1, 5          #t1=5

        blt     $t0,$t1,if_statm    #if t0<t1 is true then jumps to if_statm
        j end
        
if_statm:
        add     $t2,$t0,$t1         # add a0=t0+t1
        move    $a0,$t2

        li      $v0,1
        syscall
        j end
end:
        li      $v0,10
        syscall