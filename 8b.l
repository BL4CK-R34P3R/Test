%option noyywrap

%{
  int length;
  int i = 0;
%}


%%
[a-zA-Z]+	{ length = strlen(yytext);
		  while( i < length)
		  {
		    yytext[i] = yytext[i] - 1;
		    i++;
		  }
		  i = 0;
		  fprintf(yyout, "%s", yytext);
		  printf("%s ", yytext);		
		}

[0-9]+|"?"	{ 
		 fprintf(yyout, "%s", yytext);
		 printf("%s", yytext);
		}

%%
void main()
{
 yyin = fopen("input.txt", "r");
 yyout = fopen("output.txt", "w");
 yylex();
}
