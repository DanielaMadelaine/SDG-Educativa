package Dominio;

public class Materias {
	
	public int id;
	public String descripcion;

	public Materias(int id) {
		setId(id);
	}
	
	public Materias(int id, String desc) {
		setId(id);
		setDescripcion(desc);
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getId() {
		return this.id;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getDescripcion() {
		return this.descripcion;
	}
	
}
