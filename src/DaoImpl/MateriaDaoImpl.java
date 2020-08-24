package DaoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;

import Dominio.Materias;
import dao.MateriaDao;

public class MateriaDaoImpl implements MateriaDao{
	
	private Conexion cn;
	private static final String readAll = "SELECT * FROM materias";
	
	@Override
	public ArrayList<Materias> readAll() {
		cn = new Conexion();
		cn.Open();
		ArrayList<Materias> listaMaterias = new ArrayList<>();
		ResultSet rs=null;
		String query = readAll;
		try
		 {
			rs=cn.query(query);
			while(rs.next())
			{
				Materias materia = new Materias(rs.getInt("id"),rs.getString("descripcion"));
				listaMaterias.add(materia);
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
		return listaMaterias;
	}

}
