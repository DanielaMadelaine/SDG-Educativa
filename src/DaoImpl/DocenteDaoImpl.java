package DaoImpl;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dominio.Docentes;
import Dominio.Localidades;
import Dominio.Login;
import Dominio.Provincias;
import dao.DocenteDao;

public class DocenteDaoImpl implements DocenteDao {

	private Conexion cn;
	private static final String readAll = "SELECT P.DNI,P.ESTADO, P.NOMBRE, P.APELLIDO, P.TELEFONO, P.DIRECCION, " + 
			"P.EMAIL, P.FECHANACIMIENTO, P.ID_LOCALIDAD, L.DESCRIPCION AS DES_LOCALIDAD, P.ID_PROVINCIA, " + 
			"PROV.DESCRIPCION AS DESC_PROV, D.LEGAJO, LOG.userLogin, LOG.PASSWORD, LOG.ID AS IDLOGIN " + 
			"FROM PERSONAS AS P INNER JOIN DOCENTES AS D ON D.DNI = P.DNI " + 
			"INNER JOIN LOCALIDADES AS L ON L.ID = P.ID_LOCALIDAD INNER JOIN PROVINCIAS AS PROV ON " + 
			"PROV.ID = P.ID_PROVINCIA INNER JOIN LOGIN AS LOG ON LOG.ID=D.ID_LOGIN";
	
	public boolean insert(Docentes docente) {
		boolean estado = false;
		cn = new Conexion();
		try
		 {
			CallableStatement SP_AgregarDocente = (CallableStatement) cn.Open().prepareCall("CALL SP_AgregarDocente(?,?,?,?,?,?,?,?,?,?,?,?)");
			SP_AgregarDocente.setString(1,docente.getDni());
			SP_AgregarDocente.setString(2,docente.getNombre());
			SP_AgregarDocente.setString(3,docente.getApellido());
			SP_AgregarDocente.setString(4,docente.getFechaNacimiento());
			SP_AgregarDocente.setString(5,docente.getDireccion());
			SP_AgregarDocente.setInt(6,docente.getLocalidad().getId());
			SP_AgregarDocente.setInt(7,docente.getProvincia().getId());
			SP_AgregarDocente.setString(8,docente.getEmail());
			SP_AgregarDocente.setString(9,docente.getTelefono());
			SP_AgregarDocente.setString(10,docente.getLogin().getUserlogin());
			SP_AgregarDocente.setString(11,docente.getLogin().getPassword());
			SP_AgregarDocente.setInt(12,docente.getLogin().getPerfil());
			
			estado = SP_AgregarDocente.execute();
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		}
		return estado;
	}
	
	public boolean delete(int legajo) {
		boolean estado = false;
		cn = new Conexion();
		try
		{
			CallableStatement SP_EliminarDocente = (CallableStatement) cn.Open().prepareCall("CALL SP_EliminarDocente(?)");
			SP_EliminarDocente.setInt(1,legajo);
			
			estado = SP_EliminarDocente.execute();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		} 
		return estado;
	}
	
	public boolean update(Docentes docente) {
		boolean estado = false;
		cn = new Conexion();
		try
		 {
			CallableStatement SP_ModificarDocente = (CallableStatement) cn.Open().prepareCall("CALL SP_ModificarDocente(?,?,?,?,?,?,?,?,?,?,?,?)");
			SP_ModificarDocente.setString(1,docente.getDni());
			SP_ModificarDocente.setString(2,docente.getNombre());
			SP_ModificarDocente.setString(3,docente.getApellido());
			SP_ModificarDocente.setString(4,docente.getFechaNacimiento());
			SP_ModificarDocente.setString(5,docente.getDireccion());
			SP_ModificarDocente.setInt(6,docente.getProvincia().getId());
			SP_ModificarDocente.setInt(7,docente.getLocalidad().getId());
			SP_ModificarDocente.setString(8,docente.getEmail());
			SP_ModificarDocente.setString(9,docente.getTelefono());
			SP_ModificarDocente.setString(10,docente.getLogin().getUserlogin());
			SP_ModificarDocente.setString(11,docente.getLogin().getPassword());
			SP_ModificarDocente.setInt(12,docente.getLogin().getId());
			
			estado = SP_ModificarDocente.execute();
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		} 
		return estado;
	}


	
	public ArrayList<Docentes> readAll() {
		cn = new Conexion();
		cn.Open();
		ArrayList<Docentes> listaDocentes = new ArrayList<>();
		ResultSet rs=null;
		String query = readAll;
		System.out.println(query);
		try
		 {
			rs=cn.query(query);
			while(rs.next())
			{
				if(rs.getBoolean("estado")) {
					Provincias prov = new Provincias(rs.getInt("id_provincia"), rs.getString("DESC_PROV"));
					Localidades localidad = new Localidades(rs.getInt("id_localidad"), rs.getString("DES_LOCALIDAD"));
					
					Docentes d = new Docentes(
					rs.getInt("legajo"),
					rs.getString("dni"),
					rs.getString("nombre"),
					rs.getString("apellido"),
					rs.getDate("fechaNacimiento").toString(),
					rs.getString("direccion"),
					localidad,
					prov,
					rs.getString("email"),
					rs.getString("telefono"),
					rs.getBoolean("estado")
					);
					
					listaDocentes.add(d);
				}
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
		return listaDocentes;
	}
	
	public ArrayList<Docentes> readAllUsuario() {
		cn = new Conexion();
		cn.Open();
		ArrayList<Docentes> listaDocentes = new ArrayList<>();
		ResultSet rs=null;
		String query = readAll;
		System.out.println(query);
		try
		 {
			rs=cn.query(query);
			while(rs.next())
			{
				if(rs.getBoolean("estado")) {
					Provincias prov = new Provincias(rs.getInt("id_provincia"), rs.getString("DESC_PROV"));
					Localidades localidad = new Localidades(rs.getInt("id_localidad"), rs.getString("DES_LOCALIDAD"));
					Login login = new Login(rs.getInt("idlogin"),rs.getString("userlogin"),rs.getString("password"),2);
					
					Docentes d = new Docentes(
					rs.getInt("legajo"),
					rs.getString("dni"),
					rs.getString("nombre"),
					rs.getString("apellido"),
					rs.getDate("fechaNacimiento").toString(),
					rs.getString("direccion"),
					localidad,
					prov,
					rs.getString("email"),
					rs.getString("telefono"),
					rs.getBoolean("estado"),
					login
					);
					
					listaDocentes.add(d);
				}
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
		return listaDocentes;
	}
	
	public Docentes obtenerDocentePorLegajo(int legajo) {
		cn = new Conexion();
		cn.Open();
		ResultSet rs=null;
		String query = readAll + " WHERE d.legajo = " + legajo;
		System.out.println(query);
		Docentes d = null;
		try
		 {
			rs=cn.query(query);
			rs.next();
			Provincias prov = new Provincias(rs.getInt("id_provincia"), rs.getString("DESC_PROV"));
			Localidades localidad = new Localidades(rs.getInt("id_localidad"), rs.getString("DES_LOCALIDAD"));
			Login login = new Login(rs.getInt("idlogin"),rs.getString("userLogin"),rs.getString("password"),2);
			
			d = new Docentes(
			rs.getInt("legajo"),
			rs.getString("dni"),
			rs.getString("nombre"),
			rs.getString("apellido"),
			rs.getDate("fechaNacimiento").toString(),
			rs.getString("direccion"),
			localidad,
			prov,
			rs.getString("email"),
			rs.getString("telefono"),
			rs.getBoolean("estado"),
			login
			);
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		} 
		return d;
	}
	
	public int obtenerLegajo(String username) {
		cn = new Conexion();
		cn.Open();
		ResultSet rs=null;
		String query = "SELECT LEGAJO FROM DOCENTES INNER JOIN LOGIN ON LOGIN.ID = DOCENTES.ID_LOGIN WHERE LOGIN.USERLOGIN = '" + username + "'";
		System.out.println(query);
		int legajo = 0;
		try
		 {
			rs=cn.query(query);
			rs.next();
			legajo = Integer.parseInt(rs.getString("LEGAJO"));
		 }
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			cn.close();
		} 
		return legajo;
	}
}