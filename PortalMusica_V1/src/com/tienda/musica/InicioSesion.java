package com.tienda.musica;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.backend.*;
import gft.curso.principalempresa.*;


/**
 * Servlet implementation class InicioSesion
 */
public class InicioSesion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InicioSesion() {
        super();
        // TODO Auto-generated constructor stub
    }
        
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession sesion = request.getSession(false);
		boolean valClave = false;
		String nombre = request.getParameter("usu");
		String password = request.getParameter("pwd");
		String tipoUsu = null;
		int identif = 0;
				
		// valida el usuario y contraseña y obtiene el idLogin y tipoUser.
		GestionUser autentificar = new GestionUser();
		try {
			valClave = autentificar.validaClave(nombre,password);
			tipoUsu = autentificar.validaRol(nombre,password);
			identif = autentificar.validaId(nombre,password);
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
					
		// crea la variable sesion para asignar sesión si es usuario válido.
		if (!sesion.isNew()) {
			HttpSession sesion1 = request.getSession();
			sesion1.setAttribute("ident",identif);		
			sesion1.setAttribute("usu",nombre); 
			sesion1.setAttribute("rol",tipoUsu);		
		}
		
		// si no coincide la password vá inicio de sesión sino pregunta si es cliente ó empresa para
		// ir a su página correspondiente.
			
		if (valClave == false) {
			response.sendRedirect("index.jsp");
		} else
		if (tipoUsu.equals("cliente")){
			request.getRequestDispatcher("IniciaCliente").forward(request, response);
			//request.getRequestDispatcher("PerfilCliente").forward(request, response);
		} else 
		if (tipoUsu.equals("empresa")){
			request.getRequestDispatcher("PrincipalEmpresa").forward(request, response);
			//request.getRequestDispatcher("PerfilEmpresa").forward(request, response);
		}	
	}

}
