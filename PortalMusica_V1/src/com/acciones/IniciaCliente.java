package com.acciones;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.backend.ListasUser;

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
		System.out.println("Que mierda esta pasando aqui");
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		boolean isCliente = request.getSession(false).getAttribute("rol").equals("cliente");
		
		System.out.println("Antes del if");
		
		if(isCliente){
			System.out.println("despues del if");
			String id_cliente = (String) request.getSession(false).getAttribute("ident");

					try {
						ListasUser.getInstancia().loadLista(id_cliente);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (NamingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
					System.out.println("Antes del redirect");
				response.sendRedirect("PlantillaCliente.jsp");				
		}
		else{
			response.sendRedirect("index.jsp");
		}
	}

}
