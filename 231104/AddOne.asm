.data # variables
    newline: .asciiz "\n"

    prompt: .asciiz "Enter an integer > "
    result: .asciiz "The result of "
    plus: .asciiz " plus "
    is: .asciiz " is "

.text # instructions
    main:
    
    # display prompt
    li $v0, 4
    la $a0, prompt
    syscall
    
    # read integer input
    li $v0, 5
    syscall
    
    # store int input to $t0
    move $t0, $v0
    
    # add 1 to input, store to $t1
    add $t1,$t0, 1
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display result msg
    li $v0, 4
    la $a0, result
    syscall
    
    # display initial input
    li $v0, 1
    move $a0, $t0
    syscall
    
    # display "plus"
    li $v0, 4
    la $a0, plus
    syscall
    
    # display 1
    li $v0, 1
    la $a0, 1
    syscall
    
    # display "is"
    li $v0, 4
    la $a0, is
    syscall
    
    # display sum from $t1
    li $v0, 1
    move $a0, $t1
    syscall
    
    # exit program
    li $v0, 10
    syscall