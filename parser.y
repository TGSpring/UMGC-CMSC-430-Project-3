/* 
Tyler Spring
2/21/23
Project 3
This is the parser file. Here the input is analyzed by the given grammar and is handled depending on the contents of said input file.
*/


%{

#include <iostream>
#include <string>
#include <vector>
#include <map>

using namespace std;

#include "values.h"
#include "listing.h"
#include "symbols.h"

int yylex();
void yyerror(const char* message);

Symbols<int> symbols;

int result;

%}

%define parse.error verbose

%union
{
	CharPtr iden;
	Operators oper;
	int value;
}

%token <iden> IDENTIFIER
%token <value> INT_LITERAL 
%token <value> BOOL_LITERAL
%token <value> REAL_LITERAL

%token <oper> ADDOP MULOP RELOP OROP EXPOP REMOP
%token ANDOP

%token BEGIN_ BOOLEAN END ENDREDUCE FUNCTION INTEGER IS REDUCE RETURNS CASE ELSE ARROW
%token ENDCASE ENDIF IF OTHERS REAL THEN WHEN NOT

%type <value> body statement_ statement reductions expression relation term
	factor primary
%type <oper> operator

%%
/*This is what has been giving me the most trouble. Whenever I run a file that has parameters that are inputted through the command line,
the header of a file is misread throwing an error. I tried everything I could to figure out what I did wrong here.*/
function:	
	function_header optional_variable body {result = $3;} ;
	
function_header:	
	FUNCTION IDENTIFIER optional_parameter RETURNS type ';' ;

optional_variable:
	optional_variable variable |
	;

variable:	
	IDENTIFIER ':' type IS statement_ {symbols.insert($1, $5);} ;
/*parameter and optional_parameter brought back.*/
optional_parameter:
	optional_parameter |
	parameter ;

parameter:
 IDENTIFIER ',' type |
 ;
 /*Real added again*/
type:
	INTEGER | REAL | BOOLEAN ;

body:
	BEGIN_ statement_ END ';' {$$ = $2;} ;
    
statement_:
	statement ';' |
	error ';' {$$ = 0;} ;
	/*If, then, else, endif, and case added.*/
statement:
	expression |
	REDUCE operator reductions ENDREDUCE {$$ = $3;} |
	IF expression THEN statement_ ELSE statement_ ENDIF |
	CASE expression IS optional_cases OTHERS ARROW statement_ ENDCASE ;

operator:
	ADDOP |
	MULOP ;
/*case and optional_cases brought back.*/
optional_cases:
	optional_cases case |
	;
case:
	WHEN INT_LITERAL ARROW statement_;

reductions:
	reductions statement_ {$$ = evaluateReduction($<oper>0, $1, $2);} |
	{$$ = $<oper>0 == ADD ? 0 : 1;} ;

expression:
	expression ANDOP relation {$$ = $1 && $3;} |
	expression OROP relation {$$ = $1 | $3; }|
	relation ;

relation:
	relation RELOP term {$$ = evaluateRelational($1, $2, $3);} |
	term ;

term:
	term ADDOP factor {$$ = evaluateArithmetic($1, $2, $3);} |
	factor ;
   /*added other arithemic functions to this.*/   
factor:
	factor MULOP primary {$$ = evaluateArithmetic($1, $2, $3);} |
	factor REMOP primary {$$ = evaluateArithmetic($1, $2, $3);} |
        factor EXPOP primary {$$ = evaluateArithmetic($1, $2, $3);} |
        primary ;
/*primary modified like last project.*/
primary:
	'(' expression ')' {$$ = $2;} |
	expression binary_operator expression |
	NOT expression |
	INT_LITERAL | REAL_LITERAL | BOOL_LITERAL |
	IDENTIFIER {if (!symbols.find($1, $$)) appendError(UNDECLARED, $1);} ;
	binary_operator:
	ADDOP | MULOP | REMOP | EXPOP | RELOP ;

%%

void yyerror(const char* message)
{
	appendError(SYNTAX, message);
}
/*I did not modifiy this at all.*/
int main(int argc, char *argv[])    
{
	firstLine();
	yyparse();
	if (lastLine() == 0)
		cout << "Result = " << result << endl;
	return 0;
} 
