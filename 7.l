%option noyywrap

%%%
(a|e|i|o|u|A|E|I|O|U)[a-z]*[A-Z]* fprintf(yyout, "%say", yytext);
[a-zA-Z^aeiouAEIOU][a-z]*[A-Z]* fprint(yyout,"%s%cay",yytext+1,yytext[0]);
%%

void main(){
  yyin = fopen("read.txt","r");
  yyout =fopen("write.txt","w");
  yylex();
}
