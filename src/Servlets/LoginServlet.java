package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Negocio.DocenteNegocio;
import Negocio.LoginNegocio;
import NegocioImpl.DocenteNegocioImpl;
import NegocioImpl.LoginNegocioImpl;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  LoginNegocio loginNegocio= new LoginNegocioImpl();
  DocenteNegocio negDoc = new DocenteNegocioImpl();
  
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**AlumnoDao alumDao = new AlumnoDaoImpl();
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		
		if(request.getParameter("btnIngresar")!=null)
		{
			String nombre=request.getParameter("txtUserLogin");
			String contra=request.getParameter("txtPass");
			
			int perfil=0;
			perfil=loginNegocio.autenticacion(nombre,contra );
			
			if(perfil !=0)
			{	

				switch (perfil) {


				case 1:

					sesion.setAttribute("user", nombre);
					sesion.setAttribute("perfil", "1");
					response.sendRedirect("inicioAdmin.jsp");
					break;


				case 2:
					int legajo = negDoc.obtenerLegajo(nombre);
					System.out.println(legajo);
					sesion.setAttribute("user", nombre);
					sesion.setAttribute("perfil", "2");
					sesion.setAttribute("legajo", legajo);
					response.sendRedirect("InicioDocente.jsp");
					break;

				default:
					request.setAttribute("fail","No hay acceso!");
					request.getRequestDispatcher("LogIn.jsp").forward(request, response);


				}

			} else {	
				
				request.setAttribute("fail","No hay acceso!");
				request.getRequestDispatcher("LogIn.jsp").forward(request, response);
				
				
			}
		}
		
	


	}

}
