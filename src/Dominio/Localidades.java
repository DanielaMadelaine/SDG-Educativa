package Dominio;

public class Localidades {
	
	private int id;
	private String descripcion;

	
	
	public Localidades(int id, String descripcion) {
		setId(id);
		setDescripcion(descripcion);
		
	}
	
	public Localidades(int id) {
		setId(id);
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

	
	
