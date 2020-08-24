package DaoImpl;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dominio.Alumnos;
import Dominio.Notas;
import dao.NotasDao;

public class NotasDaoImpl implements NotasDao {

	private Conexion cn;
	private static final String readNotas = "SELECT n.id, n.nota1, n.recuperatorio1, n.nota2, n.recuperatorio2, n.id_Condicion," + 
			"axc.id_Curso, axc.legajo_Alumno, axc.estado, p.nombre, p.apellido FROM ALUMNOXCURSO AS axc " + 
			"INNER JOIN ALUMNOS AS a ON a.legajo = axc.legajo_Alumno INNER JOIN PERSONAS AS p ON p.dni = a.dni " + 
			"INNER JOIN NOTAS AS n ON n.id = axc.id_nota";
	
	@Override
	public ArrayList<Notas> readNotas(int id_curso) {
		ArrayList<Notas> listaNotas = new ArrayList<>();
		cn = new Conexion();
		try
		 {
			cn.Open();
			ResultSet rs=null;
			String query = readNotas + " WHERE id_Curso = " + id_curso;
			System.out.println("query: "+query);
			rs=cn.query(query);
			while(rs.next())
			{
				if(rs.getBoolean("estado")) {
					Alumnos a = new Alumnos(
							rs.getInt("legajo_Alumno"),
							rs.getString("nombre"),
							rs.getString("apellido")
							);
					
					Notas nota = new Notas();
					nota.setId_nota(rs.getInt("id"));
					nota.setAlumno(a);
					nota.setId_curso(rs.getInt("id_Curso"));
					nota.setNota1(rs.getInt("nota1"));
					nota.setRecuperatorio1(rs.getInt("recuperatorio1"));
					nota.setNota2(rs.getInt("nota2"));
					nota.setRecuperatorio2(rs.getInt("recuperatorio2"));
					nota.setCondicion(rs.getInt("id_Condicion"));
					
					listaNotas.add(nota);
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
		return listaNotas;
	}

	@Override
	public boolean insert(ArrayList<Notas> listaNotas) {
		boolean respuesta = false;
		try {
			for(Notas nota : listaNotas) {
				CallableStatement SP_CargarNotas = (CallableStatement) cn.Open().prepareCall("CALL SP_CargarNotas(?,?,?,?,?,?)");
				SP_CargarNotas.setInt(1,nota.getId_nota());
				System.out.println(nota.getId_nota());
				SP_CargarNotas.setInt(2,nota.getNota1());
				System.out.println(nota.getNota1());
				SP_CargarNotas.setInt(3,nota.getRecuperatorio1());
				System.out.println(nota.getRecuperatorio1());
				SP_CargarNotas.setInt(4,nota.getNota2());
				System.out.println(nota.getNota2());
				SP_CargarNotas.setInt(5,nota.getRecuperatorio2());
				System.out.println(nota.getRecuperatorio2());
				SP_CargarNotas.setInt(6,nota.getCondicion());
				System.out.println(nota.getCondicion());
				respuesta = SP_CargarNotas.execute();
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
		return respuesta;
	}

}
