package NegocioImpl;

import java.util.ArrayList;

import DaoImpl.DocenteDaoImpl;
import Dominio.Docentes;
import Negocio.DocenteNegocio;
import dao.DocenteDao;

public class DocenteNegocioImpl implements DocenteNegocio {
	
	private DocenteDao docenteDao = new DocenteDaoImpl();
	
	public boolean insert(Docentes docente) {
		return docenteDao.insert(docente);
	}
	
	public boolean delete(int legajo) {
		return docenteDao.delete(legajo);
	}
	
	public boolean update(Docentes docente) {
		return docenteDao.update(docente);
	}
	
	public ArrayList<Docentes> readAll() {
		return docenteDao.readAll();
	}
	
	public ArrayList<Docentes> readAllUsuario() {
		return docenteDao.readAllUsuario();
	}

	@Override
	public Docentes obtenerDocentePorLegajo(int legajo) {
		return docenteDao.obtenerDocentePorLegajo(legajo);
	}

	@Override
	public int obtenerLegajo(String username) {
		return docenteDao.obtenerLegajo(username);
	}
	
}
