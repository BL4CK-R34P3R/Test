/*	Simple Calculator input checking (parsing) and calculation also, but with numbers only*/
%{
	#include <stdio.h>
	
	
	void yyerror(char *);
%}

/* declare tokens */
%token NUM
%left '+' '-'
%left '^' '*' '/' '%'
%%
l: 	l E '\n'	
	|
	;
E: 	NUM		{printf("%d",$1);}
	|E '+' E 	{printf("+");}  
	|E '-' E 	{printf("-");} 
	|E '*' E 	{printf("*");}
	|E '^' E	{printf("^");} 
	|E '/' E 	{printf("/");}
	|E '%' E	{printf("%");} 
	|'(' E ')' 	 
	;

%%
main()
{ yyparse();}

void yyerror(char *s)
{}
