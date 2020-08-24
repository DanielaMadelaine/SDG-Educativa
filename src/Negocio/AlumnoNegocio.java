package Negocio;

import java.util.ArrayList;

import Dominio.Alumnos;

public interface AlumnoNegocio {
	
	public boolean insert(Alumnos alumno);
	public boolean delete(int legajo);
	public boolean update(Alumnos alumno);
	public ArrayList<Alumnos> readAll();
	public ArrayList<Alumnos> obetenerAlumnosPorCurso(int id_curso);
	public Alumnos obetenerAlumnoPorLegajo(int legajo);
}