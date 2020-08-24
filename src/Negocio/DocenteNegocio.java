package Negocio;

import java.util.ArrayList;

import Dominio.Docentes;

public interface DocenteNegocio {
	
	public boolean insert(Docentes alumno);
	public boolean delete(int legajo);
	public boolean update(Docentes alumno);
	public ArrayList<Docentes> readAll();
	public ArrayList<Docentes> readAllUsuario();
	public Docentes obtenerDocentePorLegajo(int legajo);
	public int obtenerLegajo(String username);
}
