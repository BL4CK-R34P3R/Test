%option noyywrap

%%
[\t" "]+ fprintf(yyout," ");   
.|\n fprintf(yyout,"%s",yytext);	
%%



void main()
{
 yyin = fopen("readFile.txt", "r");
 yyout = fopen("writeFile.txt", "w");
 yylex();
}
