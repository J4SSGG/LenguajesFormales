#define VARIABLE 1
#define RESERVADO 2
#define OPERADOR 3
#define TIPO 4
#define IDENTIFICADOR 5
#define PREDETERMINADO 6
#define COMENTARIO 7
#define CONTROL 8
#define ERROR 9
#define TEXTO 10
#define NWL 11
#define ESP 12
#define VALOR 13
#define PROPIEDAD 14
#define BD 15

extern int yylex();
extern int line;
extern char * yytext;
extern void yyset_in(FILE * in_str);

void ToLowerCase(char * word);
void ToUpperCase(char * word);