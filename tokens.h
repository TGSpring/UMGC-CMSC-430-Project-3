/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_PARSER_TAB_H_INCLUDED
# define YY_YY_PARSER_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    IDENTIFIER = 258,              /* IDENTIFIER  */
    INT_LITERAL = 259,             /* INT_LITERAL  */
    BOOL_LITERAL = 260,            /* BOOL_LITERAL  */
    REAL_LITERAL = 261,            /* REAL_LITERAL  */
    ADDOP = 262,                   /* ADDOP  */
    MULOP = 263,                   /* MULOP  */
    RELOP = 264,                   /* RELOP  */
    OROP = 265,                    /* OROP  */
    EXPOP = 266,                   /* EXPOP  */
    REMOP = 267,                   /* REMOP  */
    ANDOP = 268,                   /* ANDOP  */
    BEGIN_ = 269,                  /* BEGIN_  */
    BOOLEAN = 270,                 /* BOOLEAN  */
    END = 271,                     /* END  */
    ENDREDUCE = 272,               /* ENDREDUCE  */
    FUNCTION = 273,                /* FUNCTION  */
    INTEGER = 274,                 /* INTEGER  */
    IS = 275,                      /* IS  */
    REDUCE = 276,                  /* REDUCE  */
    RETURNS = 277,                 /* RETURNS  */
    CASE = 278,                    /* CASE  */
    ELSE = 279,                    /* ELSE  */
    ARROW = 280,                   /* ARROW  */
    ENDCASE = 281,                 /* ENDCASE  */
    ENDIF = 282,                   /* ENDIF  */
    IF = 283,                      /* IF  */
    OTHERS = 284,                  /* OTHERS  */
    REAL = 285,                    /* REAL  */
    THEN = 286,                    /* THEN  */
    WHEN = 287,                    /* WHEN  */
    NOT = 288                      /* NOT  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 34 "parser.y"

	CharPtr iden;
	Operators oper;
	int value;

#line 103 "parser.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_PARSER_TAB_H_INCLUDED  */
