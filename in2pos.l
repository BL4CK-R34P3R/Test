%option noyywrap  

%{
	#include "in2pos.tab.h"
	#include<stdlib.h>
	
%}

%%
"+" { return yytext[0]; }
"-" { return yytext[0];}
"*" { return yytext[0];}
"^" { return yytext[0];}
"/" { return yytext[0];}
"%" { return yytext[0];}
"(" { return yytext[0];}
")" { return yytext[0];}
[0-9]+ { yylval = atoi(yytext); return NUM; }
\n { return yytext[0];}
"$"  {return yytext[0];}
[ \t] { /* ignore whitespace */ }
. { printf("Mystery character %c\n", *yytext); }
