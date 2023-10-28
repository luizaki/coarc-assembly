.data # variables
    newline: .asciiz "\n"
    whitespace: .asciiz " "

    # prompt messages
    name_prompt: .asciiz "Enter the product name > "
    price_prompt: .asciiz "Enter the product price > "
    quant_prompt: .asciiz "Enter the product quantity > "
    
    name: .space 32
    
    # output messages
    total_msg: .asciiz "Total price : Php "
    for: .asciiz " for "

.text # instructions
    main:
    
    # -------- inputs --------
    
    # display name_prompt
    li $v0, 4
    la $a0, name_prompt
    syscall
    
    # read name with max 32 byte length, store in name
    li $v0, 8
    la $a0, name
    li $a1, 32
    syscall
    
    # display price_prompt
    li $v0, 4
    la $a0, price_prompt
    syscall
    
    # read price, store in t0
    li $v0, 6
    syscall
    mfc1 $t0, $f0
    
    # display quant_prompt
    li $v0, 4
    la $a0, quant_prompt
    syscall
    
    # read quantity, store in t1
    li $v0, 5
    syscall
    move $t1, $v0
    
    # -------- computation -------
    
    # f1 = t1 (quant), f2 = t1 converted, f3 = t0 (price)
    
    # convert quant to float
    mtc1 $t1, $f1
    cvt.s.w $f2, $f1
    
    # store price (t0) to f3 register
    mtc1 $t0, $f3
    
    # multiply quantity and price
    mul.s $f4, $f2, $f3
    
    # store product in t2
    mfc1 $t2, $f4
        
    # -------- displays --------
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display total_msg
    li $v0, 4
    la $a0, total_msg
    syscall
    
    # display total    
    li $v0, 2
    mtc1 $t2, $f12
    syscall
    
    # display "for [quant] [name]"
    li $v0, 4
    la $a0, for
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    li $v0, 4
    la $a0, whitespace
    syscall
    li $v0, 4
    la $a0, name
    syscall
    
    # exit program
    li $v0, 10
    syscall
