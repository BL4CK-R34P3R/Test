%option noyywrap

%{
 int var = 0;
 int var1 = 0;
 int check = 0; 
 int sum = 0;
%}


%%
I	var = var + 1;
IV	var = var + 4;
V	var = var + 5;
IX	var = var + 9;
X	var = var + 10;
XL	var = var + 40;
L	var = var + 50;
XC	var = var + 90;
C	var = var + 100;
CD	var = var + 400;
D	var = var + 500;
CM	var = var + 900;
M	var = var + 1000;
\n	{
	 if(check)
	  {
	   sum = var + var1;
	   printf("The sum of the two input Roman Numerals = %d\n\n", sum);
	   return;
	  }
	  var1 = var;
	  var = 0;
	  check = 1;
	}					

%%
void main()
{
 yylex();
}
