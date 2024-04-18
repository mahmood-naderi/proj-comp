all:
	bison -t -v -d parser.y
	flex lexer.lex
	g++ lex.yy.c parser.tab.c -ll

