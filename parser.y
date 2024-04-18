%{

#include <stdio.h> 

int yylex();
void yyerror(const char* s);

%}

%union {
	char *op_value;
}

%token FUNC
%token RPRAN
%token LPRAN
%token RCURL
%token LCURL
%token <op_value> DIGIT 
%token <op_value> IDENT
%token PRINT
%start program

%%

program: functions { printf("program -> functions\n");  }

functions: function functions { printf("functions -> function functions\n");  }
	   | %empty { printf("functions -> empty\n");  }

function: FUNC IDENT RPRAN LPRAN RCURL LCURL { printf("some random bullshit generated!\n");  }
statements: statement statements {}
statement: PRINT RPAN variable LPRAN {}
variable: IDNET
	  | DIGIT 
%%

int main(void) {

	yyparse();

}


void yyerror(const char* s) {
	printf("Error: %s\n", s);
}
