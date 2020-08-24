package dao;

import java.util.ArrayList;

import Dominio.Localidades;

public interface LocalidadDao {

	public ArrayList<Localidades> listadoLocalidades(int id_provincia);
	
}
