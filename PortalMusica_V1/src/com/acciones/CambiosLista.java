package com.acciones;

import java.io.IOException;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.backend.ListaReproduccion;
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

			response.sendRedirect("index.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession sesion = request.getSession();
		String miRol = (String)sesion.getAttribute("rol");

		if(miRol==null || miRol.equals("empresa")){
			response.sendRedirect("index.jsp");
		}
		else{
		ConexOracle conexion = new ConexOracle();
		String id_cliente = Integer.toString((Integer)request.getSession(false).getAttribute("ident"));
		
		if(request.getParameter("isEliminar").equals("true"))
		{
			try {
				conexion.actualizarQuery("delete from listas_cliente where id_lista = "+request.getParameter("id_lista"));
				conexion.actualizarQuery("delete from listas_reproduccion where id_lista = "+request.getParameter("id_lista"));
				conexion.actualizarQuery("commit");
				ListasUser.getInstancia().loadLista(id_cliente);
				conexion.finalizarConexion();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			ListaReproduccion.getInstancia().unloadLista();
			response.sendRedirect("PlantillaCliente.jsp");		
		}
		else
		{
			try {
				conexion.actualizarQuery("Update listas_reproduccion set nombre= '"+request.getParameter("titulo")+"' where id_lista = "+request.getParameter("id_lista"));
				conexion.actualizarQuery("commit");
				ListasUser.getInstancia().loadLista(id_cliente);
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
}
