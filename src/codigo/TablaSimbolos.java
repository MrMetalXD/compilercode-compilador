/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;
import java.util.*;

/**
 *
 * @author alanc
 */
public class TablaSimbolos {
    private final Set<String> reservadas = new HashSet<>(Arrays.asList( 
   "si", "entonces", "sino", "fin_si",
    "mientras", "hacer", "fin_mientras",
    "para", "cada", "en", "fin_para",
    "intentar", "capturar", "fin_intentar",
    "retornar", "romper", "continuar",
    "configuracion", "fin_configuracion",
    "rutinas", "fin_rutinas",
    "principal", "fin_principal",
    "rutina", "fin_rutina", "fin",
    "sensor", "actuador", "zona",
    "tipo_numero", "tipo_logico", "tipo_texto",
    "nulo", "rango_tiempo","verdadero", "falso",
    "regar", "fertilizar", "ventilar",
    "calefaccionar", "iluminar","rociar_plaguicida",
    "activar", "desactivar", "ajustar_potencia",
    "leer", "promedio", "max", "min", "enviar_alerta",
    "ahora", "de", "a", "esperar", "duracion",
    "op_igual_igual", "op_diferente",
    "op_menor_igual", "op_mayor_igual",
    "op_menor", "op_mayor", "op_asignacion",
    "op_logico_not", "op_logico_and", "op_logico_or",
    "op_suma", "op_resta", "op_multiplicacion", "op_division",
    "paren_abre", "paren_cierra",
    "llave_abre", "llave_cierra",
    "corchete_abre", "corchete_cierra",
    "coma", "dos_puntos","lit_temp_celsius", "lit_temp_farenheit",
    "lit_humedad_relativa", "lit_humedad_suelo",
    "lit_volumen_ml", "lit_volumen_l",
    "lit_tiempo_s", "lit_tiempo_min", "lit_tiempo_hrs",
    "ilu_lux", "ilu_ppdf",
    "error_identificador_es_palabra_reservada",
    "lit_num", "identificador",
    "error", "error_cadena_no_cerrada", "error_caracter_invalido"
    ));
    
    private final Map<String, Simbolo> ids = new LinkedHashMap<>();
    
    // Verifica si la cadena coincide con una palabra reservada
    public boolean esReservada(String lexema) {
        return lexema != null && reservadas.contains(normaliza(lexema));
    }
    
 
    
    // Agrega palabras reservadas
    public void agregarReservadas(Collection<String> nuevas){
        if (nuevas == null) {
            return;
        }
        
        for (String s : nuevas){
            if (s != null) reservadas.add(normaliza(s));
        }
    }
   
       
    private static String normaliza(String s) {
        return s.toLowerCase(Locale.ROOT);
    }
    
    public static final class Simbolo {
        
    }
}
