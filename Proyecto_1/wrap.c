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
		}
		value = yylex();
	}

	return 1;
}