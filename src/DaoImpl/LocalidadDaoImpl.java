package DaoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;

import Dominio.Localidades;
import dao.LocalidadDao;

public class LocalidadDaoImpl implements LocalidadDao {

	private Conexion cn;
	private static final String readByProvincia = "SELECT * FROM LOCALIDADES WHERE ID_PROVINCIA=";
	
	@Override
	public ArrayList<Localidades> listadoLocalidades(int id_provincia) {
		ArrayList<Localidades> localidades = new ArrayList<>();
		cn = new Conexion();
		ResultSet rs=null;
		String query = readByProvincia + id_provincia;
		try {
			cn.Open();
			rs=cn.query(query);
			while(rs.next())
			{
				
				Localidades p = new Localidades(rs.getInt("id"),
						rs.getString("descripcion"));
				
				localidades.add(p);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return localidades;
	}

	

}
