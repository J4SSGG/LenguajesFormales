%{
#include "wrap.h"
%}
ALL		.*
ESP		[[ \n\t\r]+]*
NWL		[\n]*
JMP		[^.]*
VAR		"$"[a-zA-Z_][a-zA-Z0-9_]*
INT		"+-"*[0-9]+
DEC		"+-"*[0-9]*"."[0-9]*
BOOL	[tT][rR][uU][eE]|[fF][aA][lL][sS][eE]
INIT	"<?"[pP][hH][pP]
END		"?>"
OPA		"="|"+"|"-"|"*"|"/"|"%"|"<"|">"|"<="|">="|"<>"|"=="|"==="|"!=="|"!="|"."|"&&"|"\|\|"|[aA][nN][dD]|[oO][rR]|[xX][oO][rR]|"+="|"-="|"*="|"/="|".="|"&"	
OPB		"++"|"--"
PTS		"("|")"|"{"|"}"|";"|","|"."
STC		[dD][oO][uU][bB][lL][eE]|[iI][nN][tT]|[sS][tT][rR][iI][nN][gG]|[fF][lL][oO][aA][tT]|[bB][oO][oO][lL]
CTRA	[iI][fF]|[eE][lL][sS][eE]["_"][iI][fF]|[eE][lL][sS][eE][iI][fF]|[wW][hH][iI][lL][eE]|[fF][oO][rR]|[fF][oO][rR][eE][aA][cC][hH]|[sS][wW][iI][tT][cC][hH]
CTRB	[rR][eE][tT][uU][rR][nN]|[dD][oO]|[cC][aA][sS][eE]|[bB][rR][eE][aA][kK]|[gG][oO][tT][oO]|[eE][lL][sS][eE]|[iI][nN][cC][lL][uU][dD][eE]|[iI][nN][cC][lL][uU][dD][eE]["_"][oO][nN][cC][eE]|[cC][oO][nN][tT][iI][nN][uU][eE]
ERR		[A-Za-z0-9"_""."]*
%%
{INIT}	return PREDETERMINADO;
{END}	return PREDETERMINADO;
"$_"[gG][lL][oO][bB][aA][lL][sS]    return PREDETERMINADO;
"$_"[sS][eE][rR][vV][eE][rR]        return PREDETERMINADO;
"$_"[gG][eE][tT]    return PREDETERMINADO;
"$_"[pP][oO][sS][tT]        return PREDETERMINADO;
"$_"[fF][iI][lL][eE][sS]    return PREDETERMINADO;
"$_"[rR][eE][qQ][uU][eE][sS][tT]    return PREDETERMINADO;
"$_"[eE][nN][vV]    return PREDETERMINADO;
"$_"[sS][eE][sS][sS][iI][oO][nN]    return PREDETERMINADO;
"$_"[cC][oO][oO][kK][iI][eE]        return PREDETERMINADO;
"$"[hH][tT][tT][pP]["_"][rR][aA][wW]["_"][pP][oO][sS][tT]["_"][dD][aA][tT][aA]    return IDENTIFICADOR;
"$"[pP][hH][pP]["_"][eE][rR][rR][oO][rR][mM][sS][gG]    return IDENTIFICADOR;
"$"[hH][tT][tT][pP]["_"][rR][eE][sS][pP][oO][nN][sS][eE]["_"][hH][eE][aA][dD][eE][rR]        return IDENTIFICADOR;
"$"[aA][rR][gG][cC]        return IDENTIFICADOR;
"$"[aA][rR][gG][vV]        return IDENTIFICADOR;
"//"{ALL} 	return COMENTARIO;
"/*"{JMP}{ALL}{JMP}"*/"?	 	return COMENTARIO;
[aA][bB][sS][tT][rR][aA][cC][tT]       return RESERVADO;
[aA][nN][dD]    return RESERVADO;
[aA][rR][rR][aA][yY]   return RESERVADO;
[aA][sS]        return RESERVADO;
[cC][aA][lL][lL][aA][bB][lL][eE]        return RESERVADO;
[cC][aA][tT][cC][hH]    return RESERVADO;
[cC][lL][aA][sS][sS]    return RESERVADO;
[cC][lL][oO][nN][eE]    return RESERVADO;
[cC][oO][nN][sS][tT]    return RESERVADO;
[dD][eE][cC][lL][aA][rR][eE]    return RESERVADO;
[dD][eE][fF][aA][uU][lL][tT]    return RESERVADO;
[dD][eE][fF][iI][nN][eE]   return RESERVADO;
[dD][iI][eE]    return RESERVADO;
[eE][cC][hH][oO]        return RESERVADO;
[eE][lL][sS][eE]        return RESERVADO;
[eE][mM][pP][tT][yY]    return RESERVADO;
[eE][nN][dD][dD][eE][cC][lL][aA][rR][eE]      return RESERVADO;
[eE][nN][dD][fF][oO][rR]       return RESERVADO;
[eE][nN][dD][fF][oO][rR][eE][aA][cC][hH]        return RESERVADO;
[eE][nN][dD][iI][fF]    return RESERVADO;
[eE][nN][dD][sS][wW][iI][tT][cC][hH]    return RESERVADO;
[eE][nN][dD][wW][hH][iI][lL][eE]        return RESERVADO;
[eE][vV][aA][lL]       return RESERVADO;
[eE][xX][iI][tT]       return RESERVADO;
[eE][xX][tT][eE][nN][dD][sS]    return RESERVADO;
[fF][iI][nN][aA][lL]    return RESERVADO;
[fF][iI][nN][aA][lL][lL][yY]    return RESERVADO;
[fF][uU][nN][cC][tT][iI][oO][nN]        return RESERVADO;
[gG][lL][oO][bB][aA][lL]        return RESERVADO;
[iI][mM][pP][lL][eE][mM][eE][nN][tT][sS]        return RESERVADO;
[iI][nN][sS][tT][aA][nN][cC][eE][oO][fF]       return RESERVADO;
[iI][nN][sS][tT][eE][aA][dD][oO][fF]    return RESERVADO;
[iI][nN][tT][eE][rR][fF][aA][cC][eE]    return RESERVADO;
[iI][sS][sS][eE][tT]    return RESERVADO;
[lL][iI][sS][tT]       return RESERVADO;
[nN][eE][wW]    return RESERVADO;
[pP][hH][pP]["_"][vV][eE][rR][sS][iI][oO][nN]	return RESERVADO;
[pP][rR][iI][nN][tT]    return RESERVADO;
[pP][rR][iI][vV][aA][tT][eE]    return RESERVADO;
[pP][rR][oO][tT][eE][cC][tT][eE][dD]    return RESERVADO;
[pP][uU][bB][lL][iI][cC]        return RESERVADO;
[rR][eE][qQ][uU][iI][rR][eE]    return RESERVADO;
[rR][eE][qQ][uU][iI][rR][eE]_[oO][nN][cC][eE]        return RESERVADO;
[sS][tT][aA][tT][iI][cC]        return RESERVADO;
[sS][wW][iI][tT][cC][hH]       return RESERVADO;
[tT][hH][rR][oO][wW]    return RESERVADO;
[tT][rR][aA][iI][tT]    return RESERVADO;
[tT][rR][yY]    return RESERVADO;
[uU][nN][sS][eE][tT]    return RESERVADO;
[uU][sS][eE]    return RESERVADO;
[vV][aA][rR]    return RESERVADO;
[yY][iI][eE][lL][dD]    return RESERVADO;
{VAR}	return VARIABLE;
{OPA}	return OPERADOR;
{OPB}	return OPERADOR;
{NWL}	return NWL;
{ESP}	return ESP;
{CTRA} 	return CONTROL;
{CTRB}	return RESERVADO;
{PTS}	return OPERADOR;
{INT}|{DEC}|{BOOL}	return VALOR;
\"{ALL}\"|"'"{ALL}"'"	return TEXTO;
"$"[0-9][a-zA-Z0-9_]*	return ERROR;
{ERR}	return ERROR;
%%
int yywrap(void)
{
	return 1;
}
