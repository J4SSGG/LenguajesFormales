#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include "miniPHP.h"
#include "LinkedList.c"


int main(int ac, char ** av) {
	// Checks if file is given...
	if (ac == 2)
	{
		// Creates file object...
		FILE *fd;
		if (!(fd = fopen(av[1], "r"))) // Checks if file exits and is readable...
		{
			perror("Error al abrir archivo.");
			return -1;
		}
		// Set the file reference to flex.
		yyset_in(fd); 
	}

	// Some control variables..
	int value = yylex(); // value (or token if applicable) returned by flex
	int token = 0; // input-lines counter
	// This loop iterates over every line read from the file, pass the line content to flex, and catch the outputs.
	while (value) {
		token++;
		switch (value){
			case VARIABLE:
				printf("Line %d >	  Variable :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case RESERVADO:
				ToLowerCase(yytext);
				printf("Line %d >	  Reservado :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case COMENTARIO:
				printf("Line %d >	  Comentario :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case PREDETERMINADO:
				ToUpperCase(yytext);
				printf("Line %d >	  Predeterminado :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case OPERADOR:
				printf("Line %d >	  Operador :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case TIPO:
				ToLowerCase(yytext);
				printf("Line %d >	  Tipo :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case IDENTIFICADOR:
				ToLowerCase(yytext);
				printf("Line %d >	  Identificador :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case CONTROL:
				ToLowerCase(yytext);
				printf("Line %d >	  Control :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case ERROR:
				printf("ERROR IN LINE %d  ->  %s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case TEXTO:
				printf("Line %d >	  Texto :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case NWL:
				printf("Line %d >	  Salto de linea ;\n", yylineno);
				insertFirst(token, "\n");
				break;
			case ESP:
				printf("Line %d >	  Espacio ;\n", yylineno);
				insertFirst(token, " ");
				break;
			case VALOR:
				ToLowerCase(yytext);
				printf("Line %d >	  Valor  :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case PROPIEDAD:
				printf("Line %d >	  Propiedad  :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
			case BD:
				ToUpperCase(yytext);
				printf("Line %d >	  Database  :		%s\n", yylineno, yytext);
				insertFirst(token, yytext);
				break;
		}
		
		value = yylex();
	}
	reverse(&head);
	
	// Write php file ...
	
	char * newName = malloc(strlen(av[1]));
	strcpy(newName, av[1]);
	newName[strlen(av[1])-3] = 'o';
	newName[strlen(av[1])-2] = 'u';
	newName[strlen(av[1])-1] = 't';

	FILE * fd;
	if (!(fd = fopen(newName, "wb")))
	{
		printf("Error al abrir archivo.");
		return -1;
	}
	
	for(int i = 1; i <= length(); i++){
		fprintf(fd, "%s", find(i)->data);
	}
	fclose(fd);

	return 1;
}

void ToLowerCase(char * word){
	for (;*word;++word) *word = tolower(*word);
}

void ToUpperCase(char * word){
	for (;*word;++word) *word = toupper(*word);
}