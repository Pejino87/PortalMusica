package com.backend;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class Cita {
	
	List<String> cita = new ArrayList<String>();
	List<String> autor = new ArrayList<String>();
	
	public Cita(){
		cita.add("El arte de la música es el que más cercano se halla de las lágrimas y los recuerdos");
		autor.add("Oscar Wilde");
		cita.add("El hombre a quien no conmueve el acorde de los sonidos armoniosos, es capaz de toda clase de traiciones, estratagemas y depravaciones");
		autor.add("William Shakespeare");
		cita.add(" El éxito en la música no es el aplauso sino el estremecimiento");
		autor.add("Freddy Sosa");
		cita.add("En la música es acaso donde el alma se acerca más al gran fin por el que lucha cuando se siente inspirada por el sentimiento poético: la creación de la belleza sobrenatural");
		autor.add("Edgar Allan Poe");
		cita.add("En verdad, si no fuera por la música, habría más razones para volverse loco");
		autor.add("Piotr Ilich Chaikovski");
		cita.add("La música es sinónimo de libertad, de tocar lo que quieras y como quieras, siempre que sea bueno y tenga pasión, que la música sea el alimento del amor");
		autor.add("Kurt Cobain");
	}
	
	public String getCita(int n){
		return cita.get(n);
	}
	
	public String getAutor(int n){
		return autor.get(n);
	}
	
	public int getRandom(){
		Random rnd = new Random();
		
		return rnd.nextInt(cita.size());
	}
	

}
