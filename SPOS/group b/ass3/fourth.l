%{

int count1=0;
int count2=0;
int count3=0;
int count4=0;
%}

%%
int|Static|String|class|void|public|system 	{printf("%s keywords\n",yytext),count1++;}
[a-z]([a-z]|[0-9])*   				{printf("%s Identifier\n",yytext),count2++,count4++;}
[A-Z]*						{printf("%s Identifier\n",yytext),count4++;}
[(|)|{|}|"|;|:|,|.]				{printf("%s special symbol\n",yytext),count4++;}

"["|"]"						{printf("%s special symbol\n",yytext),count4++;}

[=|+|-|&]					{printf("%s Operators\n",yytext),count4++;}		
[0-9]* 						{printf("%s integers\n",yytext),count4++;}

\n						{count3++;}

%%
 int main()
{
FILE *fp;
char file[10];
printf("\nEnter the filename: ");
scanf("%s", file);
fp=fopen(file,"r");
yyin=fp;
yylex();
 printf("Total identifiers are: %d\n", count2);
 printf("Total Keywords are: %d\n", count1);
  printf("Total lines are: %d\n", count3);
  printf("Total characters are: %d\n", count4);
return 0;
}

int yywrap()
{


}


--------output-----------
vicky@ziva:~/lex$ lex fourth.l
vicky@ziva:~/lex$ gcc lex.yy.c
vicky@ziva:~/lex$ ./a.out

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
Total Keywords are: 8
Total lines are: 12
Total characters are: 44
vicky@ziva:~/lex$ 
