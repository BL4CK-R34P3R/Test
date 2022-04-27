%{
	#include<stdio.h>
	#include<string.h>
	char buf[50];
%}

%union
{  int n;
   char *v;
   char name[50];
}
%token <n> NUM
%token <v> ID
%type <name> E 
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%%
S:E  {printf("\nThe prefix expression is : %s",$1);}
;
E: E'*'E 	{buf[0]='\0';strcpy($$,strcat(strcpy(buf,"*"),strcat($1,$3)));}
  |E'/'E 	{buf[0]='\0';strcpy($$,strcat(strcpy(buf,"/"),strcat($1,$3)));}
  |E'+'E 	{buf[0]='\0';strcpy($$,strcat(strcpy(buf,"+"),strcat($1,$3)));}
  |E'-'E 	{buf[0]='\0';strcpy($$,strcat(strcpy(buf,"-"),strcat($1,$3)));}
  |'('E')'	{strcpy($$,$2);}
  |NUM 	{sprintf($$,"%d",$1);}
  |ID		{ sprintf($$, "%s", $1);}
  ;
%%

void main()
{
 printf("INFIX TO PREFIX CONVERSION\nEnter the infix expression: ");
 yyparse();
 printf("\n");
}

int yyerror(char *s) 
{

}

