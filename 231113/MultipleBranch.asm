.data # variables
    prompt: .asciiz "Enter an integer > "    
    
    posMsg: .asciiz "Inputted integer is positive."
    negMsg: .asciiz "Inputted integer is negative."
    zeroMsg: .asciiz "Inputted integer is zero."

.text
    main:
        # display prompt
        li $v0, 4
        la $a0, prompt
        syscall
        
        # read integer
        li $v0, 5
        syscall
        move $t0, $v0
        
        # if input > 0, move to positive
        bgtz $t0, positive
        
        # else if input < 0, move to negative
        bltz $t0, negative
        
        # else if input = 0, move to zero
        beqz $t0, zero
        
        # jump to exit when done
        j exit
    
    positive:
        # display positive
        li $v0, 4
        la $a0, posMsg
        syscall
        
        # exit when done
        j exit
    
    negative:
        # display negative
        li $v0, 4
        la $a0, negMsg
        syscall
        
        # exit when done
        j exit
    
    zero:
        # display zero
        li $v0, 4
        la $a0, zeroMsg
        syscall
    
    exit:
        li $v0, 10
        syscall