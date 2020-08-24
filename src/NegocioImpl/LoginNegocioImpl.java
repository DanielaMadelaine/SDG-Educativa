package NegocioImpl;

import DaoImpl.LoginDaoImpl;
import Negocio.LoginNegocio;

import dao.LoginDao;

public class LoginNegocioImpl implements LoginNegocio {

	private LoginDao LogDao = new LoginDaoImpl();
	
	public int autenticacion(String user, String pass) {
		
		return LogDao.autenticacion(user, pass);
	}

}
