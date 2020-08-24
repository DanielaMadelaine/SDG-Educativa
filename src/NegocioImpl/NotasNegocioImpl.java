package NegocioImpl;

import java.util.ArrayList;

import DaoImpl.NotasDaoImpl;
import Dominio.Notas;
import Negocio.NotasNegocio;
import dao.NotasDao;

public class NotasNegocioImpl implements NotasNegocio {

	private NotasDao notaDao = new NotasDaoImpl();
	
	@Override
	public ArrayList<Notas> readNotas(int id_curso) {
		return notaDao.readNotas(id_curso);
	}

	@Override
	public boolean insert(ArrayList<Notas> listaNotas) {
		return notaDao.insert(listaNotas);
	}

}
