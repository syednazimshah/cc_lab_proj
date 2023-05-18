%{
#include "nodes.h"
#include "y.tab.h"
#include <stdlib.h>
%}

%option yylineno 
%option noyywrap

COMMENT    ";"[^\n]* 
WHITE      [ \t]+
NEWLINE    \n+
IDENTIFIER [a-zA-Z_][a-zA-Z0-9_]*
NUMBER     [0-9]+
LABEL      [a-zA-Z_][a-zA-Z0-9_]*":"
INST_LOAD  "LOAD"
INST_STORE "STORE"
INST_ADD   "ADD"
INST_SUB   "SUB"
INST_MUL   "MUL"
INST_DIV   "DIV"
INST_JMP   "JMP"
INST_JZ    "JZ"
INST_JNZ   "JNZ"

%%

{COMMENT}   { /* Ignore comments */ }
{WHITE}     { /* Ignore whitespaces */ }
{NEWLINE}   { ++yylineno;}
{INST_LOAD} {
               yylval.str = strdup(yytext);
               return INST_LOAD; 
             }
{INST_STORE} {
               yylval.str = strdup(yytext);
               return INST_STORE; 
             }
{INST_ADD}  {
               yylval.str = strdup(yytext);
               return INST_ADD; 
             }
{INST_SUB}  {
               yylval.str = strdup(yytext);
               return INST_SUB; 
             }
{INST_MUL}  {
               yylval.str = strdup(yytext);
               return INST_MUL; 
             }
{INST_DIV}  {
               yylval.str = strdup(yytext);
               return INST_DIV; 
             }
{INST_JMP}  {
               yylval.str = strdup(yytext);
               return INST_JMP; 
             }
{INST_JZ}   {
               yylval.str = strdup(yytext);
               return INST_JZ; 
             }
{INST_JNZ}  {
               yylval.str = strdup(yytext);
               return INST_JNZ; 
             }
{IDENTIFIER} {
               yylval.str = strdup(yytext);
               return IDENTIFIER; 
             }
{NUMBER}    {
               yylval.num = atoi(yytext);
               return NUMBER; 
             }
{LABEL}     {
               yylval.str = strdup(yytext);
               return LABEL; 
             }

.           { /* Ignore unknown tokens */ }

%%


