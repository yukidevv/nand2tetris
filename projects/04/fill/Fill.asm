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
  @i //Counter
  M=0
  @KBD
  D=M

  @BLACK_FILL
  D;JNE // !=0 キーボード入力があればBLACK_FILLへ
  @WHITE_FILL
  D;JEQ// =0 キーボード入力なければWHITE_FILLへ

(BLACK_FILL)
  @SCREEN
  D=A

  @i
  A=D+M //0x16384~
  M=-1 //0xffff(1の補数)

  @i
  M=M+1
  D=M
  @8192
  D=D-A //i-8192
  @BLACK_FILL
  D;JLT // <0
  @LOOP
  0;JMP

(WHITE_FILL)
  @SCREEN
  D=A

  @i
  A=D+M
  M=0 //0x0000

  @i
  M=M+1
  D=M
  @8192
  D=D-A //i-8192
  @WHITE_FILL
  D;JLT // <0
  @LOOP
  0;JMP