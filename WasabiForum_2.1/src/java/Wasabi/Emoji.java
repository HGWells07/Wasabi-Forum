/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Wasabi;

import java.util.ArrayList;

/**
 *
 * @author Charly Anguiano
 */
public class Emoji {

    private ArrayList<String> emojis = new ArrayList<>();
    
    public void cargarEmojis(){
        emojis.add("em-pregunta,<i class='em em-question'></i>");
        emojis.add("em-ayy-lmao,<i class='em em-alien'></i>");
        emojis.add("em-admiracion,<i class='em em-heavy_exclamation_mark'></i>");
        emojis.add("em-troll,<i class='em em-trollface'></i>");
        emojis.add("em-libro,<i class='em em-closed_book'></i>");
        emojis.add("em-libro-abierto,<i class='em em-book'></i>");
    }

    public String remplazarEmojis(String publicacion) {
        String codigo;
        String emoji;
        int lenght;
        for (String e : emojis) {
            lenght = e.length();
            codigo = e.substring(0, e.indexOf(","));
            emoji = e.substring(e.indexOf(",")+1, lenght);
            publicacion = publicacion.replaceAll(codigo, emoji);
        }
        return publicacion;
    }

}
