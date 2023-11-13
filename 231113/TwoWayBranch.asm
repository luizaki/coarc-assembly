.data
    result: .asciiz "x is "

.text
    main:
        li $s1, 1  # a
        li $s2, 2  # b
        li $s3, 3  # c
        li $s4, 4  # d
        
        # if (a > b)
        blt $s1, $s2, true
        
        # else        
        # a + b, store to $t0
        add $t0, $s1, $s2
        
        # c * d, store to $t1
        mul $t1, $s3, $s4
        
        # (a + b) - (c * d), store to $s5
        sub $s5, $t0, $t1
        
        # display result and exit
        j finally
        
    true:
        # c * d, store to $t0
        mul $t0, $s3, $s4
        
        # a + b, store to $t1
        add $t1, $s1, $s2
        
        # a + b - c * d, store to $s5
        sub $s5, $t1, $t0
    
    finally:
        # diplay result msg
        li $v0, 4
        la $a0, result
        syscall
        
        # display x in $s5
        li $v0, 1
        move $a0, $s5
        syscall
        
        # exit
        li $v0, 10
        syscall
