.data # variables
    newline: .asciiz "\n"

    prompt: .asciiz "Enter age in years > "
    youAre: .asciiz "You are "
    daysOld: .asciiz " days old."

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
    
    # multiply input to 365, store to $t1
    mul $t1, $t0, 365
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display youAre
    li $v0, 4
    la $a0, youAre
    syscall
    
    # display product from $t1
    li $v0, 1
    move $a0, $t1
    syscall
    
    # display daysOld
    li $v0, 4
    la $a0, daysOld
    syscall
    
    # exit program
    li $v0, 10
    syscall