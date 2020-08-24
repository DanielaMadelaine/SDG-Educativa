package Dominio;

public class Notas {
	private int id_nota;
	private int id_curso;
	private Alumnos alumno;
	private int nota1;
	private int recuperatorio1;
	private int nota2;
	private int recuperatorio2;
	private int condicion;
	
	public Notas() {
		
	}

	public int getId_curso() {
		return id_curso;
	}
	public void setId_curso(int id_curso) {
		this.id_curso = id_curso;
	}
	public int getNota1() {
		return nota1;
	}
	public void setNota1(int nota1) {
		this.nota1 = nota1;
	}
	public int getRecuperatorio1() {
		return recuperatorio1;
	}
	public void setRecuperatorio1(int recp1) {
		this.recuperatorio1 = recp1;
	}
	public int getNota2() {
		return nota2;
	}
	public void setNota2(int nota2) {
		this.nota2 = nota2;
	}
	public int getRecuperatorio2() {
		return recuperatorio2;
	}
	public void setRecuperatorio2(int recp2) {
		this.recuperatorio2 = recp2;
	}
	public int getCondicion() {
		return condicion;
	}
	public void setCondicion(int condicion) {
		this.condicion = condicion;
	}
	public Alumnos getAlumno() {
		return alumno;
	}
	public void setAlumno(Alumnos alumno) {
		this.alumno = alumno;
	}

	public int getId_nota() {
		return id_nota;
	}

	public void setId_nota(int id_nota) {
		this.id_nota = id_nota;
	}
}
