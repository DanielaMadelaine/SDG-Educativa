package Dominio;

import java.util.ArrayList;

public class Cursos {

	private int id;
	private String descripcion;
	private int a�o;
	private Materias materia;
	private ArrayList<Alumnos> listaAlumnos;
	private Docentes docente;
	private String cuatrimestre;
	private int turno;
	private boolean estado;
	
	public Cursos(String desc, int a�o, Materias materia, Docentes docente, String cuatri, int turno) {
		setDescripcion(desc);
		setA�o(a�o);
		setMateria(materia);
		setDocente(docente);
		setCuatrimestre(cuatri);
		setTurno(turno);
		listaAlumnos = new ArrayList<>();
	}
	
	public Cursos(int id, String desc, int a�o, Materias materia, Docentes docente, String cuatri, int turno, boolean estado) {
		setId(id);
		setDescripcion(desc);
		setA�o(a�o);
		setMateria(materia);
		setDocente(docente);
		setCuatrimestre(cuatri);
		setTurno(turno);
		setEstado(estado);
		listaAlumnos = new ArrayList<>();
	}
	
	public Cursos(int id, String desc, int a�o, Materias materia, Docentes docente, String cuatri, int turno, boolean estado, ArrayList<Alumnos> listado) {
		setId(id);
		setDescripcion(desc);
		setA�o(a�o);
		setMateria(materia);
		setDocente(docente);
		setCuatrimestre(cuatri);
		setTurno(turno);
		setEstado(estado);
		listaAlumnos = listado;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public int getA�o() {
		return a�o;
	}
	public void setA�o(int a�o) {
		this.a�o = a�o;
	}
	public Materias getMateria() {
		return materia;
	}
	public void setMateria(Materias materia) {
		this.materia = materia;
	}
	public ArrayList<Alumnos> getListaAlumnos() {
		return listaAlumnos;
	}
	public void setListaAlumnos(ArrayList<Alumnos> listaAlumnos) {
		this.listaAlumnos = listaAlumnos;
	}
	public Docentes getDocente() {
		return docente;
	}
	public void setDocente(Docentes docente) {
		this.docente = docente;
	}
	public String getCuatrimestre() {
		return cuatrimestre;
	}
	public void setCuatrimestre(String cuatrimestre) {
		this.cuatrimestre = cuatrimestre;
	}
	public int getTurno() {
		return turno;
	}
	public void setTurno(int turno) {
		this.turno = turno;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
}
