
%{
	void yyerror();
%}

%token NUM

%%
E : E '+' T 	{ printf("+ ");}
  | E '-' T 	{ printf("- ");}
  | T
  ;
T : T '*' F 	{ printf("* ");}
  | T '/' F	{ printf("/ ");}
  | T '^' F	{ printf("^ ");}
  | F
  ;
F : '(' E ')' 
  | NUM		{ printf("%d ",$1);}
  ;
%%
void main()
{
 printf("PROGRAM TO CONVERT AN INFIX EXPRESSION INTO A POSTFIX EXPRESSION.\nEnter infix experssion: ");
 yyparse();
 printf("\n");
}
void yyerror()
{
}

