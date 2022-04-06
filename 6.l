%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char string[200]; 
%}

%%
[\n]		{fprintf(yyout, "%s\n", string); 
"float"		{fprintf(yyout, "%s", string); 
.			strcat(string, yytext);
<<EOF>>		{ fprintf(yyout, "%s", string); 
%%

void main()
{
 yyin = fopen("readFile.c", "r");
 yyout = fopen("writeFile.c", "w");
 yylex();
}
