%option noyywrap

%{
	#include "B19CS010_CS354_13c.tab.h"
	#include<stdlib.h>
	
%}

%%
"+" 	{ return yytext[0];}
"-" 	{ return yytext[0];}
"*" 	{ return yytext[0];}
"/" 	{ return yytext[0];}
"(" 	{ return yytext[0];}
")" 	{ return yytext[0];}
[0-9]+ 	{ yylval = atoi(yytext); return NUM; }
\n  { return yytext[0];}
"$" { return yytext[0];}
