package com.tienda.musica;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.acciones.*;
import gft.curso.principalempresa.*;

/**
 * Servlet implementation class PerfilEmpresa
 */
public class PerfilEmpresa extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PerfilEmpresa() {
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
		HttpSession sesion = request.getSession();
		String cli = (String) sesion.getAttribute("rol");
		Integer idLog = (Integer) sesion.getAttribute("ident");
		
		ResultSet rs = null;
		String obNom = null,obNif = null,obFec1 = null,obEma = null,obDir=null,obFec = null;
		int obIde=0,obTel=0,obLog=0;
		if (!cli.equals("empresa")) {
			System.out.println("no es empresa");
			sesion.invalidate();
			response.sendRedirect("index.jsp");
		}
		
		String sSQL = "SELECT Id_Empresa,NOMBRE,RazonSocial,Fecha_Nacimiento,TELEFONO,DIRECCION,EMAIL,ID_LOGIN FROM EMPRESA";
		ConexOracle sentencia = new ConexOracle();
		try {
			rs = sentencia.consultaQuery(sSQL);
			while (rs.next()) {
				if (rs.getInt("ID_LOGIN")==idLog) {
					obIde = rs.getInt("ID_CLIENTE"); 
					obNom = rs.getString("NOMBRE"); 
					obNif = rs.getString("RazonSocial"); 
					obFec1 = rs.getString("Fecha_Nacimiento");
					obFec = obFec1.substring(0,10);
					obTel = rs.getInt("TELEFONO");
					obDir = rs.getString("DIRECCION");
					obEma = rs.getString("EMAIL"); 
					obLog = rs.getInt("ID_LOGIN"); 
				}	
			}
			
		} catch (SQLException | NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("obsIde",obIde);
		request.setAttribute("obsNom",obNom);
		request.setAttribute("obsNif",obNif);
		request.setAttribute("obsFec",obFec);
		request.setAttribute("obsTel",obTel);
		request.setAttribute("obsDir",obDir);
		request.setAttribute("obsEma",obEma);
		request.setAttribute("obsLog",obLog);
		
		request.getRequestDispatcher("perfilEmpresa.jsp").forward(request, response);
	}

}
