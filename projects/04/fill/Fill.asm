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


(INFINITE_LOOP)
    @KBD
    D=M
    @INFINITE_LOOP
    D;JEQ

    @1024 //number of pixels
    D=A
    @numPix
    M=D
    @i
    M=1
    @SCREEN
    D=A
    @tmpPosition
    M=D //set to the first pixel
(LOOP)
    @i
    D=M //D=i
    @numPix
    D=D-M //D = i-numPix
    @END
    D;JGT // if(i-numPixels)>0 goto END
    @tmpPosition
    A=M
    M=1 //paint pixel black
    @tmpPosition
    M=M+1
    @i
    M=M+1 //i++
    @LOOP
    0;JMP // goto LOOP
(END)

@INFINITE_LOOP
0;JMP