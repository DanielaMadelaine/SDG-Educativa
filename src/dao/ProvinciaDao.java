package dao;

import java.util.ArrayList;

import Dominio.Provincias;

public interface ProvinciaDao {

	public ArrayList<Provincias> listadoProvincias();
	public Provincias getProvincia(int id);
//	public Provincias getProvincia(int id,String d);
	
}
