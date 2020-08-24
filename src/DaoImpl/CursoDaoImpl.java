package DaoImpl;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dominio.Cursos;
import Dominio.Docentes;
import Dominio.Materias;
import dao.CursoDao;

public class CursoDaoImpl implements CursoDao{
	
	private Conexion cn;
	private static final String readAll = "SELECT c.id,c.descripcion,c.cuatrimestre,c.año,c.id_turno AS turno,c.estado," +
	"c.id_materia,m.descripcion as materia_d,c.legajo_docente,per.nombre,per.apellido FROM cursos as c " +
	"INNER JOIN docentes as d ON d.legajo=c.legajo_docente INNER JOIN personas as per ON per.dni=d.dni " +
	"INNER JOIN materias as m ON m.id=c.id_materia";
	
	@Override
	public boolean insert(Cursos curso) {
		boolean estado = false;
		cn = new Conexion();
		try
		 {
			CallableStatement SP_AgregarCurso = (CallableStatement) cn.Open().prepareCall("CALL SP_AgregarCurso(?,?,?,?,?,?)");
			SP_AgregarCurso.setString(1,curso.getDescripcion());
			SP_AgregarCurso.setString(2,curso.getCuatrimestre());
			SP_AgregarCurso.setInt(3,curso.getAño());
			SP_AgregarCurso.setInt(4,curso.getTurno());
			SP_AgregarCurso.setInt(5,curso.getMateria().getId());
			SP_AgregarCurso.setInt(6,curso.getDocente().getLegajo());
			
			estado = SP_AgregarCurso.execute();
			System.out.println("Estado devuelto: " + estado);
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

	@Override
	public boolean delete(int id) {
		boolean estado = false;
		cn = new Conexion();
		try
		{
			CallableStatement SP_EliminarCurso = (CallableStatement) cn.Open().prepareCall("CALL SP_EliminarCurso(?)");
			SP_EliminarCurso.setInt(1,id);
			
			estado = SP_EliminarCurso.execute();
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

	@Override
	public boolean update(Cursos curso) {
		boolean estado = false;
		cn = new Conexion();
		try
		 {
			CallableStatement SP_ModificarCurso = (CallableStatement) cn.Open().prepareCall("CALL SP_ModificarCurso(?,?,?,?,?,?,?)");
			SP_ModificarCurso.setInt(1,curso.getId());
			SP_ModificarCurso.setString(2,curso.getDescripcion());
			SP_ModificarCurso.setString(3,curso.getCuatrimestre());
			SP_ModificarCurso.setInt(4,curso.getAño());
			SP_ModificarCurso.setInt(5,curso.getTurno());
			SP_ModificarCurso.setInt(6,curso.getMateria().getId());
			SP_ModificarCurso.setInt(7,curso.getDocente().getLegajo());
			
			estado = SP_ModificarCurso.execute();
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

	@Override
	public ArrayList<Cursos> readAll() {
		cn = new Conexion();
		cn.Open();
		ArrayList<Cursos> listaCursos = new ArrayList<>();
		ResultSet rs=null;

		String query = readAll;
		System.out.println(query);
		try
		 {
			rs=cn.query(query);
			while(rs.next())
			{
				if(rs.getBoolean("estado")) {
					Materias materia = new Materias(rs.getInt("id_materia"),rs.getString("materia_d"));
					Docentes docente = new Docentes(rs.getInt("c.legajo_docente"),rs.getString("nombre"),rs.getString("apellido"));
					
					Cursos c = new Cursos(
					rs.getInt("id"),
					rs.getString("descripcion"),
					rs.getInt("año"),
					materia,
					docente,
					rs.getString("cuatrimestre"),
					rs.getInt("turno"),
					rs.getBoolean("estado")
					);
					
					listaCursos.add(c);
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
		return listaCursos;
	}

	@Override
	public ArrayList<Cursos> obetenerCursoPorDocente(int legajo) {
		cn = new Conexion();
		cn.Open();
		ArrayList<Cursos> listaCursos = new ArrayList<>();
		ResultSet rs=null;

		String query = readAll + " WHERE d.legajo=" + legajo;
		System.out.println(query);
		try
		 {
			rs=cn.query(query);
			while(rs.next())
			{
				if(rs.getBoolean("estado")) {
					Materias materia = new Materias(rs.getInt("id_materia"),rs.getString("materia_d"));
					Docentes docente = new Docentes(rs.getInt("c.legajo_docente"),rs.getString("nombre"),rs.getString("apellido"));
					
					Cursos c = new Cursos(
					rs.getInt("id"),
					rs.getString("descripcion"),
					rs.getInt("año"),
					materia,
					docente,
					rs.getString("cuatrimestre"),
					rs.getInt("turno"),
					rs.getBoolean("estado")
					);
					
					listaCursos.add(c);
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
		return listaCursos;
	}
	
	@Override
	public Cursos obetenerCursoPorId(int id) {
		cn = new Conexion();
		cn.Open();
		ResultSet rs=null;
		Cursos curso = null;
		String query = readAll + " WHERE c.id=" + id;
		System.out.println(query);
		try
		 {
			rs=cn.query(query);
			rs.next();
			Materias materia = new Materias(rs.getInt("id_materia"),rs.getString("materia_d"));
			Docentes docente = new Docentes(rs.getInt("c.legajo_docente"),rs.getString("nombre"),rs.getString("apellido"));
			
			curso = new Cursos(
			rs.getInt("id"),
			rs.getString("descripcion"),
			rs.getInt("año"),
			materia,
			docente,
			rs.getString("cuatrimestre"),
			rs.getInt("turno"),
			rs.getBoolean("estado")
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
		return curso;
	}
	
	public ArrayList<Cursos> obtenerCursosReporte(int año, String cuatri, int materia) {
		ArrayList<Cursos> listaCursos = new ArrayList<>();
		cn = new Conexion();
		cn.Open();
		ResultSet rs=null;
		String query = "SELECT * FROM CURSOS WHERE año="+año+" AND cuatrimestre='"+cuatri+"' AND id_materia="+materia;
		try
		 {
			rs=cn.query(query);
			while(rs.next()) {
				if(rs.getBoolean("estado")) {
					Cursos curso = new Cursos(
					rs.getInt("id"),
					rs.getString("descripcion"),
					rs.getInt("año"),
					null,
					null,
					rs.getString("cuatrimestre"),
					rs.getInt("id_Turno"),
					rs.getBoolean("estado")
					);
					listaCursos.add(curso);
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
		return listaCursos;
	}


	public boolean insertAlumnosCurso(int legajo, int idcurso) {
		
		boolean estado = false;
		cn = new Conexion();
		try
		 {
			CallableStatement SP_AgregarAlumnoACurso = (CallableStatement) cn.Open().prepareCall("CALL SP_AgregarAlumnoACurso(?,?)");
			SP_AgregarAlumnoACurso.setInt(1,legajo);
			SP_AgregarAlumnoACurso.setInt(2,idcurso);

			estado = SP_AgregarAlumnoACurso.execute();
					
			System.out.println("Estado devuelto: " + estado);

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

	public boolean deleteAlumnoCurso(int alum) {
		boolean estado = false;
		cn = new Conexion();
		try
		{
			CallableStatement SP_EliminarAlumnoCurso = (CallableStatement) cn.Open().prepareCall("CALL SP_EliminarAlumnoCurso(?)");
		
			SP_EliminarAlumnoCurso.setInt(1,alum);
			
			estado = SP_EliminarAlumnoCurso.execute();
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
	
}
