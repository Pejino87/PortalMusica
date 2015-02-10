package com.acciones;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.backend.ListaCanciones;
import com.backend.ListasUser;
import com.tienda.musica.ConexOracle;

/**
 * Servlet implementation class IniciaCliente
 */
public class IniciaCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IniciaCliente() {
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
		String usuario;
		
		request.getSession().setAttribute("validado", "true");
		
		if(request.getSession().getAttribute("validado").equals("true")){
				usuario = "1";
				ListaCanciones l = null;

					try {
						ListasUser.getInstancia().loadLista("1");
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (NamingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				
				response.sendRedirect("PlantillaCliente.jsp");				
		}
		else{
			response.sendRedirect("index.jsp");
		}
	}

}
