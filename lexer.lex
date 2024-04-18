%{
#include <stdio.h>
#include "parser.tab.h"

char *create_string(char *value, int length) {
	char *return_value = new char[length + 1];
	strcpy(return_value, value);
	return return_value;
}

%}

%%

"fun" { return FUNC; }
"(" { return RPRAN; }
")" { return LPRAN; }
"{" { return RCURL; }
"}" { return LCURL; }
[0-9]+ { yylval.op_value = create_string(yytext, yyleng); return DIGIT; }
[a-z]+ { yylval.op_value = create_string(yytext, yyleng); return IDENT; }
[ \t\n] {}

%%
