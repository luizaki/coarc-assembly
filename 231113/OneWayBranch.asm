.data
    newline: .asciiz "\n"
    
    beforeMsg: .asciiz "Before condition:\n"
    afterMsg: .asciiz "\nAfter condition:\n"
    
    msgA: .asciiz "a = "
    msgB: .asciiz "b = "

.text
    main:
        li $t0, 1  # a
        li $t1, 2  # b
        
        # display beforeMsg
        li $v0, 4
        la $a0, beforeMsg
        syscall
        
        # display initial a
        li $v0, 4
        la $a0, msgA
        syscall
        li $v0, 1
        move $a0, $t0
        syscall
        
        li $v0, 4
        la $a0, newline
        syscall
        
        # display initial b        
        li $v0, 4
        la $a0, msgB
        syscall
        li $v0, 1
        move $a0, $t1
        syscall
        
        # b + 3, store to $t2
        add $t2, $t1, 3
        
        # if (a < b + 3), move true
        blt $t0, $t2, true
        
        # skip to finally after evaluating condition
        j finally
    
    # if (a < b + 3) is TRUE
    true:
        add $t0, $t0, 1
        
    finally:
        add $t1, $t1, $t0  # b = b + a
        
        # display afterMsg
        li $v0, 4
        la $a0, afterMsg
        syscall
        li $v0, 44
        la $a0, newline
        syscall
        
        # display new a
        li $v0, 4
        la $a0, msgA
        syscall        
        li $v0, 1
        move $a0, $t0
        syscall
        
        li $v0, 4
        la $a0, newline
        syscall
        
        # display new b
        li $v0, 4
        la $a0, msgB
        syscall
        li $v0, 1
        move $a0, $t1
        syscall
        
        # exit
        li $v0, 10
        syscall   
