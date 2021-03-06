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

import com.backend.ListaCanciones;
import com.backend.ListaModificacion;
import com.backend.ListasUser;
import com.tienda.musica.ConexOracle;

/**
 * Servlet implementation class ModificaLista
 */
public class ModificaLista extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModificaLista() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
			response.sendRedirect("index.jsp");

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession sesion = request.getSession();
		String miRol = (String)sesion.getAttribute("rol");

		if(miRol==null || miRol.equals("empresa")){
			response.sendRedirect("index.jsp");
		}
		else{
		if (request.getParameter("isNueva").equals("true")) {
			ConexOracle conexion = new ConexOracle();
			String id_lista = null;
			String id_cliente = Integer.toString((Integer)request.getSession(false).getAttribute("ident"));
			String nuevoNombre = "Nueva";

			try {
				conexion.actualizarQuery("Insert into listas_reproduccion values(INCRELISTREPRO.nextval,'"
						+ nuevoNombre + "')");
				conexion.actualizarQuery("commit");

				ResultSet rs = conexion
						.consultaQuery("select id_lista from listas_reproduccion");

				while (rs.next()) {
					id_lista = rs.getString(1);
				}

				conexion.actualizarQuery("Insert into listas_cliente"
						+ " values (" + id_cliente + "," + id_lista
						+ ",0,sysdate)");
				conexion.actualizarQuery("commit");
				conexion.finalizarConexion();

				
				ListaCanciones l = new ListaCanciones(
						Integer.parseInt(id_lista), nuevoNombre);
				ListasUser.getInstancia().getLista().add(l);

				ListaModificacion.getInstancia().loadLista(id_lista,id_cliente,nuevoNombre);
				request.setAttribute("id_lista", id_lista);
				request.getRequestDispatcher("/ModificaLista.jsp").forward(request, response);

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

		} else{
			try {
				String id_cliente = Integer.toString((Integer)request.getSession(false).getAttribute("ident"));
				ListaModificacion.getInstancia().loadLista(request.getParameter("id_lista"),id_cliente,request.getParameter("nombre"));
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
			request.setAttribute("id_lista", request.getParameter("id_lista"));
			request.getRequestDispatcher("/ModificaLista.jsp").forward(request, response);
		}
	}
	}
}
