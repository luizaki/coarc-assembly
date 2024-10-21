.data # variables
    newline:        .asciiz "\n"
    
    exchangeRate:    .float 0.017999, 0.016504, 0.024694, 2.691328, 23.312316
    currencies:      .asciiz " USD"
                     .asciiz " EUR"
                     .asciiz " CAD"
                     .asciiz " JPY"
                     .asciiz " KRW"
    prompt:          .asciiz "Enter value in peso > "
    resultMsg:       .asciiz "\nThe following are the values of the input in peso:\n"
    
    convertAgainMsg: .asciiz "Convert again? Type 'Y' if so and any other character otherwise > "
    confirmInput:    .space 16
    
    exitMsg:         .asciiz "\nExiting program."

.text
    main:
        # display prompt
        li $v0, 4
        la $a0, prompt
        syscall

        # read float input, store to $f1
        li $v0, 6
        syscall
        mov.s $f1, $f0

        # load initial exchangeRate and currencies to $t1 and $t2
        la $t1, exchangeRate
        la $t2, currencies

        # initialise loop counter, stored to $t0
        li $t0, 0
        
        # display resultMsg
        li $v0, 4
        la $a0, resultMsg
        syscall
    
    conversionLoop:
        # loop condition, end loop if counter > 4
        bgt $t0, 4, runAgain

        # load exchangeRate to $f1
        lwc1 $f2, 0($t1)
    
        # mul input and exchangeRate, store to $f2
        mul.s $f3, $f1, $f2
    
        # display converted
        li $v0, 2
        mov.s $f12, $f3
        syscall
        
        # display currency label
        li $v0, 4
        la $a0, 0($t2)
        syscall
    
        # newline buffer
        li $v0, 4
        la $a0, newline
        syscall
    
        # move to the next part of array by incrementing
        addi $t1, $t1, 4 # exchangerate
        addi $t2, $t2, 5 # currencies
    
        # increment loop counter
        addi $t0, $t0, 1
    
        # jump back from start of conversionLoop
        j conversionLoop

    runAgain:
        # display prompt to convert again
        li $v0, 4
        la $a0, convertAgainMsg
        syscall
        
        # read String input with 16 max length
        li $v0, 8
        li $a1, 16
        la $a0, confirmInput
        syscall
        
        # retrieve char byte, store to $t3
        lb $t3, 0($a0)
        
        li $v0, 4
        la $a0, newline
        syscall
        
        # if char is equal to 'Y' (ascii 89), reset values
        beq $t3, 89, main
        
    exit:
        li $v0, 4
        la $a0, exitMsg
        syscall
        
        li $v0, 10
        syscall
