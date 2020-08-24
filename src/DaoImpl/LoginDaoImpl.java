package DaoImpl;



import java.sql.ResultSet;

import dao.LoginDao;


public class LoginDaoImpl implements LoginDao {
	
	private Conexion cn;
    ResultSet rs;
    int perfil;
    
	public int autenticacion(String user, String pass) {
		perfil=0;
		cn = new Conexion();
		cn.Open();
		String query = "SELECT ID_PERFIL FROM LOGIN where userlogin='"+user+"' and password ='"+ pass +"'";
		System.out.println(query);
		try {
			rs= cn.query(query);
			
			if(rs.next()) {
				perfil= rs.getInt("ID_PERFIL");
			}
		} 
				
		catch (Exception e) {
			System.err.println("error"+e);
		}
		finally {
			cn.close();
		}
		return perfil;
	}

}
