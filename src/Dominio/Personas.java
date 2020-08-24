package Dominio;


public class Personas {
	
	private String dni;
	private String nombre;
	private String apellido;
	private String fechaNacimiento;
	private String direccion;
	private Localidades localidad;
	private Provincias provincia;
	private String email;
	private String telefono;
	private boolean estado;	
	
	public Personas(String dni, String nombre, String apellido, String fechaNacimiento, Localidades localidad, 
					Provincias provincia, String direccion,  String email, String telefono)
	{
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.fechaNacimiento = fechaNacimiento;
		this.direccion = direccion;
		this.localidad = localidad;
		this.provincia = provincia;
		this.email = email;
		this.telefono = telefono;
	}
	
	public Personas(String dni, String nombre, String apellido, String fechaNacimiento, Localidades localidad, 
			Provincias provincia, String direccion,  String email, String telefono, boolean estado)
	{
		this.dni = dni;
		this.nombre = nombre;
		this.apellido = apellido;
		this.fechaNacimiento = fechaNacimiento;
		this.direccion = direccion;
		this.localidad = localidad;
		this.provincia = provincia;
		this.email = email;
		this.telefono = telefono;
		setEstado(estado);
	}
	
	public Personas(String nombre, String apellido) {
		setNombre(nombre);
		setApellido(apellido);
	}
	
	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getFechaNacimiento() {
		return fechaNacimiento;
	}

	public void setFechaNacimiento(String fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public Localidades getLocalidad() {
		return localidad;
	}

	public void setLocalidad(Localidades localidad) {
		this.localidad = localidad;
	}

	public Provincias getProvincia() {
		return provincia;
	}

	public void setProvincia(Provincias provincia) {
		this.provincia = provincia;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

public boolean isEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}

}
