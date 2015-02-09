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
		
		// crea la variable sesion para asignar sesi�n si es usuario v�lido.
		
		if (sesion == null) {
			HttpSession sesion1 = request.getSession();
			num = 1;
			sesion1.setAttribute("usu",nombre); 
			sesion1.setAttribute("count",num);
			System.out.println("pone valores setAttribute");
					
			//request.setAttribute("usu",true);
			//request.setAttribute("pwd",true);
			
			response.sendRedirect("principal.html");
			//request.getRequestDispatcher("MostrarCorreos").forward(request, response);
			return;
		}
		
		if (valClave == false) {
			System.out.println("POST false : "); 
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("prinTienda.jsp");
		}
	}

}
