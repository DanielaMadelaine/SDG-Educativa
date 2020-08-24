package NegocioImpl;

import java.util.ArrayList;


import DaoImpl.ProvinciasDaoImpl;
import Dominio.Provincias;
import Negocio.ProvinciaNegocio;

import dao.ProvinciaDao;

public class ProvinciaNegocioImpl implements ProvinciaNegocio{
	
	
	private ProvinciaDao ProvDao= new ProvinciasDaoImpl();

	@Override
	public ArrayList<Provincias> listadoProvincias() {
		
		return ProvDao.listadoProvincias();
	}

	@Override
	public Provincias getProvincia(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
