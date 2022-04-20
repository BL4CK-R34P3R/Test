/*	Conversion of infix expression to prefix expression*/
%{
	#include <stdio.h>
	#include <string.h>
	#include "lex.yy.c"
	
	char str[1000], stack[100];
	int s = 0;
	int top = -1;

	void yyerror(char *);
	int isOperator(char x);
	void push(char c);
	char pop();
	void postfixToPrefix();
%}

/* declare tokens */
%token NUM
%left '-' '+'
%left '*' '/' '%'
%left '^'

%%
l: 	l E '\n'	{postfixToPrefix();}
	|
	;
E: 	NUM		{char temp[100]; itoa($1, temp, 10); strcat(str, temp);}
	|E '+' E 	{strcat(str, "+");}  
	|E '-' E 	{strcat(str, "-");} 
	|E '*' E 	{strcat(str, "*");} 
	|E '/' E 	{strcat(str, "/");} 
	|'(' E ')' 	{}
	| E '^' E	{strcat(str, "^");}
	| E '%' E	{strcat(str, "%");}
	;

%%
void main()
{ yyparse();
 }

void yyerror(char *s)
{}

int isOperator(char x) 
{
  switch (x) {
  case '+':
  case '-':
  case '/':
  case '*':
  case '^':
  case '%':
    return 1;
  }
  return 0;
}

void push(char c)
{
   stack[++top]=c;
}
char pop()
{
   return stack[top--];
}

void postfixToPrefix() {

printf("\n");

int i,j=0; char c[20];
char a,b;

int n=strlen(str);

for(i=0;i<100;i++)
	stack[i]='\0';

for(i=n-1;i>=0;i--)
{
   if(isOperator(str[i]) == 1)
   {
      push(str[i]);
   }
   else
   { 
	c[j++]=str[i];
      while((top!=-1)&&(stack[top]=='@'))
      {
         a=pop(); c[j++]=pop();
      }
        push('@');
      }
   }

c[j]='\0';
strrev(c);
printf("%s",c);
}



