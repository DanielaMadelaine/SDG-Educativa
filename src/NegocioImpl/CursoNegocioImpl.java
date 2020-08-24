package NegocioImpl;

import java.util.ArrayList;

import DaoImpl.CursoDaoImpl;
import Dominio.Cursos;
import Negocio.CursoNegocio;
import dao.CursoDao;

public class CursoNegocioImpl implements CursoNegocio {

	private CursoDao cursoDao = new CursoDaoImpl();
	
	@Override
	public boolean insert(Cursos curso) {
		return cursoDao.insert(curso);
	}

	@Override
	public boolean delete(int id) {
		return cursoDao.delete(id);
	}

	@Override
	public boolean update(Cursos curso) {
		return cursoDao.update(curso);
	}

	@Override
	public ArrayList<Cursos> readAll() {
		return cursoDao.readAll();
	}

	@Override
	public ArrayList<Cursos> obetenerCursoPorDocente(int legajo) {
		return cursoDao.obetenerCursoPorDocente(legajo);
	}

	@Override
	public Cursos obtenerCursoPorId(int id) {
		return cursoDao.obetenerCursoPorId(id);
	}

	@Override

	public ArrayList<Cursos> obtenerCursosReporte(int año, String cuatri, int materia) {
		return cursoDao.obtenerCursosReporte(año, cuatri, materia);
	}
	
	public boolean insertAlumnosCurso(int legajo, int idcurso) {
	
		return cursoDao.insertAlumnosCurso(legajo, idcurso);
	}

	@Override
	public boolean deleteAlumnoCurso(int alum) {
		
		return cursoDao.deleteAlumnoCurso(alum);
	}

}
