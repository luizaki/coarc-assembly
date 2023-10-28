.data # variables
    newline: .asciiz "\n"

    # prompt messages
    char_prompt: .asciiz "Enter a character > "
    float_prompt: .asciiz "Enter a float > "
    double_prompt: .asciiz "Enter a double > "
    
    # output messages
    char_output: "Entered character is "
    float_output: "Entered float is "
    double_output: "Entered double is "

.text # instructions
    main:
    # -------- inputs --------
    
    # display char_prompt
    li $v0, 4                                              # load service to ready writing a string (4)
    la $a0, char_prompt                                    # load char_prompt
    syscall
    
    # read char from input
    li $v0, 12                                             # load service to ready reading a char (12)
    syscall
    move $t0, $v0                                          # move read char to register
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display float_prompt
    li $v0, 4                                              # load service to ready writing a string (4)
    la $a0, float_prompt                                   # load float_prompt
    syscall
    
    # read float from input
    li $v0, 6                                              # load service to ready reading a float (6)
    syscall
    mfc1 $t1, $f0                                          # move read float in coproc1 to register
    
    # display double_prompt
    li $v0, 4                                              # load service to ready writing a string (4)
    la $a0, double_prompt                                  # load double_prompt
    syscall
    
    # read double from input
    li $v0, 7                                              # load service to ready reading a double (7)
    syscall
    mfc1.d $t2, $f0                                        # move read double in coproc1 to register
    
    # -------- displays --------
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display char output msg
    li $v0, 4                                              # load service to ready writing a string (4)
    la $a0, char_output                                    # load char_output
    syscall
    
    # display char input from $t0
    li $v0, 11                                             # load service to ready writing a char (11)
    move $a0, $t0                                          # move $t0 to $a0 to print char
    syscall
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display float output msg
    li $v0, 4                                              # load service to ready writing a string (4)
    la $a0, float_output                                   # load float_output
    syscall
    
    # display float input from $t1
    li $v0, 2                                              # load service to ready writing a float (2)
    mtc1 $t1, $f12                                         # move $t1 to $f12 to print float
    syscall
    
    # newline buffer
    li $v0, 4
    la $a0, newline
    syscall
    
    # display double output msg
    li $v0, 4                                             # load service to ready writing a string (4)
    la $a0, double_output                                 # load double_output
    syscall
    
    # display double output from $t2
    li $v0, 3                                             # load service to ready writing a float (3)
    mtc1.d $t2, $f12                                      # move $t2 to $f12 to print float
    syscall
    
    # end program
    li $v0, 10
    syscall
