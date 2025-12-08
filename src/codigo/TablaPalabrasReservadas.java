package codigo;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

/**
 * Tabla Fija: Contiene todas las palabras reservadas, operadores y delimitadores
 * del lenguaje CompilerCode.
 */
public class TablaPalabrasReservadas {
   
   // Usamos LinkedHashMap para mantener el orden visual
   private static final Map<String, String> PALABRAS_RESERVADAS = new LinkedHashMap<>();

    static {
        // --- Palabras de Control ---
        registrar("si", "PALABRA_RESERVADA");
        registrar("sino", "PALABRA_RESERVADA");
        registrar("fin_si", "PALABRA_RESERVADA");
        registrar("mientras", "PALABRA_RESERVADA");
        registrar("fin_mientras", "PALABRA_RESERVADA");
        
        // --- Estructura General ---
        registrar("compilar", "PALABRA_RESERVADA");
        registrar("ejecutarProg", "PALABRA_RESERVADA");
        registrar("principal", "PALABRA_RESERVADA");
        registrar("seccion", "PALABRA_RESERVADA");
        
        // --- Nombres de Secciones ---
        registrar("analisis_lexico", "PALABRA_RESERVADA");
        registrar("analisis_sintactico", "PALABRA_RESERVADA");
        registrar("tabla_simbolos", "PALABRA_RESERVADA");
        
        // --- Definiciones Léxicas ---
        registrar("definir_alfabeto", "PALABRA_RESERVADA");
        registrar("conjunto", "PALABRA_RESERVADA");
        registrar("definir_tokens", "PALABRA_RESERVADA");
        registrar("ignorar", "PALABRA_RESERVADA");
        registrar("patron", "PALABRA_RESERVADA");
        registrar("token", "PALABRA_RESERVADA");
        registrar("palabras_reservadas", "PALABRA_RESERVADA");
        
        // --- Definiciones de Autómatas ---
        registrar("ejecutar_automata", "PALABRA_RESERVADA");
        registrar("estados", "PALABRA_RESERVADA");
        registrar("estado_inicial", "PALABRA_RESERVADA");
        registrar("estados_finales", "PALABRA_RESERVADA");
        registrar("transiciones", "PALABRA_RESERVADA");
        registrar("otro", "PALABRA_RESERVADA");
        
        // --- Definiciones Sintácticas ---
        registrar("regla", "PALABRA_RESERVADA");
        registrar("inicio", "PALABRA_RESERVADA");
        registrar("vacio", "PALABRA_RESERVADA");
        registrar("terminales", "PALABRA_RESERVADA");
        registrar("no_terminales", "PALABRA_RESERVADA");
        
        // --- Manipulación de Tabla de Símbolos ---
        registrar("estructura_tabla", "PALABRA_RESERVADA");
        registrar("campo", "PALABRA_RESERVADA");
        registrar("tabla", "PALABRA_RESERVADA");
        registrar("generar_TablaSimbolos", "PALABRA_RESERVADA"); // Ojo: en LexerCup es generar_TS pero en flex pusiste este nombre largo
        registrar("generar_ts", "PALABRA_RESERVADA"); // Agregamos ambos por si acaso
        registrar("construir_tabla", "PALABRA_RESERVADA");
        
        // --- Funciones del Sistema y Variables ---
        registrar("entrada", "PALABRA_RESERVADA");
        registrar("imprimir", "PALABRA_RESERVADA");
        registrar("arbol", "PALABRA_RESERVADA");
        registrar("tokens", "PALABRA_RESERVADA");
        registrar("dibujar", "PALABRA_RESERVADA");
        registrar("cargar_archivo", "PALABRA_RESERVADA");
        registrar("verificar_errores", "PALABRA_RESERVADA");
        registrar("ver_errores", "PALABRA_RESERVADA");
        registrar("limpiar_errores", "PALABRA_RESERVADA");
        registrar("linea", "PALABRA_RESERVADA");
        registrar("columna", "PALABRA_RESERVADA");
        
        // --- Operadores Aritméticos ---
        registrar("+", "OPE_ARITMETICO");
        registrar("-", "OPE_ARITMETICO"); // En tu flex está como parte de [-+*/=<>!&] pero aquí lo detallamos
        registrar("*", "OPE_ARITMETICO");
        registrar("/", "OPE_ARITMETICO");
        
        // --- Operadores Relacionales ---
        registrar("==", "OPE_RELACIONAL");
        registrar("!=", "OPE_RELACIONAL");
        registrar("<", "OPE_RELACIONAL");
        registrar(">", "OPE_RELACIONAL");
        registrar("<=", "OPE_RELACIONAL");
        registrar(">=", "OPE_RELACIONAL");
        
        // --- Operadores Lógicos ---
        registrar("&&", "OPE_LOGICO");
        registrar("||", "OPE_LOGICO");
        registrar("!", "OPE_LOGICO");
        
        // --- Otros Operadores ---
        registrar("=", "OPE_ASIGNACION");
        registrar("=>", "OPE_TRANSICION");
        
        // --- Delimitadores ---
        registrar("(", "DELIMITADOR");
        registrar(")", "DELIMITADOR");
        registrar("{", "DELIMITADOR");
        registrar("}", "DELIMITADOR");
        registrar("[", "DELIMITADOR");
        registrar("]", "DELIMITADOR");
        registrar(";", "DELIMITADOR");
        registrar(",", "DELIMITADOR");
        registrar(":", "DELIMITADOR");
        registrar("|", "DELIMITADOR");
    }

    private static void registrar(String lexema, String componente) {
        PALABRAS_RESERVADAS.put(lexema, componente);
    }

    /**
     * Revisa si un lexema existe en la tabla fija.
     * @param lexema El texto a buscar.
     * @return true si es reservada, false si no.
     */
    public static boolean esReservada(String lexema) {
        if (lexema == null) return false;
        return PALABRAS_RESERVADAS.containsKey(lexema);
    }

    /**
     * Devuelve el conjunto de claves (los lexemas) para iterar en la GUI.
     */
    public static Set<String> getPalabrasReservadas() {
        return Collections.unmodifiableSet(PALABRAS_RESERVADAS.keySet());
    }
    
    /**
     * Método necesario para tu GUI (VerTablaFija).
     * Devuelve el tipo de componente (ej: "PALABRA_RESERVADA", "DELIMITADOR")
     */
    public static String getComponente(String lexema) {
        return PALABRAS_RESERVADAS.get(lexema);
    }
}