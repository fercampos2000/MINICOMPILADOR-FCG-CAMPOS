package codigo;
import static codigo.Tokens.*;
%%
%class LexerCampos
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
ESPACIO=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/* Espacios en blanco */
{ESPACIO} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Salto de linea */
( "\n" ) {return Linea;}

/* Comillas */
( "\"" ) {lexeme=yytext(); return Comillas;}

( "+" ) {lexeme=yytext (); return OPERADORARITSuma; }
( "-" ) {lexeme=yytext (); return OPERADORARITResta; }
( "/" ) {lexeme=yytext (); return OPERADORARITDivicion; }
( "*" ) {lexeme=yytext (); return OPERADORARITMultip; }
( "=" ) {lexeme=yytext (); return ASIGNACION; }
( "<>" | ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {lexeme=yytext (); return OperadorRacional; }
( true | false ) {lexeme=yytext (); return OperadorBooleano; }
( "+=" | "-=" ) | "*=" | "/=" | "%=" {lexeme=yytext (); return OperadorAtribucion; }
( "++" | "--" ) {lexeme=yytext (); return OperadorIncremento; }
( "{" ) {lexeme=yytext (); return SIMBOLOAGRUPLlaveAbir; }
( "}" ) {lexeme=yytext (); return SIMBOLOAGRUPLlaveCerr; }
( "[" ) {lexeme=yytext (); return SIMBOLOAGRUPCorchAbir; }
( "]" ) {lexeme=yytext (); return SIMBOLOAGRUPCorchCerr; }
( "(" ) {lexeme=yytext (); return SIMBOLOAGRUPParenAbir; }
( ")" ) {lexeme=yytext (); return SIMBOLOAGRUPParenCerr; }
( "," ) {lexeme=yytext (); return COMA; }
( "**" ) {lexeme=yytext (); return FinalLinea; }
( "\n" ) {lexeme=yytext (); return Linea; }
( "sientonces" ) {lexeme=yytext (); return PalabReservIF;}
( "sinoentonces" ) {lexeme=yytext (); return PalabReservELSE;}
( "delocontrario" ) {lexeme=yytext (); return PalabReservELSEIF;}
( "para" ) {lexeme=yytext (); return PalabReservFOR;}
( "hacerm" ) {lexeme=yytext (); return PalabReservDO;}
( "mientras" ) {lexeme=yytext (); return PalabReservWHILE;}
( "imprimir" ) {lexeme=yytext (); return PalabReservIMPRIMIR;}
( "entero" ) {lexeme=yytext (); return PalabReservINT;}
( "byte" | "char" | "long" | "float" | "double" ) {lexeme=yytext (); return Tipodedato;}
( "texto" ) {lexeme=yytext (); return PalabReservString;}
( "main" ) {lexeme=yytext (); return Main;}
/* Identificador */
{L}({L}|{D})* {lexeme=yytext(); return IDENTIFICADOR;}

/* Numero */
("(-"{D}+")")|{D}+ {lexeme=yytext(); return NUMERO;}

/* Error de analisis */
 . {return ERROR;}
