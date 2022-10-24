data SEGMENT ; 定义一个数据段存放hello,world!
    hello DB 'Hello, World!$' ;以$表示结束
data ENDS
code SEGMENT  ; 定义一个代码段存放程序指令
    ASSUME CS:CODE, DS:DATA     ;告诉汇编程序，DS指向数据段，CS指向代码段
start:
    MOV AX, data        ; 将data段首地址赋值给AX
    MOV DS, AX          ; 将AX赋值给DS，使DS指向data段
    LEA DX, hello       ; 使DX指向hello首地址(LEA是取地址指令)
    MOV AH, 09h         ; 给AH设置参数09H，AH是AX高8位，AL是AX低8位，其他类似
    INT 21h             ; 执行DOS中断输出DS指向的DX指向的字符串hello
    MOV AX, 4C00h       ; 给AH设置参数4C00h
    INT 21h             ; 调用4C00h号功能，结束程序
code ENDS
END start