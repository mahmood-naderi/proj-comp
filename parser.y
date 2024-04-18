%{

#include <stdio.h> 

int yylex();
void yyerror(const char* s);

%}

%union {
	char *op_value;
}


%define parse.error verbose

%token FUNC
%token RPRAN
%token LPRAN
%token RCURL
%token LCURL
%token <op_value> DIGIT 
%token <op_value> IDENT
%token PRINT
%token SEMICOLON

%start program

%%

program: functions { printf("program -> functions\n");  }

functions: function functions { printf(" function functions\n");  }
	   | %empty { printf("functionsempty\n");  }

function: FUNC IDENT RPRAN LPRAN RCURL statements LCURL { printf("function definition\n");  }
statements: statement statements { printf("statements definition\n"); }
	  | %empty { printf("statements empty\n"); }
statement: PRINT RPRAN variable LPRAN SEMICOLON { printf("statement definition\n"); }
variable: IDENT { printf("variable ident\n"); }
	  | DIGIT { printf("variable digit\n"); }
%%

int main(void) {

	yyparse();

}


void yyerror(const char* s) {
	printf("Error: %s\n", s);
}
