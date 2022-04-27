
%{
	#include<stdio.h>
	#include<string.h>
	
	void yyerror(char *);
%}


%token NUM

%left '+' '-'
%left '*' '/'

%%

E: '+'E E	{printf("+");}
 | '-'E E	{printf("-");}
 | '*'E E	{printf("*");}
 | '/'E E	{printf("/");}
 |'('E')'
 |NUM		{printf("%d", $1);}
 ;

%%
void main()
{
 printf("PREFIX TO POSTFIX CONVERSION\nEnter the prefix expression: ");
 yyparse();
 printf("\n");
}

void yyerror(char *s)
{
 
}
