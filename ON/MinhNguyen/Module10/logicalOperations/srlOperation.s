main:

li  $t1, 7          #111

srl $t2, $t1, 1     #shift by 1, t2 = 011 which is 3 in decimal 

li  $v0, 1
move    $a0, $t2
syscall

li  $v0, 10
syscall