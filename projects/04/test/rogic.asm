@i //iはメモリの特定箇所。A=i
M=1 //Memory[i]=1
@sum //sumはメモリの特定箇所。A=sum
M=0  //Memory[sum]=0

(LOOP)
  @i // A=i
  D=M // D=i
  @100 //A=100
  D=D-A //D=i-100
  @END
  D;JGT //if(i-100)>0 goto END
  @i //A=i
  D=M //D=i
  @sum //A=sum
  M=D+M //i+sum
  @i
  M=M+1
  @LOOP
  0;JMP
(END)
  @END
  0;JMP
  