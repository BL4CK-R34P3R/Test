%option noyywrap

%{
	#include "B19CS010_CS354_13b.tab.h"
	#include<stdlib.h>
	
%}

%%
"+" 	{ return yytext[0];}
"-" 	{ return yytext[0];}
"*" 	{ return yytext[0];}
"/" 	{ return yytext[0];}
"(" 	{ return yytext[0];}
")" 	{ return yytext[0];}
[0-9]+ 	{ yylval.n = atoi(yytext); return NUM; }
[a-zA-Z]+	{ yylval.v = yytext; return ID;}
\n  { return yytext[0];}
"$" { return yytext[0];}
