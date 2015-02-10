package com.tienda.musica;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		String nombre = request.getParameter("usu");
		String password = request.getParameter("pwd");
		String tipoUsu = null;
		int num;
		System.out.println("entra en INICIOSESION EN POST");
		GestionUser correo = new GestionUser();
		boolean valClave = false;
		try {
			valClave = correo.validaClave(nombre,password);
			System.out.println("POST valClave" + valClave);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// valida si el tipo de usuario es cliente ó empresa.
		GestionUser correo1 = new GestionUser();
		try {
			tipoUsu = correo1.validaRol(nombre,password);
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// crea la variable sesion para asignar sesión si es usuario válido.
		if (sesion == null) {
			HttpSession sesion1 = request.getSession();
			num = 1;
			sesion1.setAttribute("usu",nombre); 
			sesion1.setAttribute("count",num);
			sesion1.setAttribute("rol",tipoUsu);		
			//request.getRequestDispatcher("MostrarCorreos").forward(request, response);
			return;
		}
		
		// si no coincide la password vá inicio de sesión sino pregunta si es cliente ó empresa para
		// ir a su página correspondiente.
			
		if (valClave == false) {
			response.sendRedirect("index.jsp");
		} else
		if (tipoUsu.equals("cliente")){
			request.getRequestDispatcher("IniciaCliente").forward(request, response);
		} else 
		if (tipoUsu.equals("empresa")){
			request.getRequestDispatcher("PrincipalEmpresa").forward(request, response);
		}	
	}

}
