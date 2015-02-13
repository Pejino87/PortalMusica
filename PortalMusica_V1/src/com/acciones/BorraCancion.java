package com.acciones;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.backend.Cancion;
import com.backend.ListaModificacion;
import com.tienda.musica.ConexOracle;

/**
 * Servlet implementation class BorraCancion
 */
public class BorraCancion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorraCancion() {
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

			String id_cliente = Integer.toString((Integer)request.getSession(false).getAttribute("ident"));
			String id_cancion = request.getParameter("id_cancion");
			String id_lista = request.getParameter("id_lista");
			String nombre = request.getParameter("nombre");
			ConexOracle conexion = new ConexOracle();
			
			try {
				conexion.actualizarQuery("Delete from listas_cliente where id_lista="+id_lista+" AND id_cancion="+id_cancion+"");
				conexion.finalizarConexion();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			try {
				ListaModificacion.getInstancia().loadLista(id_lista, id_cliente, nombre);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			request.setAttribute("id_lista", id_lista);
			request.getRequestDispatcher("/ModificaLista.jsp").forward(
					request, response);
		}


	}

}
