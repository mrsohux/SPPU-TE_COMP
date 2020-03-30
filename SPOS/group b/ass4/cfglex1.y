%{
#include<stdio.h>
%}
%token ID BUILTIN SC NL COMMA
%%
start:BUILTIN varlist SC NL  {printf("valid");}
|
varlist:varlist COMMA ID|ID;


%%
void yyerror(const char *str){printf("error");}
int yywrap(){return 0;}
main()
{
yyparse();
}
/*

mca49@mca49-desktop:~/mayur$ lex cfglex.l
mca49@mca49-desktop:~/mayur$ yacc -d cfglex1.y
mca49@mca49-desktop:~/mayur$ gcc lex.yy.c y.tab.c -ll
cfglex1.y:12:6: warning: conflicting types for ‘yyerror’ [enabled by default]
 void yyerror(const char *str){printf("error");}
      ^
y.tab.c:1254:7: note: previous implicit declaration of ‘yyerror’ was here
       yyerror (YY_("syntax error"));
       ^
mca49@mca49-desktop:~/mayur$ ./a.out
a=10
errormca49@mca49-desktop:~/mayur$ ./a.out
a=10;
error
mca49@mca49-desktop:~/mayur$ ./a.out
int a
 errormca49@mca49-desktop:~/mayur$ ./a.out
int a;
 valid
errormca49@mca49-desktop:~/mayur$ 
*/
