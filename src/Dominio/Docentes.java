package Dominio;


public class Docentes extends Personas {

	private int legajo;
	private boolean estado;
	private Login login;
	
	public Docentes(int legajo, String dni, String nombre, String apellido, String fechaNacimiento, String direccion,
			Localidades localidad, Provincias provincia, String email, String telefono,boolean estado, Login login) { 
		super(dni, nombre, apellido, fechaNacimiento, localidad, provincia, direccion, email, telefono, estado);
		setLegajo(legajo);
		setEstado(estado);
		setLogin(login);
	}
	
	public Docentes(int legajo, String dni, String nombre, String apellido, String fechaNacimiento, String direccion,
			Localidades localidad, Provincias provincia, String email, String telefono,boolean estado) { 
		super(dni, nombre, apellido, fechaNacimiento, localidad, provincia, direccion, email, telefono, estado);
		setLegajo(legajo);
		setEstado(estado);
	}
	
	public Docentes(String dni, String nombre, String apellido, String fechaNacimiento, String direccion,
			 Localidades localidad, Provincias provincia, String email, String telefono, Login login) {
		super(dni, nombre, apellido, fechaNacimiento, localidad, provincia, direccion, email, telefono);
		setLegajo(legajo);
		setLogin(login);
	}
	
	public Docentes(int legajo, String nombre, String apellido) {
		super(nombre,apellido);
		setLegajo(legajo);
	}
	
	public Docentes(int legajo) {
		super("nombre","apellido");
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
	
	public Login getLogin() {
		return login;
	}

	public void setLogin(Login login) {
		this.login = login;
	}
	
	public String toString() {
		return this.getApellido() + ", " + this.getNombre();
	}
	
}
