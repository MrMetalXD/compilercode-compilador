package codigo;
import static codigo.Tokens.*;

%%
%class Lexer
%type Tokens
%line
%column

%{
    private final TablaSimbolos tablaSimbolos = new TablaSimbolos();
    
    private Tokens token(String lex, String comp, int li, int c){
        return new Tokens(lex, comp, li+1, c+1); 
    }
%}

LETRAS = [a-zA-Z_]+
ESPACIO = [ \t\r\n]+
DIGITO = [0-9]
ENTERO = {DIGITO}+
DECIMAL = "." {DIGITO}+
EXPRESION = [eE][+-]?{ENTERO}
NUMERO = {ENTERO} ( {DECIMAL} )?

IDENTIFICADOR = {LETRAS}({LETRAS}|{DIGITO})*
CADENA = \"([^\"\\]|\\.)*\"
COMENTARIO = \#.*                          

/* Simbolos comunes en quimica */

UNIDAD_MOL = "mol" /* mol cantidad de sustancia */
UNIDAD_GRAMOS = "g" /* gramos */
UNIDAD_KG = "kg" /* kilogramos */
UNIDAD_L = "L" /* litros */
UNIDAD_ML = "ml" /*mililitros */
UNIDAD_ATM = "atm" /* atmosferas de presion */
UNIDAD_KPA = "kPa" /* kilopascales (presion) */
UNIDAD_BAR = "bar" /* otra unidad de presion */
UNIDAD_K = "K" /* Kelvin */
UNIDAD_C = "C" /* grados Celsius */
UNIDAD_PCTJ = "%" /* porcentaje */
UNIDAD_MOLAR = "M" /* molaridad = mol/L */

LIT_NUM_U      = {NUMERO}({UNIDAD_MOL}|{UNIDAD_GRAMOS}|{UNIDAD_KG}|{UNIDAD_L}|{UNIDAD_ML}|{UNIDAD_ATM}|{UNIDAD_KPA}|{UNIDAD_BAR}|{UNIDAD_K}|{UNIDAD_C}|{UNIDAD_PCTJ}|{UNIDAD_MOLAR})
%%
/* Literales con unidad (ej.: 25C, 1.0atm, 0.1M, 50mL, 2.5 bar) */

/* espacios y comentarios */
{ESPACIO}                    { /* ignorar */ }
{COMENTARIO}                 { /* ignorar */ }

/* Control de flujo y utilidades */
"SI"             { return token(yytext(),"SI",yyline,yycolumn); }
"SINO"           { return token(yytext(),"SINO",yyline,yycolumn); }
"FIN_SI"         { return token(yytext(),"FIN_SI",yyline,yycolumn); }
"MIENTRAS"       { return token(yytext(),"MIENTRAS",yyline,yycolumn); }
"FIN_MIENTRAS"   { return token(yytext(),"FIN_MIENTRAS",yyline,yycolumn); }
"PARA"           { return token(yytext(),"PARA",yyline,yycolumn); }
"FIN_PARA"       { return token(yytext(),"FIN_PARA",yyline,yycolumn); }
"REPETIR"        { return token(yytext(),"REPETIR",yyline,yycolumn); }
"VECES"          { return token(yytext(),"VECES",yyline,yycolumn); }
"FIN_REPETIR"    { return token(yytext(),"FIN_REPETIR",yyline,yycolumn); }
"ESPERAR"        { return token(yytext(),"ESPERAR",yyline,yycolumn); }
"FUNCION"        { return token(yytext(),"FUNCION",yyline,yycolumn); }
"RETORNAR"       { return token(yytext(),"RETORNAR",yyline,yycolumn); }
"IMPRIMIR"       { return token(yytext(),"IMPRIMIR",yyline,yycolumn); }
"LEER"           { return token(yytext(),"LEER",yyline,yycolumn); }
"ALEATORIO"      { return token(yytext(),"ALEATORIO",yyline,yycolumn); }

/* Organización / módulos */
"EXPERIMENTO"                       { return token(yytext(),"EXPERIMENTO",yyline,yycolumn); }
"FIN_EXPERIMENTO"                   { return token(yytext(),"FIN_EXPERIMENTO",yyline,yycolumn); }
"BLOQUE"                            { return token(yytext(),"BLOQUE",yyline,yycolumn); }
"FIN_BLOQUE"                        { return token(yytext(),"FIN_BLOQUE",yyline,yycolumn); }
"IMPORTAR"                          { return token(yytext(),"IMPORTAR",yyline,yycolumn); }
"PAQUETE"                           { return token(yytext(),"PAQUETE",yyline,yycolumn); }
"USAR"                              { return token(yytext(),"USAR",yyline,yycolumn); }
"CONSTANTE"                         { return token(yytext(),"CONSTANTE",yyline,yycolumn); }
"VARIABLE"                          { return token(yytext(),"VARIABLE",yyline,yycolumn); }

/* Dominio químico: entidades y cantidades */
"ELEMENTO"                          { return token(yytext(),"ELEMENTO",yyline,yycolumn); }
"COMPUESTO"                         { return token(yytext(),"COMPUESTO",yyline,yycolumn); }
"MEZCLA"                            { return token(yytext(),"MEZCLA",yyline,yycolumn); }
"CANTIDAD"                          { return token(yytext(),"CANTIDAD",yyline,yycolumn); }
"MOLES"                             { return token(yytext(),"MOLES",yyline,yycolumn); }
"GRAMOS"                            { return token(yytext(),"GRAMOS",yyline,yycolumn); }
"LITROS"                            { return token(yytext(),"LITROS",yyline,yycolumn); }
"ESTADO"                            { return token(yytext(),"ESTADO",yyline,yycolumn); }
"SOLIDO"                            { return token(yytext(),"SOLIDO",yyline,yycolumn); }
"LIQUIDO"                           { return token(yytext(),"LIQUIDO",yyline,yycolumn); }
"GAS"                               { return token(yytext(),"GAS",yyline,yycolumn); }
"ACUOSO"                            { return token(yytext(),"ACUOSO",yyline,yycolumn); }
"PUREZA"                            { return token(yytext(),"PUREZA",yyline,yycolumn); }
"CONCENTRACION"                     { return token(yytext(),"CONCENTRACION",yyline,yycolumn); }
"MOLARIDAD"                         { return token(yytext(),"MOLARIDAD",yyline,yycolumn); }

/* 4.3 Acciones de laboratorio (core) */
"CREAR"                             { return token(yytext(),"CREAR",yyline,yycolumn); }
"ELIMINAR"                          { return token(yytext(),"ELIMINAR",yyline,yycolumn); }
"LIMPIAR"                           { return token(yytext(),"LIMPIAR",yyline,yycolumn); }
"COMBINAR"                          { return token(yytext(),"COMBINAR",yyline,yycolumn); }
"AGREGAR"                           { return token(yytext(),"AGREGAR",yyline,yycolumn); }
"DISOLVER"                          { return token(yytext(),"DISOLVER",yyline,yycolumn); }
"PRECIPITAR"                        { return token(yytext(),"PRECIPITAR",yyline,yycolumn); }
"EVAPORAR"                          { return token(yytext(),"EVAPORAR",yyline,yycolumn); }
"DESTILAR"                          { return token(yytext(),"DESTILAR",yyline,yycolumn); }
"FILTRAR"                           { return token(yytext(),"FILTRAR",yyline,yycolumn); }
"TITULAR"                           { return token(yytext(),"TITULAR",yyline,yycolumn); }
"USAR_CATALIZADOR"                  { return token(yytext(),"USAR_CATALIZADOR",yyline,yycolumn); }
"AJUSTAR_TEMPERATURA"               { return token(yytext(),"AJUSTAR_TEMPERATURA",yyline,yycolumn); }
"AJUSTAR_PRESION"                   { return token(yytext(),"AJUSTAR_PRESION",yyline,yycolumn); }
"AGITAR"                            { return token(yytext(),"AGITAR",yyline,yycolumn); }
"CALENTAR"                          { return token(yytext(),"CALENTAR",yyline,yycolumn); }
"ENFRIAR"                           { return token(yytext(),"ENFRIAR",yyline,yycolumn); }
"ANOTAR"                            { return token(yytext(),"ANOTAR",yyline,yycolumn); }

/* 4.6 Reportes, evaluación y persistencia */
"GENERAR_REPORTE"                   { return token(yytext(),"GENERAR_REPORTE",yyline,yycolumn); }
"EXPORTAR"                          { return token(yytext(),"EXPORTAR",yyline,yycolumn); }
"GUARDAR"                           { return token(yytext(),"GUARDAR",yyline,yycolumn); }
"CARGAR"                            { return token(yytext(),"CARGAR",yyline,yycolumn); }
"EXPLICAR_REACCION"                 { return token(yytext(),"EXPLICAR_REACCION",yyline,yycolumn); }
"ADVERTIR"                          { return token(yytext(),"ADVERTIR",yyline,yycolumn); }
"RUBRICA"                           { return token(yytext(),"RUBRICA",yyline,yycolumn); }
"PUNTUACION"                        { return token(yytext(),"PUNTUACION",yyline,yycolumn); }

/* 4.4 Análisis, predicción y propiedades */
"INFO"                              { return token(yytext(),"INFO",yyline,yycolumn); }
"MASA_MOLAR"                        { return token(yytext(),"MASA_MOLAR",yyline,yycolumn); }
"BALANCEAR"                         { return token(yytext(),"BALANCEAR",yyline,yycolumn); }
"TIPO_REACCION"                     { return token(yytext(),"TIPO_REACCION",yyline,yycolumn); }
"ENERGIA_REACCION"                  { return token(yytext(),"ENERGIA_REACCION",yyline,yycolumn); }
"ENTALPIA"                          { return token(yytext(),"ENTALPIA",yyline,yycolumn); }
"ENTROPIA"                          { return token(yytext(),"ENTROPIA",yyline,yycolumn); }
"GIBBS"                             { return token(yytext(),"GIBBS",yyline,yycolumn); }
"PREDICIR_PRODUCTO"                 { return token(yytext(),"PREDICIR_PRODUCTO",yyline,yycolumn); }
"EQUILIBRIO"                        { return token(yytext(),"EQUILIBRIO",yyline,yycolumn); }
"PKA"                               { return token(yytext(),"PKA",yyline,yycolumn); }
"PH"                                { return token(yytext(),"PH",yyline,yycolumn); }
"ESTEQUIOMETRIA"                    { return token(yytext(),"ESTEQUIOMETRIA",yyline,yycolumn); }
"REACTIVO_LIMITANTE"                { return token(yytext(),"REACTIVO_LIMITANTE",yyline,yycolumn); }

/* 4.8 Tipos y literales especiales */
"NUMERO"                            { return token(yytext(),"TIPO_NUMERO",yyline,yycolumn); }
"CADENA"                            { return token(yytext(),"TIPO_CADENA",yyline,yycolumn); }
"BOOLEANO"                          { return token(yytext(),"TIPO_BOOLEANO",yyline,yycolumn); }
"LISTA"                             { return token(yytext(),"TIPO_LISTA",yyline,yycolumn); }
"MAPA"                              { return token(yytext(),"TIPO_MAPA",yyline,yycolumn); }
"VERDADERO"                         { return token(yytext(),"VERDADERO",yyline,yycolumn); }
"FALSO"                             { return token(yytext(),"FALSO",yyline,yycolumn); }
"NULO"                              { return token(yytext(),"NULO",yyline,yycolumn); }

/* ====== 5) Operadores ====== */
/* Reacción */
"->"                                { return token(yytext(),"OP_FLECHA",yyline,yycolumn); }
"+"                                 { return token(yytext(),"OP_MAS",yyline,yycolumn); }

/* Aritméticos */
"-"                                 { return token(yytext(),"OP_MENOS",yyline,yycolumn); }
"*"                                 { return token(yytext(),"OP_POR",yyline,yycolumn); }
"/"                                 { return token(yytext(),"OP_DIV",yyline,yycolumn); }
"^"                                 { return token(yytext(),"OP_POW",yyline,yycolumn); }

/* Relacionales */
"=="                                { return token(yytext(),"OP_IGUAL",yyline,yycolumn); }
"!="                                { return token(yytext(),"OP_DIF",yyline,yycolumn); }
"<="                                { return token(yytext(),"OP_MENOR_IGUAL",yyline,yycolumn); }
">="                                { return token(yytext(),"OP_MAYOR_IGUAL",yyline,yycolumn); }
"<"                                 { return token(yytext(),"OP_MENOR",yyline,yycolumn); }
">"                                 { return token(yytext(),"OP_MAYOR",yyline,yycolumn); }
"="                                 { return token(yytext(),"OP_ASIGN",yyline,yycolumn); }

/* Lógicos (símbolos y alias en español) */
"Y"                                 { return token(yytext(),"OP_AND",yyline,yycolumn); }
"O"                                 { return token(yytext(),"OP_OR",yyline,yycolumn); }
"NO"                                { return token(yytext(),"OP_NOT",yyline,yycolumn); }

/* ====== 6) Delimitadores ====== */
"("                                 { return token(yytext(),"PAREN_ABRE",yyline,yycolumn); }
")"                                 { return token(yytext(),"PAREN_CIERRA",yyline,yycolumn); }
"{"                                 { return token(yytext(),"LLAVE_ABRE",yyline,yycolumn); }
"}"                                 { return token(yytext(),"LLAVE_CIERRA",yyline,yycolumn); }
"["                                 { return token(yytext(),"CORCHETE_ABRE",yyline,yycolumn); }
"]"                                 { return token(yytext(),"CORCHETE_CIERRA",yyline,yycolumn); }
","                                 { return token(yytext(),"COMA",yyline,yycolumn); }
":"                                 { return token(yytext(),"DOS_PUNTOS",yyline,yycolumn); }
";"                                 { return token(yytext(),"PUNTO_COMA",yyline,yycolumn); }

/* ====== 7) Literales ====== */
{CADENA}                            { return token(yytext(),"LIT_CADENA",yyline,yycolumn); }
{LIT_NUM_U}                         { return token(yytext(),"LIT_NUM_CON_UNIDAD",yyline,yycolumn); }
{NUMERO}                            { return token(yytext(),"LIT_NUMERO",yyline,yycolumn); }



  /* -------- Identificadores -------- */
  {IDENTIFICADOR} {
        if (tablaSimbolos.esReservada(yytext())){
            return token(yytext(),"ERROR_IDENTIFICADOR_ES_PALABRA_RESERVADA",yyline,yycolumn);
        } else {
            tablaSimbolos.registrarIdentificador(yytext(), yyline+1, yycolumn+1);
            return token(yytext(),"IDENTIFICADOR",yyline,yycolumn);
        }             
  }

  /* -------- Errores léxicos comunes -------- */
  \"[^\"\n]* { return token(yytext(),"ERROR_CADENA_NO_CERRADA",yyline,yycolumn); }
  [^\s\w\[\]{}();:,.=<>+\-*/\"ÁÉÍÓÚÜÑáéíóúüñ%] { return token(yytext(),"ERROR_CARACTER_INVALIDO",yyline,yycolumn); }

/* -------- Error de análisis -------- */
. {return token(yytext(), "ERROR", yyline, yycolumn);}
