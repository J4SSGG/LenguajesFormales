%{
#include "miniPHP.h"
%}
%option yylineno
ALL		.*
ESP		[ \t\r]+
NWL		[\n]*
VAR		"$"[a-zA-Z_\x7F-\xFF][a-zA-Z0-9_\x7F-\xFF]*
INT		"+-"*[0-9]+
DEC		"+-"*[0-9]*"."[0-9]*
BOOL	[tT][rR][uU][eE]|[fF][aA][lL][sS][eE]
INIT	"<?"[pP][hH][pP]
END		"?>"
OPA		"="|"+"|"-"|"*"|"/"|"%"|"<"|">"|"<="|">="|"<>"|"=="|"==="|"!=="|"!="|"."|"&&"|"||"|[aA][nN][dD]|[oO][rR]|[xX][oO][rR]|"+="|"-="|"*="|"/="|".="|"&"|"!"
OPB		"++"|"--"|"=>"|"->"|"@"|"&"|"|"|"^"|"~"|"<<"|">>"|"<==>"|"??"|"`"|"**"
PTS		"("|")"|"{"|"}"|";"|","|"["|"]"|"?"|":"|";"
STC		[dD][oO][uU][bB][lL][eE]|[iI][nN][tT]|[sS][tT][rR][iI][nN][gG]|[fF][lL][oO][aA][tT]|[bB][oO][oO][lL]|[rR][eE][aA][lL]|[bB][oO][oO][lL][eE][aA][nN]|[iI][nN][tT][eE][gG][eE][rR]
CTRA	[iI][fF]|[eE][lL][sS][eE][_][iI][fF]|[eE][lL][sS][eE][iI][fF]|[wW][hH][iI][lL][eE]|[fF][oO][rR]|[fF][oO][rR][eE][aA][cC][hH]|[sS][wW][iI][tT][cC][hH]|[eE][nN][dD][iI][fF]|[cC][aA][tT][cC][hH]|[tT][rR][yY]
CTRB	[rR][eE][tT][uU][rR][nN]|[dD][oO]|[cC][aA][sS][eE]|[bB][rR][eE][aA][kK]|[gG][oO][tT][oO]|[eE][lL][sS][eE]|[iI][nN][cC][lL][uU][dD][eE]|[iI][nN][cC][lL][uU][dD][eE][_][oO][nN][cC][eE]|[cC][oO][nN][tT][iI][nN][uU][eE]
ERR		[a-zA-Z_\x7F-\xFF0-9]*
NAME	[a-zA-Z_\x7F-\xFF][a-zA-Z0-9_]*
%%
({ESP}|{NWL})*{INIT}	return INIT;
{END}	return CONTROL;
"$_"[gG][lL][oO][bB][aA][lL][sS]    return PREDETERMINADO;
"$_"[sS][eE][rR][vV][eE][rR]        return PREDETERMINADO;
"$_"[gG][eE][tT]    return PREDETERMINADO;
"$_"[pP][oO][sS][tT]        return PREDETERMINADO;
"$_"[fF][iI][lL][eE][sS]    return PREDETERMINADO;
"$_"[rR][eE][qQ][uU][eE][sS][tT]    return PREDETERMINADO;
"$_"[eE][nN][vV]    return PREDETERMINADO;
"$_"[sS][eE][sS][sS][iI][oO][nN]    return PREDETERMINADO;
"$_"[cC][oO][oO][kK][iI][eE]        return PREDETERMINADO;
"$"[hH][tT][tT][pP][_][rR][aA][wW][_][pP][oO][sS][tT][_][dD][aA][tT][aA]    return IDENTIFICADOR;
"$"[pP][hH][pP][_][eE][rR][rR][oO][rR][mM][sS][gG]    return IDENTIFICADOR;
"$"[hH][tT][tT][pP][_][rR][eE][sS][pP][oO][nN][sS][eE][_][hH][eE][aA][dD][eE][rR]        return IDENTIFICADOR;
"$"[aA][rR][gG][cC]        return IDENTIFICADOR;
"$"[aA][rR][gG][vV]        return IDENTIFICADOR;
"//"{ALL} 	return COMENTARIO;
"#"{ALL}	return COMENTARIO;
"/*"([^*]|(\*+[^*/]))*\*+\/ 	 	return COMENTARIO;
[pP][hH][pP][_][vV][eE][rR][sS][iI][oO][nN]    return PREDETERMINADO;
[pP][hH][pP][_][mM][aA][jJ][oO][rR][_][vV][eE][rR][sS][iI][oO][nN]    return PREDETERMINADO;
[pP][hH][pP][_][mM][iI][nN][oO][rR][_][vV][eE][rR][sS][iI][oO][nN]    return PREDETERMINADO;
[pP][hH][pP][_][rR][eE][lL][eE][aA][sS][eE][_][vV][eE][rR][sS][iI][oO][nN]   return PREDETERMINADO;
[pP][hH][pP][_][vV][eE][rR][sS][iI][oO][nN][_][iI][dD]        return PREDETERMINADO;
[pP][hH][pP][_][eE][xX][tT][rR][aA][_][vV][eE][rR][sS][iI][oO][nN]    return PREDETERMINADO;
[pP][hH][pP][_][zZ][tT][sS]    return PREDETERMINADO;
[pP][hH][pP][_][dD][eE][bB][uU][gG]    return PREDETERMINADO;
[pP][hH][pP][_][mM][aA][xX][pP][aA][tT][hH][lL][eE][nN]        return PREDETERMINADO;
[pP][hH][pP][_][oO][sS]        return PREDETERMINADO;
[pP][hH][pP][_][oO][sS][_][fF][aA][mM][iI][lL][yY]    return PREDETERMINADO;
[pP][hH][pP][_][sS][aA][pP][iI]        return PREDETERMINADO;
[pP][hH][pP][_][eE][oO][lL]    return PREDETERMINADO;
[pP][hH][pP][_][iI][nN][tT][_][mM][aA][xX]    return PREDETERMINADO;
[pP][hH][pP][_][iI][nN][tT][_][mM][iI][nN]    return PREDETERMINADO;
[pP][hH][pP][_][iI][nN][tT][_][sS][iI][zZ][eE]        return PREDETERMINADO;
[pP][hH][pP][_][fF][lL][oO][aA][tT][_][dD][iI][gG]    return PREDETERMINADO;
[pP][hH][pP][_][fF][lL][oO][aA][tT][_][eE][pP][sS][iI][lL][oO][nN]    return PREDETERMINADO;
[pP][hH][pP][_][fF][lL][oO][aA][tT][_][mM][iI][nN]    return PREDETERMINADO;
[pP][hH][pP][_][fF][lL][oO][aA][tT][_][mM][aA][xX]    return PREDETERMINADO;
[dD][eE][fF][aA][uU][lL][tT][_][iI][nN][cC][lL][uU][dD][eE][_][pP][aA][tT][hH]	return PREDETERMINADO;
[pP][eE][aA][rR][_][iI][nN][sS][tT][aA][lL][lL][_][dD][iI][rR]        return PREDETERMINADO;
[pP][eE][aA][rR][_][eE][xX][tT][eE][nN][sS][iI][oO][nN][_][dD][iI][rR]       return PREDETERMINADO;
[pP][hH][pP][_][eE][xX][tT][eE][nN][sS][iI][oO][nN][_][dD][iI][rR]    return PREDETERMINADO;
[pP][hH][pP][_][pP][rR][eE][fF][iI][xX]        return PREDETERMINADO;
[pP][hH][pP][_][bB][iI][nN][dD][iI][rR]        return PREDETERMINADO;
[pP][hH][pP][_][bB][iI][nN][aA][rR][yY]        return PREDETERMINADO;
[pP][hH][pP][_][mM][aA][nN][dD][iI][rR]        return PREDETERMINADO;
[pP][hH][pP][_][lL][iI][bB][dD][iI][rR]        return PREDETERMINADO;
[pP][hH][pP][_][dD][aA][tT][aA][dD][iI][rR]    return PREDETERMINADO;
[pP][hH][pP][_][sS][yY][sS][cC][oO][nN][fF][dD][iI][rR]        return PREDETERMINADO;
[pP][hH][pP][_][lL][oO][cC][aA][lL][sS][tT][aA][tT][eE][dD][iI][rR]    return PREDETERMINADO;
[pP][hH][pP][_][cC][oO][nN][fF][iI][gG][_][fF][iI][lL][eE][_][pP][aA][tT][hH]		return PREDETERMINADO;
[pP][hH][pP][_][cC][oO][nN][fF][iI][gG][_][fF][iI][lL][eE][_][sS][cC][aA][nN][_][dD][iI][rR]        return PREDETERMINADO;
[pP][hH][pP][_][sS][hH][lL][iI][bB][_][sS][uU][fF][fF][iI][xX]        return PREDETERMINADO;
[pP][hH][pP][_][fF][dD][_][sS][eE][tT][sS][iI][zZ][eE]        return PREDETERMINADO;
[eE][_][eE][rR][rR][oO][rR]    return PREDETERMINADO;
[eE][_][wW][aA][rR][nN][iI][nN][gG]    return PREDETERMINADO;
[eE][_][pP][aA][rR][sS][eE]    return PREDETERMINADO;
[eE][_][nN][oO][tT][iI][cC][eE]        return PREDETERMINADO;
[eE][_][cC][oO][rR][eE][_][eE][rR][rR][oO][rR]        return PREDETERMINADO;
[eE][_][cC][oO][rR][eE][_][wW][aA][rR][nN][iI][nN][gG]        return PREDETERMINADO;
[eE][_][cC][oO][mM][pP][iI][lL][eE][_][eE][rR][rR][oO][rR]    return PREDETERMINADO;
[eE][_][cC][oO][mM][pP][iI][lL][eE][_][wW][aA][rR][nN][iI][nN][gG]    return PREDETERMINADO;
[eE][_][uU][sS][eE][rR][_][eE][rR][rR][oO][rR]        return PREDETERMINADO;
[eE][_][uU][sS][eE][rR][_][wW][aA][rR][nN][iI][nN][gG]        return PREDETERMINADO;
[eE][_][uU][sS][eE][rR][_][nN][oO][tT][iI][cC][eE]    return PREDETERMINADO;
[eE][_][dD][eE][pP][rR][eE][cC][aA][tT][eE][dD]        return PREDETERMINADO;
[eE][_][uU][sS][eE][rR][_][dD][eE][pP][rR][eE][cC][aA][tT][eE][dD]    return PREDETERMINADO;
[eE][_][aA][lL][lL]    return PREDETERMINADO;
[eE][_][sS][tT][rR][iI][cC][tT]        return PREDETERMINADO;
[_][_][cC][oO][mM][pP][iI][lL][eE][rR][_][hH][aA][lL][tT][_][oO][fF][fF][sS] return PREDETERMINADO;
[nN][uU][lL][lL]    return PREDETERMINADO;
[aA][bB][sS][tT][rR][aA][cC][tT]       return RESERVADO;
[aA][nN][dD]    return RESERVADO;
[aA][rR][rR][aA][yY]   return RESERVADO;
[aA][sS]        return RESERVADO;
[cC][aA][lL][lL][aA][bB][lL][eE]        return RESERVADO;
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
[iI][nN][cC][lL][uU][dD][eE]    return RESERVADO;
[iI][nN][cC][lL][uU][dD][eE]_[oO][nN][cC][eE]        return RESERVADO;
[iI][nN][sS][tT][eE][aA][dD][oO][fF]    return RESERVADO;
[iI][nN][tT][eE][rR][fF][aA][cC][eE]    return RESERVADO;
[iI][sS][sS][eE][tT]    return RESERVADO;
[lL][iI][sS][tT]       return RESERVADO;
[nN][eE][wW]    return RESERVADO;
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
[uU][nN][sS][eE][tT]    return RESERVADO;
[uU][sS][eE]    return RESERVADO;
[vV][aA][rR]    return RESERVADO;
[vV][oO][iI][dD]	return RESERVADO;
[yY][iI][eE][lL][dD]    return RESERVADO;
{STC}	return TIPO;
{CTRA} 	return CONTROL;
{CTRB}	return RESERVADO;
{VAR}	return VARIABLE;
{OPA}	return OPERADOR;
{OPB}	return OPERADOR;
{PTS}	return OPERADOR;
{NWL}	return NWL;
{ESP}	return ESP;
{INT}|{DEC}|{BOOL}	return VALOR;
\"{ALL}\"|\'{ALL}\'	return TEXTO;
{NAME}	return PROPIEDAD;
"['"{NAME}"']"	return BD;
"$"^[a-zA-Z_\x7F-\xFF][a-zA-Z0-9_\x7F-\xFF]*|"$"	return ERROR;
{ERR}	return ERROR;
%%
int yywrap(void)
{
	return 1;
}
