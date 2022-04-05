# 1

		AIM: To write and simulate a DFA for a regular language L = {awb| w 
		∈ {a, b} + } by
		writing a C program manually.
		PROCEDURE:
```C
//B19CS010
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
void simulate_DFA(char []);
int main()
{
char string[100]; //string of a's and b's to be fed to the
DFA
printf("C PROGRAM TO SIMULATE THE WORKING OF A DFA FOR LANG
	UAGE L = {awb | w belongs to {a,b}^+}");
printf("\n\nENTER THE STRING (should contain only a's and b
	's): ");
scanf("%s", &string);
simulate_DFA(string);
printf("\n\n");
return 0;
}
void simulate_DFA(char string[])
{
int states[4]; //Initializing the states to array 'states'
for(int i = 0; i < 4; i++)
{
	states[i] = i;
}
printf("\n\nSIZE OF THE STRING IS %d", strlen(string));
printf("\n\nTHERE ARE 5 STATES IN THE DFA FOR THE GIVEN LAN
	GUAGE:\nINITIAL STATE -> Q0\nDEAD STATE -
	> Q0'\nINTERMEDIATE STATES -> Q1 and Q2\nFINAL STATE -> Q3");
if( string[0] == 'b')
{
	printf("\n\nTHE STRING %s IS NOT ACCEPTED BY DFA.", str
		ing);
	printf("\nTHE SYMBOL 'b' HAS MOVED FROM Q0 -
		> Q0' AND WILL CONTUNUE TO STAY THERE IN DEAD STATE.");
}
else
{
	printf("\n\nDFA SIMULATION IS AS FOLLOWS: \n");
for(int i = 0, j = 0; i < strlen(string); i++) //j will
	point to the current state
{
	if ((i == 0) && (string[i] == 'a'))
	{
		printf("\nINPUT SYMBOL IS 'a'\tQ%d -
			> Q%d\tNOW CURERNT STATE IS Q%d", states[j], states[j+1], state
			s[j+1]);
		j++;
	}
	else if(string[i] == 'a')
	{
		if( j == 2)
		{
			printf("\nINPUT SYMBOL IS 'a'\tQ%d -
				> Q%d\tNOW CURERNT STATE IS Q%d", states[j], states[j], states[
					j]);
		}
		else if(j == 3)
		{
			printf("\nINPUT SYMBOL IS 'a'\tQ%d -
				> Q%d\tNOW CURERNT STATE IS Q%d", states[j], states[j-
					1], states[j-1]);
			j--;
		}
		else
		{
			printf("\nINPUT SYMBOL IS 'a'\tQ%d -
				> Q%d\tNOW CURERNT STATE IS Q%d", states[j], states[j+1], state
				s[j+1]);
			j++;
		}
	}
	else if( string[i] == 'b')
	{
		if( j == 2)
		{
			printf("\nINPUT SYMBOL IS 'b'\tQ%d -
				> Q%d\tNOW CURERNT STATE IS Q%d", states[j], states[j+1], state
				s[j+1]);
			j++;
		}
		else if(j == 3)
		{
			printf("\nINPUT SYMBOL IS 'b'\tQ%d -
				> Q%d\tNOW CURERNT STATE IS Q%d", states[j], states[j], states[
					j]);
		}
		else
		{
			printf("\nINPUT SYMBOL IS 'b'\tQ%d -
				> Q%d\tNOW CURERNT STATE IS Q%d", states[j], states[j+1], state
				s[j+1]);
			j++;
		}
	}
}
}
}
```

# 1 b

```flex
%option noyywrap

%%
a(a|a)+b 	{printf("the input string is valid in the language");}
.* 			{printf("the input string is not valid in the language")}

%%
void main(){
	yylex();
}
```

# 2

		AIM: Using Lex/Flex , write a program to append line number before each
		lines(empty/non-empty).

```flex
%option noyywrap

%{
	int line=1;
%}

%%
.\n 		{fprintf(yyout, "%d 	%s",line,yytext); line ++;}
.* 			{fprintf(yyout, "%d 	%s",line,yytext);}
%%
void main (){
	yyin = fopen("txt.txt","r");
	yyout = fopen ("txt1.txt","w");
	yylex();
}
```

# 2b

```flex
%option noyywrap

%{
	int line=1;
%}

%%
.+\n 		{fprintf(yyout, "%d 	%s",line,yytext); line++;}
.+ 			{fprintf(yyout, "%d 	%s",line,yytext);}
%%
void main(){
	yyin = fopen ("txt","r");
	yyout = fopen ("txt1","w");
	yylex();
}
```
# 5 Lex program to copy a file by replacing multiple sequences of white spaces with a single white space. [blanks/tab => blank, more than one “ \n” => “ \n”].

```
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
```

# 5b Also add removal of comments in above program.
```
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
```
# 6 Lex program to copy a C program by replacing each instance of the keyword float by double.
```
%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
char string[200]; 
%}

%%
[\n]		{fprintf(yyout, "%s\n", string); 
"float"		{fprintf(yyout, "%s", string); 
.			strcat(string, yytext);
<<EOF>>		{ fprintf(yyout, "%s", string); 
%%

void main()
{
 yyin = fopen("readFile.c", "r");
 yyout = fopen("writeFile.c", "w");
 yylex();
}
```

# 7
```
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
```
# 8 a Using Lex/Flex , write a program to encode and decode. [Exact problem statements are to be provided.]
```
%option noyywrap

%{
  int length;
  int i = 0;
%}


%%
[a-zA-Z]+	{ length = strlen(yytext);
		  while( i < length)
		  {
		    yytext[i] = yytext[i] + 1;
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
```
# 8 b
```
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

```

# 9 a Using Lex/Flex , write a program to (i) identify the Roman numbers (ii) add 2 Roman numbers.

```
%option noyywrap

%{
 int var = 0;
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
	 printf("The input Roman number is %d\n\n", var);
	 var = 0;
	}					

%%
void main()
{
 yylex();
}

```

# 9 b

```
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
```

# 10 c
```
#include<stdio.h>
#include<stdlib.h>

int token;
char inputstring[30];
char derive[50];
int i;

void S();
void E();
void E_();
void T();
void T_();
void F();
int next_token();

int main()
{
  i = 0;
  printf("string with $ append at the end: ");
  scanf("%s", inputstring);
  token = next_token();
  S();
  return 0;
}

int next_token()
{
  return inputstring[i++];
}

void S()
{
  E();
  if( token == '$')
  	printf("\n\nSuccessful Reading!\n");
  else
  	printf("\n\nFailed\n");
}

void E()
{
  printf("\nE -> TE` ");
  T();
  E_();
}

void T()
{
  printf("\nT -> FT` ");
  F();
  T_();
}

void E_()
{
  switch(token)
  {
    case '+':	token = next_token(); //E' -> +TE'
    		printf("\nE -> +TE`");
    		T();
    		E_();
    		break;
    case ')':	
    case '$':	printf("\nE` -> epsilon");
    		break;
    default:	printf("\nERROR 1: Expecting '+', 'j' or '$'");
    		exit(0);
  }
}

void T_()
{
  switch(token)
  {
    case '*':	token = next_token();//T' -> *FT'
    		printf("\nT' -> *FT'");
    		F();
    		T_();
    		break;
    case '+':	
    case ')':
    case '$':	printf("\nT' -> epsilon");
    		break;
    default:	printf("ERROR 2: Expecting '+', '*', ')' or '$'");
    		exit(0);
  }
}

void F()
{
  if( token == 'a')
  {
    token = next_token();
    printf("\nF -> a");
  }
  else if( token == 'b')
  {
    token = next_token();
    printf("\nF -> b");
  }
  else if( token == '(')
  {
    token = next_token();
    printf("\nF -> (E)");
    E();
    if( token == ')')
    	token = next_token();
    else
    	printf("\nERROR 4: Expecting ')'");
  }
  else
  {
    printf("\nERROR 3: Expecting a letter or '('");
    exit(0);
  }
}
```