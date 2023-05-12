/* 
Tyler Spring
2/21/23
Project 3
This is the scanner file. Here the reserved words, operators, and tokens are created to be used to read input files.
*/

%{
#include <string>

using namespace std;

#include "values.h"
#include "listing.h"
#include "tokens.h"

%}

%option noyywrap
/*added old terms from last project. Below are the added requirements for the project, such as relational operators,
arth, case, if, else, both literals.*/
ws		[ \t\r]+
comment		\-\-.*\n
comment2 	\\\\.*\n
line		[\n]
real		{digit}+\.{digit}*([Ee][+-]?{digit}+)?
id		[A-Za-z][A-Za-z_0-9]*
digit		[0-9]
bool		(true|false)
int		{digit}+
punc		[\(\),:;]
%%



{ws}		{ ECHO; }
{comment}	{ ECHO; nextLine();}
{comment2}	{ ECHO; nextLine();}
{line}		{ ECHO; nextLine();}


	/*Here are the relational and arth additions*/

"<"		{ ECHO; yylval.oper = LESS; return(RELOP); }
">"		{ ECHO; yylval.oper = GREAT; return(RELOP); }
"<="		{ ECHO; yylval.oper = LESSEQ; return(RELOP); }
"="		{ ECHO; yylval.oper = EQUAL; return(RELOP);}
">="		{ ECHO; yylval.oper = GREATEQ; return(RELOP);}
"/="		{ ECHO; yylval.oper = NOTEQ; return(RELOP); }
"+"		{ ECHO; yylval.oper = ADD; return(ADDOP); }
"-"		{ ECHO; yylval.oper = MINUS; return(MINUS);}
"*"		{ ECHO; yylval.oper = MULTIPLY; return(MULOP); }
"/" 		{ ECHO; yylval.oper = DIVIDE; return(DIVIDE);}
"**"		{ ECHO; yylval.oper = EXPON; return(EXPON);}
"=>"		{ ECHO; return(ARROW); }
rem		{ ECHO; return(REMOP); }

	/*Literals, case, else, endif, if and so on.*/

{bool}		{ ECHO; yylval.oper = BOOL; return(BOOL_LITERAL);}
{real}		{ECHO; return(REAL_LITERAL);}
begin		{ ECHO; return(BEGIN_); }
boolean		{ ECHO; return(BOOLEAN); }
case		{ ECHO; return(CASE);  }
else 		{ ECHO; return(ELSE);  }
endcase		{ ECHO; return(ENDCASE); }
endif		{ ECHO; return(ENDIF);  }
if		{ ECHO; return(IF);  }
others 		{ ECHO; return(OTHERS) ;}
real 		{ ECHO; return(REAL)  ;}
then		{ ECHO; return(THEN) ;}
when 		{ ECHO; return(WHEN) ;}
not		{ ECHO; return(NOT); }
or		{ ECHO; return(OROP);  }
end		{ ECHO; return(END); }
endreduce	{ ECHO; return(ENDREDUCE); }
function	{ ECHO; return(FUNCTION); }
integer		{ ECHO; return(INTEGER); }
is		{ ECHO; return(IS); }
reduce		{ ECHO; return(REDUCE); }
returns		{ ECHO; return(RETURNS); }
and		{ ECHO; return(ANDOP); }

	/*Did not touch a thing, did not want to.*/
{id}		{ ECHO; yylval.iden = (CharPtr)malloc(yyleng + 1); 
			strcpy(yylval.iden, yytext); return(IDENTIFIER);}
{int}		{ ECHO; yylval.value = atoi(yytext); return(INT_LITERAL); }
{punc}		{ ECHO; return(yytext[0]); }
.		{ ECHO; appendError(LEXICAL, yytext); }

%%
