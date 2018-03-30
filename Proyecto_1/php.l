%{
#include "wrap.h"
%}
ALL		.*
ESP		[\t|\n|\r|\s]+
VAR		"$"[a-zA-Z_][a-zA-Z0-9_]*
INT		[0-9]+
DEC		[0-9]*"."[0-9]*
INIT	"<?"[pP][hH][pP]
END		"?>"
OPA		"="|"+"|"-"|"*"|"/"|"%"|"<"|">"|"<="|">="|"<>"|"=="|"==="|"!=="|"!="|"."|"&&"|"\|\|"|[aA][nN][dD]|[oO][rR]|[xX][oO][rR]|"+="|"-="|"*="|"/="|".="|"&"	
OPB		"++"|"--"
%%
{INIT}	return PREDETERMINADO;
{END}	return PREDETERMINADO;
"//" 	return COMENTARIO;
"/*"{ALL}"*/"?	 	return COMENTARIO;
[aA][bB][sS][tT][rR][aA][cC][tT]        return RESERVADO;
[aA][nN][dD]    return RESERVADO;
[aA][rR][rR][aA][yY]"("{ESP}*[{ALL}*|{ESP}*]{ESP}*")"    return RESERVADO;
[aA][sS]        return RESERVADO;
[bB][rR][eE][aA][kK]    return RESERVADO;
[cC][aA][lL][lL][aA][bB][lL][eE]        return RESERVADO;
[cC][aA][sS][eE]        return RESERVADO;
[cC][aA][tT][cC][hH]    return RESERVADO;
[cC][lL][aA][sS][sS]    return RESERVADO;
[cC][lL][oO][nN][eE]    return RESERVADO;
[cC][oO][nN][sS][tT]    return RESERVADO;
[cC][oO][nN][tT][iI][nN][uU][eE]        return RESERVADO;
[dD][eE][cC][lL][aA][rR][eE]    return RESERVADO;
[dD][eE][fF][aA][uU][lL][tT]    return RESERVADO;
[dD][eE][fF][iI][nN][eE]"("{ALL}|[\n]*")"   return RESERVADO;
[dD][iI][eE]"("{ALL}*|{ESP}*")"    return RESERVADO;
[dD][oO]        return RESERVADO;
[eE][cC][hH][oO]        return RESERVADO;
[eE][lL][sS][eE]        return RESERVADO;
[eE][lL][sS][eE][iI][fF]        return RESERVADO;
[eE][mM][pP][tT][yY]"("{ALL}*|{ESP}*")"    return RESERVADO;
[eE][nN][dD][dD][eE][cC][lL][aA][rR][eE]        return RESERVADO;
[eE][nN][dD][fF][oO][rR]        return RESERVADO;
[eE][nN][dD][fF][oO][rR][eE][aA][cC][hH]        return RESERVADO;
[eE][nN][dD][iI][fF]    return RESERVADO;
[eE][nN][dD][sS][wW][iI][tT][cC][hH]    return RESERVADO;
[eE][nN][dD][wW][hH][iI][lL][eE]        return RESERVADO;
[eE][vV][aA][lL]"("{ALL}*|{ESP}*")"       return RESERVADO;
[eE][xX][iI][tT]"("{ALL}*|{ESP}*")"        return RESERVADO;
[eE][xX][tT][eE][nN][dD][sS]    return RESERVADO;
[fF][iI][nN][aA][lL]    return RESERVADO;
[fF][iI][nN][aA][lL][lL][yY]    return RESERVADO;
[fF][oO][rR]    return RESERVADO;
[fF][oO][rR][eE][aA][cC][hH]    return RESERVADO;
[fF][uU][nN][cC][tT][iI][oO][nN]        return RESERVADO;
[gG][lL][oO][bB][aA][lL]        return RESERVADO;
[gG][oO][tT][oO]        return RESERVADO;
[iI][fF]        return RESERVADO;
[iI][mM][pP][lL][eE][mM][eE][nN][tT][sS]        return RESERVADO;
[iI][nN][cC][lL][uU][dD][eE]    return RESERVADO;
[iI][nN][cC][lL][uU][dD][eE]_[oO][nN][cC][eE]        return RESERVADO;
[iI][nN][sS][tT][aA][nN][cC][eE][oO][fF]        return RESERVADO;
[iI][nN][sS][tT][eE][aA][dD][oO][fF]    return RESERVADO;
[iI][nN][tT][eE][rR][fF][aA][cC][eE]    return RESERVADO;
[iI][sS][sS][eE][tT]"("{ALL}*|{ESP}*")"    return RESERVADO;
[lL][iI][sS][tT]"("{ALL}*|{ESP}*")"       return RESERVADO;
[nN][eE][wW]    return RESERVADO;
[oO][rR]        return RESERVADO;
[pP][rR][iI][nN][tT]    return RESERVADO;
[pP][rR][iI][vV][aA][tT][eE]    return RESERVADO;
[pP][rR][oO][tT][eE][cC][tT][eE][dD]    return RESERVADO;
[pP][uU][bB][lL][iI][cC]        return RESERVADO;
[rR][eE][qQ][uU][iI][rR][eE]    return RESERVADO;
[rR][eE][qQ][uU][iI][rR][eE]_[oO][nN][cC][eE]        return RESERVADO;
[rR][eE][tT][uU][rR][nN]        return RESERVADO;
[sS][tT][aA][tT][iI][cC]        return RESERVADO;
[sS][wW][iI][tT][cC][hH]        return RESERVADO;
[tT][hH][rR][oO][wW]    return RESERVADO;
[tT][rR][aA][iI][tT]    return RESERVADO;
[tT][rR][yY]    return RESERVADO;
[uU][nN][sS][eE][tT]"("{ALL}*|{ESP}*")"    return RESERVADO;
[uU][sS][eE]    return RESERVADO;
[vV][aA][rR]    return RESERVADO;
[wW][hH][iI][lL][eE]    return RESERVADO;
[xX][oO][rR]    return RESERVADO;
[yY][iI][eE][lL][dD]    return RESERVADO;
{VAR}	return VARIABLE;
{OPA}	return OPERADOR;
{OPB}	return OPERADOR;
\"{ALL}\"	return TEXTO;
{ALL}	return TEXTO;
%%
int yywrap(void)
{
	return 1;
}
