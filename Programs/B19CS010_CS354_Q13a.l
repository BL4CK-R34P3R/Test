%option noyywrap

%{
	#include "B19CS010_CS354_Q13a.tab.h"
	#include<stdlib.h>
	
%}

%%
"+" { return yytext[0];}
"-" { return yytext[0];}
"*" { return yytext[0];}
"/" { return yytext[0];}
"(" { return yytext[0];}
")" { return yytext[0];}
"^" { return yytext[0];}
[0-9]+ { yylval = atoi(yytext); return NUM; }
\n { return yytext[0];}
"$"  {return yytext[0];}
