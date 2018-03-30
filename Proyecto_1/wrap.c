#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "wrap.h"

extern int yylex();
extern int line;
extern char * yytext;
extern void yyset_in(FILE * in_str);

int main(int ac, char ** av) {
	// Checks if file is given...
	if (ac == 2)
	{
		// Creates file object...
		FILE *fd;
		if (!(fd = fopen(av[1], "r"))) // Checks if file exits and is readable...
		{
			perror("Error: ");
			return -1;
		}
		// Set the file reference to flex.
		yyset_in(fd); 
	}

	// Some control variables..
	int value = yylex(); // value (or token if applicable) returned by flex
	int line = 0 // input-lines counter

	// This loop iterates over every line read from the file, pass the line content to flex, and catch the outputs.
	while (value) {
		line++;
		switch (value){
			case VARIABLE:
				printf("Line :  %d ; Variable :  %s\n", line, yytext);
				break;
			case RESERVADO:
				ToLowerCase(yytext);
				printf("Line :  %d ;  Reservado :  %s\n", line, yytext);
				break;
			case COMENTARIO:
				printf("Line :  %d ;  Comentario :  %s\n", line, yytext);
				break;
			case PREDETERMINADO:
				ToUpperCase(yytext);
				printf("Line :  %d ;  Predeterminado  :  %s\n", line, yytext);
				break;
			case OPERADOR:
				printf("Line :  %d ;  Operador  :  %s\n", line, yytext);
				break;
			case TIPO:
				ToLowerCase(yytext);
				printf("Line :  %d ;  Tipo  :  %s\n", line, yytext);
				break;
			case IDENTIFICADOR:
				ToLowerCase(yytext);
				printf("Line :  %d ;  Identificador  :  %s\n", line, yytext);
				break;
			case CONTROL:
				printf("Line :  %d ;  Control  :  %s\n", line, yytext);
				break;
			case ERROR:
				printf("Line :  %d ;  Error  :  %s\n", line, yytext);
				break;
			case TEXTO:
				printf("Line :  %d ;  Texto  :  %s\n", line, yytext);
				break;
			case NWL:
				printf("Line :  %d ;  Salto de Linea\n", line);
				break;
			case ESP:
				printf("Line :  %d ;  Espacio\n", line);
				break;
			case VALOR:
				ToLowerCase(yytext);
				printf("Line :  %d ;  Valor  :  %s\n", line, yytext);
				break;
		}
		value = yylex();
	}

	return 1;
}

void ToLowerCase(char * word){
	for (;*word;++word) *word = tolower(*word);
}

void ToUpperCase(char * word){
	for (;*word;++word) *word = toupper(*word);
}