// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
	@white
	M=0
	D=-1
	@black
	M=D
	@cursor
	0;JMP
(LOOP)
	@keyboard
	D=M
	@black
	D;JNE
	@white
	0;JMP
(DRAW)
	@col
	D=M
	@cur
	A=M
	M=D
	@cur
	M=M+1
	@24576
	D=A
	@cur
	D=D-M
	@cursor
	D;JLE
	@LOOP
	0;JMP
(black)
	@blackcol
	D=M
	@col
	M=D
	@DRAW
	0;JMP
(cursor)
	@screen
	D=A
	@cur
	M=D
	@LOOP
	0;JMP
