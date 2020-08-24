package DaoImpl;

import dao.AlumnoDao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dominio.Alumnos;
import Dominio.Localidades;
import Dominio.Provincias;

public class AlumnoDaoImpl implements AlumnoDao{
	
	private Conexion cn;
	private static final String readAll = "SELECT P.DNI,P.ESTADO, P.NOMBRE, P.APELLIDO, P.TELEFONO, P.DIRECCION, " +
			"P.EMAIL, P.FECHANACIMIENTO, P.ID_LOCALIDAD, L.DESCRIPCION AS DES_LOCALIDAD, P.ID_PROVINCIA, " +
			"PROV.DESCRIPCION AS DESC_PROV, A.LEGAJO FROM PERSONAS AS P INNER JOIN ALUMNOS AS A ON A.DNI = " +
			"P.DNI INNER JOIN LOCALIDADES AS L ON L.ID = P.ID_LOCALIDAD INNER JOIN PROVINCIAS AS PROV ON " +
			"PROV.ID = P.ID_PROVINCIA";
	
	private static final String readA ="SELECT P.DNI,P.ESTADO, P.NOMBRE, P.APELLIDO, P.TELEFONO, P.DIRECCION,P.EMAIL, "+
	"P.FECHANACIMIENTO, P.ID_LOCALIDAD, L.DESCRIPCION AS DES_LOCALIDAD, P.ID_PROVINCIA, "+
	"PROV.DESCRIPCION AS DESC_PROV, A.LEGAJO, C.ID_CURSO FROM PERSONAS AS P INNER JOIN ALUMNOS AS A ON A.DNI = P.DNI "+
	"inner join alumnoxcurso as C ON A.LEGAJO = C.LEGAJO_ALUMNO INNER JOIN LOCALIDADES AS L ON L.ID = P.ID_LOCALIDAD INNER JOIN PROVINCIAS AS PROV ON PROV.ID = P.ID_PROVINCIA";
	

	public boolean insert(Alumnos alumno) {
		boolean estado = false;
		cn = new Conexion();
		try
		 {
			CallableStatement SP_AgregarAlumno = (CallableStatement) cn.Open().prepareCall("CALL SP_AgregarAlumno(?,?,?,?,?,?,?,?,?)");
			SP_AgregarAlumno.setString(1,alumno.getDni());
			SP_AgregarAlumno.setString(2,alumno.getNombre());
			SP_AgregarAlumno.setString(3,alumno.getApellido());
			SP_AgregarAlumno.setString(4,alumno.getFechaNacimiento());
			SP_AgregarAlumno.setString(5,alumno.getDireccion());
			SP_AgregarAlumno.setInt(6,alumno.getLocalidad().getId());
			SP_AgregarAlumno.setInt(7,alumno.getProvincia().getId());
			SP_AgregarAlumno.setString(8,alumno.getEmail());
			SP_AgregarAlumno.setString(9,alumno.getTelefono());
			
			estado = SP_AgregarAlumno.execute();
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
			CallableStatement SP_EliminarAlumno = (CallableStatement) cn.Open().prepareCall("CALL SP_EliminarAlumno(?)");
			SP_EliminarAlumno.setInt(1,legajo);
			
			estado = SP_EliminarAlumno.execute();
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
	
	public boolean update(Alumnos alumno) {
		boolean estado = false;
		cn = new Conexion();
		try
		 {
			CallableStatement SP_ModificarAlumno = (CallableStatement) cn.Open().prepareCall("CALL SP_ModificarAlumno(?,?,?,?,?,?,?,?,?)");
			SP_ModificarAlumno.setString(1,alumno.getDni());
			SP_ModificarAlumno.setString(2,alumno.getNombre());
			SP_ModificarAlumno.setString(3,alumno.getApellido());
			SP_ModificarAlumno.setString(4,alumno.getFechaNacimiento());
			SP_ModificarAlumno.setString(5,alumno.getDireccion());
			SP_ModificarAlumno.setInt(6,alumno.getLocalidad().getId());
			SP_ModificarAlumno.setInt(7,alumno.getProvincia().getId());
			SP_ModificarAlumno.setString(8,alumno.getEmail());
			SP_ModificarAlumno.setString(9,alumno.getTelefono());
			estado = SP_ModificarAlumno.execute();
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
	
	public ArrayList<Alumnos> readAll() {
		
		cn = new Conexion();
		cn.Open();
		ArrayList<Alumnos> listaAlumnos = new ArrayList<>();
		ResultSet rs=null;

		String query = readAll;
		System.out.println(query);
		try
		 {
			rs=cn.query(query);
			while(rs.next())
			{
				if(rs.getBoolean("estado")) {
					Provincias prov = new Provincias(rs.getInt("id_provincia"),rs.getString("DESC_PROV"));
					Localidades localidad = new Localidades(rs.getInt("id_localidad"),rs.getString("DES_LOCALIDAD"));
					
					Alumnos a = new Alumnos(
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
					
					listaAlumnos.add(a);
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
		return listaAlumnos;
	}
	
	public ArrayList<Alumnos> obetenerAlumnosPorCurso(int id_curso) {

		cn = new Conexion();
		cn.Open();
		ArrayList<Alumnos> listaAlumnos = new ArrayList<>();
		ResultSet rs=null;

		String query = readA + " WHERE C.ID_CURSO=" + id_curso + " and C.ESTADO=1";
		System.out.println(query);
		try
		 {
			rs=cn.query(query);
			while(rs.next())
			{
				if(rs.getBoolean("estado")) {
					Provincias prov = new Provincias(rs.getInt("id_provincia"),rs.getString("DESC_PROV"));
					Localidades localidad = new Localidades(rs.getInt("id_localidad"),rs.getString("DES_LOCALIDAD"));
					
					Alumnos a = new Alumnos(
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
				
					listaAlumnos.add(a);
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
		return listaAlumnos;
	}
	
	public Alumnos obetenerAlumnoPorLegajo(int legajo) {

		ResultSet rs=null;
		Alumnos alumno = null;
		String query = readAll + " WHERE legajo="+ legajo;
		System.out.println(query);
		try
		 {
			cn = new Conexion();
			cn.Open();
			rs=cn.query(query);
			rs.next();
				if(rs.getBoolean("estado")) {
					Provincias prov = new Provincias(rs.getInt("id_provincia"),rs.getString("DESC_PROV"));
					Localidades localidad = new Localidades(rs.getInt("id_localidad"),rs.getString("DES_LOCALIDAD"));
				
				alumno = new Alumnos(
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
		return alumno;
	}

}
