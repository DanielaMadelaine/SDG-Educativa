package Dominio;


public class Login {

	private int id;
	private String userlogin;
	private String password;
	private int id_perfil;

	public Login(int id, String user, String pass, int perfil) {
		setId(id);
		setUserlogin(user);
		setPassword(pass);
		setPerfil(perfil);
	}
	
	public Login(String user, String pass, int perfil) {
		setUserlogin(user);
		setPassword(pass);
		setPerfil(perfil);
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUserlogin() {
		return userlogin;
	}
	
	public void setUserlogin(String userlogin) {
		this.userlogin = userlogin;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getPerfil() {
		return id_perfil;
	}
	
	public void setPerfil(int perfil) {
		this.id_perfil = perfil;
	}
	
}
