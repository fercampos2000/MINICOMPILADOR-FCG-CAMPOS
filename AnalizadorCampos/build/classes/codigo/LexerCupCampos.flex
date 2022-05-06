package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCupCampos
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}

/* Comentarios */
( "//"(.)* ) {/*Ignore*/}

/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}

( "+" ) {return new Symbol(sym.OPERADORARITSuma, yychar, yyline, yytext());}
( "-" ) {return new Symbol(sym.OPERADORARITResta, yychar, yyline, yytext());}
( "/" ) {return new Symbol(sym.OPERADORARITDivicion, yychar, yyline, yytext());}
( "*" ) {return new Symbol(sym.OPERADORARITMultip, yychar, yyline, yytext());}
( "=" ) {return new Symbol(sym.ASIGNACION, yychar, yyline, yytext());}
( "<>" | ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.OperadorRacional, yychar, yyline, yytext());}
( true | false ) {return new Symbol(sym.OperadorBooleano, yychar, yyline, yytext());}
( "+=" | "-="  | "*=" | "/=" | "%=" ) {return new Symbol(sym.OperadorAtribucion, yychar, yyline, yytext());}
( "++" | "--" ) {return new Symbol(sym.OperadorIncremento, yychar, yyline, yytext());}
( "{" ) {return new Symbol(sym.SIMBOLOAGRUPLlaveAbir, yychar, yyline, yytext());}
( "}" ) {return new Symbol(sym.SIMBOLOAGRUPLlaveCerr, yychar, yyline, yytext());}
( "[" ) {return new Symbol(sym.SIMBOLOAGRUPCorchAbir, yychar, yyline, yytext());}
( "]" ) {return new Symbol(sym.SIMBOLOAGRUPCorchCerr, yychar, yyline, yytext());}
( "(" ) {return new Symbol(sym.SIMBOLOAGRUPParenAbir, yychar, yyline, yytext());}
( ")" ) {return new Symbol(sym.SIMBOLOAGRUPParenCerr, yychar, yyline, yytext());}
( "," ) {return new Symbol(sym.COMA, yychar, yyline, yytext());}
( "**" ) {return new Symbol(sym.FinalLinea, yychar, yyline, yytext());}
( "\n" ) {return new Symbol(sym.Linea, yychar, yyline, yytext());}
( "sientonces" ) {return new Symbol(sym.PalabReservIF, yychar, yyline, yytext());}
( "sinoentonces" ) {return new Symbol(sym.PalabReservELSE, yychar, yyline, yytext());}
( "delocontrario" ) {return new Symbol(sym.PalabReservELSEIF, yychar, yyline, yytext());}
( "para" ) {return new Symbol(sym.PalabReservFOR, yychar, yyline, yytext());}
( "hacerm" ) {return new Symbol(sym.PalabReservDO, yychar, yyline, yytext());}
( "mientras" ) {return new Symbol(sym.PalabReservWHILE, yychar, yyline, yytext());}
( "imprimir" ) {return new Symbol(sym.PalabReservIMPRIMIR, yychar, yyline, yytext());}
( "entero" ) {return new Symbol(sym.PalabReservINT, yychar, yyline, yytext());}
( byte | char | long | float | double ) {return new Symbol(sym.Tipodedato, yychar, yyline, yytext());}
( "texto" ) {return new Symbol(sym.PalabReservString, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.IDENTIFICADOR, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.NUMERO, yychar, yyline, yytext());}
( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
