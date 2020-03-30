%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
and|because|or return CN;
[\t] return WS;
";" return SC;
[a-zA-Z]+[a-zA-Z0-9]* return ID;
[\n] return NL;

%%
yylex();

