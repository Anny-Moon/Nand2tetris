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
(BLACK_SCREEN)
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
(BLACK)
    @i
    D=M //D=i
    @numPix
    D=D-M //D = i-numPix
    @END_BL
    D;JGT // if(i-numPixels)>0 goto END
    @tmpPosition
    A=M
    M=1 //paint pixel black
    @tmpPosition
    M=M+1
    @i
    M=M+1 //i++
    
    @KBD
    D=M
    @WHITE_SCREEN
    D;JEQ
    @BLACK
    0;JMP // goto BLACK
(END_BL)
(WHITE_SCREEN)
    @i
    M=1
    @SCREEN
    D=A
    @tmpPosition
    M=D //set to the first pixel
(WHITE)
    @i
    D=M //D=i
    @numPix
    D=D-M //D = i-numPix
    @END_WH
    D;JGT // if(i-numPixels)>0 goto END
    @tmpPosition
    A=M
    M=0 //paint pixel black
    @tmpPosition
    M=M+1
    @i
    M=M+1 //i++
    
    @KBD
    D=M
    @BLACK_SCREEN
    D;JNE
    @WHITE
    0;JMP // goto WHITE
(END_WH)

@INFINITE_LOOP
0;JMP