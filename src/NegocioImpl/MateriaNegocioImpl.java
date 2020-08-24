package NegocioImpl;

import java.util.ArrayList;

import DaoImpl.MateriaDaoImpl;
import Dominio.Materias;
import Negocio.MateriaNegocio;
import dao.MateriaDao;

public class MateriaNegocioImpl implements MateriaNegocio{

	private MateriaDao matDao = new MateriaDaoImpl();
	
	@Override
	public ArrayList<Materias> readAll() {
		return matDao.readAll();
	}

}
