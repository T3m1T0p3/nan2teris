// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
    @SCREEN
    D=A
    @addr
     M=D 
    @8192
     D=A
    @i
     M=D
    @KBD
     D=M
     @PAINT
      D;JNE
     @CLEAR
      D;JEQ
      @LOOP
       0;JMP

(PAINT)
    @i
     D=M
    @LOOP
     D;JEQ
    @addr
     A=M
     M=-1
    @addr
     M=M+1
    @i
     M=M-1
    @PAINT
     0;JMP
    
(CLEAR)
    @i
     D=M
    @LOOP
     D;JEQ
    @addr
     A=M
     M=0
    @addr
     M=M+1
    @i
     M=M-1
    @CLEAR 
     0;JMP     