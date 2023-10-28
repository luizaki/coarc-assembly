# Sanchez, Francine Louise B. | CS - 202

.data # variables
    newline: .asciiz "\n"
    
    title: .asciiz "[Integer Arithmetic]"

    # prompt messages
    int_prompt1: .asciiz "    Enter first integer > "
    int_prompt2: .asciiz "    Enter second integer > "
    
    # output messages
    sum_msg: .asciiz "The sum is "
    diff_msg: .asciiz "The difference is "
    prod_msg: .asciiz "The product is "
    quot_msg: .asciiz "The quotient is "

.text # instructions
    main:
    
    # -------- inputs --------
    
    # display title
    li $v0, 4
    la $a0, title
    syscall
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display first prompt
    li $v0, 4
    la $a0, int_prompt1
    syscall
    
    # read first int, store in t0
    li $v0, 5
    syscall
    move $t0, $v0
    
    # display second prompt
    li $v0, 4
    la $a0, int_prompt2
    syscall
    
    # read second int, store in t1
    li $v0, 5
    syscall
    move $t1, $v0
    
    # -------- computations --------
    
    # addition, store in $t2
    add $t2, $t0, $t1
    
    # subtraction, store in $t3
    sub $t3, $t0, $t1
    
    # multiplication, store in $t4
    mul $t4, $t0, $t1
    
    # division, store in $t5
    div $t5, $t0, $t1
    
    # -------- displays --------
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display sum msg
    li $v0, 4
    la $a0, sum_msg
    syscall
    
    # display sum
    li $v0, 1
    move $a0, $t2
    syscall
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display difference msg
    li $v0, 4
    la $a0, diff_msg
    syscall
    
    # display difference
    li $v0, 1
    move $a0, $t3
    syscall
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display product msg
    li $v0, 4
    la $a0, prod_msg
    syscall
    
    # display product
    li $v0, 1
    move $a0, $t4
    syscall
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display quotient message
    li $v0, 4
    la $a0, quot_msg
    syscall
    
    # display quotient
    li $v0, 1
    move $a0, $t5
    syscall
    
    # exit program
    li $v0, 10
    syscall
