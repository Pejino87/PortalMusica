package com.acciones;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.backend.ListasUser;
import com.tienda.musica.ConexOracle;

/**
 * Servlet implementation class CambiosLista
 */
public class CambiosLista extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambiosLista() {
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
		
		ConexOracle conexion = new ConexOracle();
		
		if(request.getParameter("isEliminar").equals("true"))
		{
			try {
				System.out.println("Entra aqui");
				conexion.actualizarQuery("delete from listas_cliente where id_lista = "+request.getParameter("id_lista"));
				conexion.actualizarQuery("delete from listas_reproduccion where id_lista = "+request.getParameter("id_lista"));
				conexion.actualizarQuery("commit");
				ListasUser.getInstancia().loadLista("1");
				conexion.finalizarConexion();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("PlantillaCliente.jsp");		
		}
	}

}
