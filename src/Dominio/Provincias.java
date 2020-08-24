package Dominio;

import java.util.ArrayList;

public class Provincias {
	
	private int id;
	private String descripcion;
	private ArrayList<Localidades> localidades;
	
	
	public Provincias(int id,String descripcion) {
		setId(id);
		setDescripcion(descripcion);
	}
	
	public Provincias(int id) {
		setId(id);
	}
	
	public Provincias(int id, String descripcion, ArrayList<Localidades> localidades) {
		setId(id);
		setDescripcion(descripcion);
		setLocalidades(localidades);
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

	public void setLocalidades(ArrayList<Localidades> localidades) {
		this.localidades = localidades;
	}
	
	public ArrayList<Localidades> getLocalidades() {
		return this.localidades;
	}
}
