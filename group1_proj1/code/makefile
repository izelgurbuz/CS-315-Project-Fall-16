all: lexer

lex.yy.c: lexer.l
	lex lexer.l  

lexer: lex.yy.c
	g++ -o lexer lex.yy.c -ll

test: input
	cat input.txt | ./lexer

clean:
	rm -f lex.yy.c
	rm -f lexer

