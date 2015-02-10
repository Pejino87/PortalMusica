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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getParameter("isNueva").equals("true")){
			ConexOracle conexion = new ConexOracle();
			String id_lista = null;
			
			try {
				//conexion.actualizarQuery("Insert into listas_reproduccion values(increlistas.nextval,'Nueva')");
				//conexion.actualizarQuery("commit");
				ResultSet rs = conexion.consultaQuery("select id_lista from listas_reproduccion");
				
				while (rs.next()){
					id_lista = rs.getString(1);
				}
				
				System.out.println("ID de la lista que acabo de crear: " + id_lista);
				System.out.println("ID del cliente que estoy manejando: ");
				
				conexion.finalizarConexion();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}
	}

}
