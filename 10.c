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
