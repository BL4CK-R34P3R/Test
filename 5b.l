%option noyywrap

%%
[\t" "]+ fprintf(yyout," ");  
.|\n fprintf(yyout,"%s",yytext);	
\/\/(.*) {}; 
\/\*(.*\n)*.*\*\/  {};	  
%%



void main()
{
 yyin = fopen("readFile2.txt", "r");
 yyout = fopen("writeFile2.txt", "w");
 yylex();
}
