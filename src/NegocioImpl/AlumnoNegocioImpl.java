package NegocioImpl;

import java.util.ArrayList;

import DaoImpl.AlumnoDaoImpl;
import Dominio.Alumnos;
import Negocio.AlumnoNegocio;
import dao.AlumnoDao;

public class AlumnoNegocioImpl implements AlumnoNegocio{

private AlumnoDao alumDao = new AlumnoDaoImpl();
	
	public boolean insert(Alumnos alumno) {
		return alumDao.insert(alumno);
	}

	public boolean update(Alumnos alumno) {
		return alumDao.update(alumno);
	}

	public ArrayList<Alumnos> readAll() {
		return alumDao.readAll();
	}

	public boolean delete(int legajo) {
		return alumDao.delete(legajo);
	}

	public ArrayList<Alumnos> obetenerAlumnosPorCurso(int id_curso) {
		return alumDao.obetenerAlumnosPorCurso(id_curso);
	}

	@Override
	public Alumnos obetenerAlumnoPorLegajo(int legajo) {
		
		return alumDao.obetenerAlumnoPorLegajo(legajo);
	}


	
	
}
