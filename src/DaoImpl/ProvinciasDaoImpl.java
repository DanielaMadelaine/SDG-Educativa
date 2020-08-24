package DaoImpl;

import java.sql.ResultSet;
import java.util.ArrayList;

import Dominio.Localidades;
import Dominio.Provincias;
import dao.LocalidadDao;
import dao.ProvinciaDao;

public class ProvinciasDaoImpl implements ProvinciaDao {
	
	private Conexion cn;
	private static final String readAll = "SELECT * FROM PROVINCIAS";
	private static final String getOne = "SELECT * FROM PROVINCIAS WHERE ID=";

	@Override
	public ArrayList<Provincias> listadoProvincias() {
		ArrayList<Provincias> listado = new ArrayList<>();
		cn = new Conexion();
		ResultSet rs=null;
		String query = readAll;
		try {
			cn.Open();
			rs=cn.query(query);
			while(rs.next())
			{
				LocalidadDao localidadDao = new LocalidadDaoImpl();
				ArrayList<Localidades> localidades = localidadDao.listadoLocalidades(rs.getInt("id"));
				
				
				Provincias p = new Provincias(rs.getInt("id"),
						rs.getString("descripcion"),
						localidades);
				
				listado.add(p);
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
		
		System.out.println(listado.get(1).getLocalidades().get(1).getDescripcion());
		return listado;
	}

	@Override
	public Provincias getProvincia(int id) {
		Provincias p = null;
		cn = new Conexion();
		ResultSet rs=null;
		String query = getOne;
		try {
			cn.Open();
			rs=cn.query(query + id);
			rs.next();
			LocalidadDao locDao = new LocalidadDaoImpl();
			ArrayList<Localidades> localidades = locDao.listadoLocalidades(rs.getInt("id"));
			p = new Provincias(rs.getInt("id"),
					rs.getString("descripcion"), localidades);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return p;
	}

}
