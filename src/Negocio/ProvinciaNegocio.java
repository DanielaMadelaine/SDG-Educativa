package Negocio;

import java.util.ArrayList;

import Dominio.Provincias;

public interface ProvinciaNegocio {
	
	public ArrayList<Provincias> listadoProvincias();
	public Provincias getProvincia(int id);
}
