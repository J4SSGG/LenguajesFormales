#include <stdio.h>
#include "wrap.h"

extern int yylex();
extern int yylineno;
extern char* yytext;
extern void yyset_in(FILE * in_str);

int main(int ac, char ** av) {

	if (ac == 2)
	{
		FILE *fd;
		if (!(fd = fopen(av[1], "r")))
		{
			perror("Error: ");
			return -1;
		}
		
		yyset_in(fd);
	}
	int value = yylex();
	
	while (value) {
		switch (value){
			case VARIABLE:
				printf("Line :  %d ; Variable :  %s\n", yylineno, yytext);
				break;
		case RESERVADO:
				printf("Line :  %d ;  Reservado :  %s\n", yylineno, yytext);
				break;
		case COMENTARIO:
				printf("Line :  %d ;  Comentario :  %s\n", yylineno, yytext);
				break;
		case PREDETERMINADO:
				printf("Line :  %d ;  Predeterminado  :  %s\n", yylineno, yytext);
				break;
		case OPERADOR:
				printf("Line :  %d ;  Operador  :  %s\n", yylineno, yytext);
				break;
		case TIPO:
				printf("Line :  %d ;  Tipo  :  %s\n", yylineno, yytext);
				break;
		case IDENTIFICADOR:
				printf("Line :  %d ;  Identificador  :  %s\n", yylineno, yytext);
				break;
		case CONSTANTE:
				printf("Line :  %d ;  Constante  :  %s\n", yylineno, yytext);
				break;
		case CONTROL:
				printf("Line :  %d ;  Control  :  %s\n", yylineno, yytext);
				break;
		case ERROR:
				printf("Line :  %d ;  Error  :  %s\n", yylineno, yytext);
				break;
		}
		value = yylex();
	}

	return 1;
}