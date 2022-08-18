// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)
    @KBD   //Acquire keyyboard
     D=M
    @clr
     D;JEQ  //Clear screen if KBD==0
    @color
     0;JMP  //Paint screen if KBD!=0
     @LOOP
      0;JMP

(clr) //Clear screen iteratively
    @SCREEN
     D=A
    @addr
    M=D
    @8192
    D=A
    @i
    M=D
    (CLEAR)
    @i
    D=M
    @LOOP
     D;JLE
    @addr
     A=M
     M=0
    @addr
     M=M+1
    @i
    M=M-1
    @CLEAR
     0;JMP
     
(color)//Call the pain routine
    @SCRLOOP
    0;JMP    


(SCRLOOP)//Paint routine
    @SCREEN
     D=A
    @addr
    M=D
    @8192
    D=A
    @i
    M=D
    (DRAW)
    @i
    D=M
    @LOOP
     D;JLE
    @addr
     A=M
     M=-1
    @addr
     M=M+1
    @i
    M=M-1
    @DRAW
     0;JMP
