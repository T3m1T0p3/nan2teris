// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.
@0
D=A
@R2  //init R2=0
M=D
 
@R0
D=M
@j    //j=R0
M=D

@R1
D=M
@n
M=D  //set n=R1

(LOOP)
    @n
     D=M   //if n=0;end
    @END
     D;JLE
     @j 
      D=M  //fetch R0
      @R2
       M=M+D //Add R0 to R2 n times 
      @n
       M=M-1
      @LOOP
       0;JMP

(END)
    @END 
     0;JMP