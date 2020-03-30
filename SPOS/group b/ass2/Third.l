%{

int count=0;
%}

%%
int|Static|String|class|void|public|system 	{printf("%s keywords\n",yytext);}
[a-z]([a-z]|[0-9])*   				{printf("%s Identifier\n",yytext),count++;}
[A-Z]*						{printf("%s Identifier\n",yytext);}
[(|)|{|}|"|;|:|,|.]				{printf("%s special symbol\n",yytext);}

"["|"]"						{printf("%s special symbol\n",yytext);}

[=|+|-|&]					{printf("%s Operators\n",yytext);}		
[0-9]* 						{printf("%s integers\n",yytext);}
%%
 void main()
{
FILE *fp;
char file[10];
printf("\nEnter the filename: ");
scanf("%s", file);
fp=fopen(file,"r");
yyin=fp;
yylex();
 printf("Total identifiers are: %d\n", count);
//return 0;
}

int yywrap()
{

}


--------output--------------
vicky@ziva:~$ lex Third.l
vicky@ziva:~$ gcc lex.yy.c
vicky@ziva:~$ ./a.out

Enter the filename: javaa.txt
class keywords
 ABC Identifier

{ special symbol

	public keywords
 Static keywords
 void keywords
 main Identifier
( special symbol
String keywords
 args Identifier
[ special symbol
] special symbol
) special symbol

	{ special symbol

                int keywords
 a Identifier
= Operators
10 integers
, special symbol
b Identifier
= Operators
20 integers
; special symbol

		int keywords
 c Identifier
= Operators
 a Identifier
+ Operators
b Identifier
; special symbol

		
		system keywords
. special symbol
out Identifier
. special symbol
println Identifier
( special symbol
" special symbol
addition Identifier
 of Identifier
 two Identifier
 no Identifier
S Identifier
: special symbol
= Operators
" special symbol
, special symbol
c Identifier
) special symbol
; special symbol

	
	} special symbol


} special symbol
; special symbol

Total identifiers are: 14
vicky@ziva:~$ ^C

