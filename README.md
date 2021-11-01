# compiler_lab1
Course project 1 from USTC Principle of Compiler, 2021.  

## Details 
针对以下文法：
E -> E '>' E  
\| E '<' E  
\| number  
设计 YACC 描述文件并运行，使之能计算诸如 1 \< 2 \< 3 的表达式值为 True；而计算表达
式 1 < 5 \> 3 的值也为 True。

