package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Docentes;
import Dominio.Localidades;
import Dominio.Login;
import Dominio.Provincias;
import Negocio.DocenteNegocio;
import Negocio.ProvinciaNegocio;
import NegocioImpl.DocenteNegocioImpl;
import NegocioImpl.ProvinciaNegocioImpl;

@WebServlet("/ServletDocente")
public class ServletDocente extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DocenteNegocio docenteNegocio = new DocenteNegocioImpl();
	ProvinciaNegocio provNeg  = new ProvinciaNegocioImpl();
	
	public ServletDocente() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean respuesta = false;
		ArrayList<Docentes> docentes = new ArrayList<>();
		ArrayList<Provincias> provincias = new ArrayList<>();
		
		//LISTAR TODOS LOS DOCENTES
		if(request.getParameter("Listar")!=null)
		{
			docentes = docenteNegocio.readAllUsuario();
	    	
	    	request.setAttribute("listadoD", docentes);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/DocentePrincipal.jsp");
			dispatcher.forward(request, response);
		}

		//AGREGAR DOCENTE
		if(request.getParameter("btnAgregar")!=null)
		{
		Provincias prov = new Provincias(Integer.parseInt(request.getParameter("provincia")));
			Localidades localidad = new Localidades(Integer.parseInt(request.getParameter("localidad")),
					request.getParameter("desc_loc"));
			Login login = new Login(request.getParameter("txtUsuario"),request.getParameter("txtPassword"),2);
			
			Docentes d = new Docentes(
			request.getParameter("txtDNI"),
			request.getParameter("txtNombre"),
			request.getParameter("txtApellido"),
			request.getParameter("txtfechaNac"),
			request.getParameter("txtDireccion"),
			localidad,
			prov,
			request.getParameter("txtEmail"),
			request.getParameter("txtTelefono"),
			login
			);
			
	    	respuesta = docenteNegocio.insert(d);
	    	docentes = docenteNegocio.readAllUsuario();

	    	request.setAttribute("insertOk", respuesta);
	    	request.setAttribute("listadoD", docentes);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/DocentePrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//MODIFICAR DOCENTE
		if(request.getParameter("legajoD")!=null)
		{ 
			int lega = Integer.parseInt(request.getParameter("legajoD").toString()) ;
			Docentes docente = docenteNegocio.obtenerDocentePorLegajo(lega);
			provincias= provNeg.listadoProvincias();
			
			request.setAttribute("listProv", provincias);
	    	request.setAttribute("docente", docente);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarDocente.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnModificar")!=null)
		{
			Provincias prov = new Provincias(Integer.parseInt(request.getParameter("provincia")));
			Localidades localidad = new Localidades(Integer.parseInt(request.getParameter("localidad")));
			Login login = new Login(Integer.parseInt(request.getParameter("txtLoginId")),
					request.getParameter("txtUser"),request.getParameter("txtPassword"), 2);
			
			Docentes d = new Docentes(
			Integer.parseInt(request.getParameter("txtLegajo")),
			request.getParameter("txtDNI"),
			request.getParameter("txtNombre"),
			request.getParameter("txtApellido"),
			request.getParameter("txtfechaNac"),
			request.getParameter("txtDireccion"),
			localidad,
			prov,
			request.getParameter("txtEmail"),
			request.getParameter("txtTelefono"),
			true,
			login
			);
			
			respuesta = docenteNegocio.update(d);
			docentes = docenteNegocio.readAllUsuario();

	    	request.setAttribute("modiD", respuesta);
	    	request.setAttribute("listadoD", docentes);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/DocentePrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//ELIMINAR DOCENTE
		if(request.getParameter("EliminarD")!=null)
		{
			respuesta = docenteNegocio.delete(Integer.parseInt(request.getParameter("EliminarD")));
			docentes = docenteNegocio.readAllUsuario();

	    	request.setAttribute("estado", respuesta);
	    	request.setAttribute("listadoD", docentes);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/DocentePrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//LISTAR PROVINCIAS
		if (request.getParameter("cargar")!=null) {
		
		provincias= provNeg.listadoProvincias();
		
		request.setAttribute("listProv", provincias);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AddDocente.jsp");
		dispatcher.forward(request, response);
		
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
