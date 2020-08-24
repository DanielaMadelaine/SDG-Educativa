package dao;

import java.util.ArrayList;

import Dominio.Cursos;


public interface CursoDao {

	public boolean insert(Cursos curso);
	public boolean delete(int id);
	public boolean update(Cursos curso);
	public ArrayList<Cursos> readAll();
	public ArrayList<Cursos> obetenerCursoPorDocente(int legajo);
	Cursos obetenerCursoPorId(int id);
	public ArrayList<Cursos> obtenerCursosReporte(int año, String cuatri, int materia);
	public boolean insertAlumnosCurso(int legajo,int idcurso);
	public boolean deleteAlumnoCurso(int alum);
	
}
