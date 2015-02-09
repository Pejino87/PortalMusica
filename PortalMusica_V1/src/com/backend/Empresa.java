package com.backend;

public class Empresa {

	int id_empresa;
	String nombre,owner,direccion,telefono;
	
	public Empresa(int id_empresa, String nombre, String owner,
			String direccion, String telefono) {
		super();
		this.id_empresa = id_empresa;
		this.nombre = nombre;
		this.owner = owner;
		this.direccion = direccion;
		this.telefono = telefono;
	}

}
