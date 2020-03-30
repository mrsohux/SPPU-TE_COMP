%{
#include<stdio.h>
%}
%token ID CN SC NL WS
%%
start:ID1 CN ID1 SC NL  {printf("Compound sentence\n"); exit(0);}
|
ID1:ID1 ID|ID;


%%


main()
{

yyparse();


}
void yyerror(const char *str){printf("Simple sentence\n");}

//int yywrap(){return 0;}


/*

mca49@mca49-desktop:~/mayur$ lex compl.l
mca49@mca49-desktop:~/mayur$ yacc -d comp.y
mca49@mca49-desktop:~/mayur$ gcc lex.yy.c y.tab.c -ll
compl.l:13:1: warning: data definition has no type or storage class [enabled by default]
 yylex();
 ^
comp.y: In function ‘yyparse’:
comp.y:6:37: warning: incompatible implicit declaration of built-in function ‘exit’ [enabled by default]
 start:ID1 CN ID1 SC NL  {printf("Compound sentence\n"); exit(0);}
                                     ^
comp.y: At top level:
comp.y:21:6: warning: conflicting types for ‘yyerror’ [enabled by default]
 void yyerror(const char *str){printf("Simple sentence\n");}
      ^
y.tab.c:1254:7: note: previous implicit declaration of ‘yyerror’ was here
       yyerror (YY_("syntax error"));
       ^
mca49@mca49-desktop:~/mayur$ ./a.out
mayur and sriraj are good friends
     Simple sentence
mca49@mca49-desktop:~/mayur$ ./a.out
mayur and sriraj are good friends;
     Compound sentence
mca49@mca49-desktop:~/mayur$ 
*/
