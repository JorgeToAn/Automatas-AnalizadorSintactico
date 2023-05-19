package com.proyecto;

import java_cup.runtime.*;

%%
%public
%class Lexer
%cup
%line
%column

/* 
* ================================
*        INGRESAR TOKENS AQUI
* ================================
*/

%{
    StringBuffer string = new StringBuffer();

    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

%eofval{
    return symbol(ParserSym.EOF);
%eofval}

%%

/*
* ===================================================
*   INGRESAR SIMBOLOS DEVUELTOS POR CADA TOKEN AQUI
*
*   Ejemplo de formato:
*   {entero} { return symbol(ParserSym.ENTERO, yytext() ); }
*   "." { return symbol(PArserSym.PUNTO, yytext() ); }
* ===================================================
*/

[^] { throw new Error("Caracter ilegal <" + yytext() + ">\n Linea: " + yyline() + "Columna: " + yycolumn() ); }