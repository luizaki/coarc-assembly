.data # variables
    equal: .asciiz " = "
    minus: .asciiz " - "
    divide: .asciiz " / "
    plus: .asciiz " + "
    times: .asciiz " * "

.text #instructions
    # placing numbers to each register
    li $s1, 10 # a = 10
    li $s2, 6  # b = 6
    li $s3, 2  # c = 2
    li $s4, 50 # d = 50
    li $s5, 1  # e = 1
    li $s6, 5  # f = 5
    
    # b / c, store to $t0
    div $t0, $s2, $s3
    
    # d * e, store to $t1
    mul $t1, $s4, $s5
    
    # (d * e) / f, store to $t2
    div $t2, $t1, $s6
    
    # a - (b / c), store to $t3
    sub $t3, $s1, $t0
    
    # (a - (b / c)) + ((d * e) / f), store to $s0
    add $s0, $t3, $t2
    
    # ---display expression and result---
    
    li $v0, 1        # x
    move $a0, $s0
    syscall
    
    li $v0, 4        # =
    la $a0, equal
    syscall
    
    li $v0, 1       # a
    move $a0, $s1
    syscall
    
    li $v0, 4       # -
    la $a0, minus
    syscall
    
    li $v0, 1       # b
    move $a0, $s2
    syscall
    
    li $v0, 4       # /
    la $a0, divide
    syscall
    
    li $v0, 1       # c
    move $a0, $s3
    syscall
    
    li $v0, 4       # +
    la $a0, plus
    syscall
    
    li $v0, 1       # d
    move $a0, $s4
    syscall
    
    li $v0, 4       # *
    la $a0, times
    syscall
    
    li $v0, 1       # e
    move $a0, $s5
    syscall
    
    li $v0, 4       # /
    la $a0, divide
    syscall
    
    li $v0, 1       # f
    move $a0, $s6
    syscall
    
    # exit program
    li $v0, 10
    syscall