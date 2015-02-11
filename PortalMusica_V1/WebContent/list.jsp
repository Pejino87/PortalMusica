<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="com.tienda.musica.ConexOracle" %>

 <% 
	try{      
		 String s[]=null;

		ConexOracle st = new ConexOracle();
		ResultSet rs = st.consultaQuery("Select cantante c, titulo t from canciones");
		

	    	List<String> li = new ArrayList<String>();
	    
			while(rs.next()) 
 			{ 			    
 			    li.add(rs.getString(1) + " - " + rs.getString(2));
 			}  
			
			String[] str = new String[li.size()];			
			Iterator<String> it = li.iterator();
			
			int i = 0;
			while(it.hasNext())
			{
				String p = it.next();	
				str[i] = p;
				
				i++;
			}
		
			//jQuery related start		
				String query = (String)request.getParameter("q");
				
				int cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(str[j]+"\n");
						if(cnt>=5)
							break;
						cnt++;
					}
				}
			//jQuery related end	
		
			
 		
		rs.close();
		st.finalizarConexion();

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

//www.java4s.com
 %>