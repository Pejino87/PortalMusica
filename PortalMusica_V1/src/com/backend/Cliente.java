package com.backend;

public class Cliente {
	
	int id_cliente;
	String nombre,dni,email;
	
	public Cliente(int id_cliente, String nombre, String dni, String email) {
		super();
		this.id_cliente = id_cliente;
		this.nombre = nombre;
		this.dni = dni;
		this.email = email;
	}

}
