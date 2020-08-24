package Dominio;


public class Alumnos extends Personas{

	private int legajo;
	private boolean estado;
	
	public Alumnos(String dni, String nombre, String apellido, String fechaNacimiento, String direccion,
		 Localidades localidad, Provincias provincia, String email, String telefono) {
		super(dni, nombre, apellido, fechaNacimiento, localidad, provincia, direccion, email, telefono);
	}
	
	public Alumnos(int legajo, String dni, String nombre, String apellido, String fechaNacimiento, String direccion,
			Localidades localidad, Provincias provincia, String email, String telefono,boolean estado) { 
		super(dni, nombre, apellido, fechaNacimiento, localidad, provincia, direccion, email, telefono, estado);
		setLegajo(legajo);
		setEstado(estado);
	}
	
	public Alumnos(int legajo, String nombre, String apellido) {
		super(nombre, apellido);
		setLegajo(legajo);
	}
		
	public int getLegajo() {
		return legajo;
	}

	public void setLegajo(int legajo) {
		this.legajo = legajo;
	}
	
	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	public String toString() {
		return getDni() +" "+ getNombre() +" "+ getApellido();
	}
	
	public String toStringNota() {
		return getNombre() +" "+ getApellido();
	}
}
