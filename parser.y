%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "nodes.h"
extern int yylineno;
void yyerror(char* s);
int yylex();
Node* root = NULL;
/*program:
  
| program instruction { root = addNode(root, $2); }
| program LABEL { root = addNode(root, createNode(TYPE_LABEL, $2)); }
;*/
%}

%union {
  int num;
  char* str;
  Node* node;
}

%token <str> IDENTIFIER
%token <num> NUMBER
%token <str> LABEL
%token <str> INST_LOAD
%token <str> INST_STORE
%token <str> INST_ADD
%token <str> INST_SUB
%token <str> INST_MUL
%token <str> INST_DIV
%token <str> INST_JMP
%token <str> INST_JZ
%token <str> INST_JNZ

%type <node> instruction line

%%

program: line { root = addNode(root, $1); }
        | program line { root = addNode(root, $2); }  // Change from $1 to $2 because $1 is "program" and $2 is "line"
        ;

line: instruction
    | LABEL { $$ = createNode(TYPE_LABEL, $1); }
    ;
    
instruction:
  INST_LOAD IDENTIFIER  { $$ = createNode(TYPE_INSTRUCTION, $1); }
| INST_STORE IDENTIFIER { $$ = createNode(TYPE_INSTRUCTION, $1); }
| INST_ADD IDENTIFIER   { $$ = createNode(TYPE_INSTRUCTION, $1); }
| INST_SUB IDENTIFIER   { $$ = createNode(TYPE_INSTRUCTION, $1); }
| INST_MUL IDENTIFIER   { $$ = createNode(TYPE_INSTRUCTION, $1); }
| INST_DIV IDENTIFIER   { $$ = createNode(TYPE_INSTRUCTION, $1); }
| INST_JMP IDENTIFIER   { $$ = createNode(TYPE_INSTRUCTION, $1); }
| INST_JZ IDENTIFIER    { $$ = createNode(TYPE_INSTRUCTION, $1); }
| INST_JNZ IDENTIFIER   { $$ = createNode(TYPE_INSTRUCTION, $1); }
;

%%

int main() {
  yyparse();
  printTree(root, 0);
  return 0;
}

void yyerror(char* s) {
  fprintf(stderr, "Parse error at line %d: %s\n", yylineno, s);
  exit(1);
}

