package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Dominio.Alumnos;
import Dominio.Localidades;
import Dominio.Provincias;
import Negocio.AlumnoNegocio;
import Negocio.ProvinciaNegocio;
import NegocioImpl.AlumnoNegocioImpl;
import NegocioImpl.ProvinciaNegocioImpl;

@WebServlet("/servletAlumno")

public class servletAlumno extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AlumnoNegocio alumnoNegocio = new AlumnoNegocioImpl();
	ProvinciaNegocio provNeg  = new ProvinciaNegocioImpl();

    public servletAlumno() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean respuesta = false;
		ArrayList<Alumnos> alumnos = new ArrayList<>();
		ArrayList<Provincias> provincias = new ArrayList<>();
		
		//LISTAR TODOS LOS ALUMNOS
		if(request.getParameter("Listar")!=null)
		{
			alumnos = alumnoNegocio.readAll();
	    	
	    	request.setAttribute("listadoA", alumnos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AlumnosPrincipal.jsp");
			dispatcher.forward(request, response);
		}

		//AGREGAR ALUMNO
		if(request.getParameter("btnAgregar")!=null)
		{
			Provincias prov = new Provincias(Integer.parseInt(request.getParameter("provincia")));
			Localidades localidad = new Localidades(Integer.parseInt(request.getParameter("localidad")));
			
			Alumnos a = new Alumnos(
			request.getParameter("txtDNI"),
			request.getParameter("txtNombre"),
			request.getParameter("txtApellido"),
			request.getParameter("txtfechaNac"),
			request.getParameter("txtDireccion"),
			localidad,
			prov,
			request.getParameter("txtEmail"),
			request.getParameter("txtTelefono")
			);
			
	    	respuesta = alumnoNegocio.insert(a);
			alumnos = alumnoNegocio.readAll();
	    	
	    	request.setAttribute("agregarok", respuesta);
	    	request.setAttribute("listadoA", alumnos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AlumnosPrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//MODIFICAR ALUMNO
		if(request.getParameter("legajoA")!=null)
		{ 
			int lega = Integer.parseInt(request.getParameter("legajoA").toString()) ;
			
			Alumnos alumno = alumnoNegocio.obetenerAlumnoPorLegajo(lega);
			
			provincias= provNeg.listadoProvincias();
			
			request.setAttribute("listProv", provincias);
	    	request.setAttribute("alumno", alumno);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarAlumno.jsp");
			dispatcher.forward(request, response);
		}


		if(request.getParameter("btnModificar")!=null)
		{
			Provincias prov = new Provincias(Integer.parseInt(request.getParameter("provincia")));
			System.out.println("Provincia" + request.getParameter("provincia"));
			Localidades localidad = new Localidades(Integer.parseInt(request.getParameter("localidad")));
			System.out.println("Localidad" + request.getParameter("localidad"));
			
			Alumnos a = new Alumnos(
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
			Boolean.parseBoolean(request.getParameter("estado"))
			);
			
			respuesta = alumnoNegocio.update(a);
			alumnos = alumnoNegocio.readAll();
	    	
	    	request.setAttribute("alumnoModi", respuesta);
	    	request.setAttribute("listadoA", alumnos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AlumnosPrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//ELIMINAR ALUMNO
		if(request.getParameter("EliminarA")!=null)
		{
			int eliminar = Integer.parseInt(request.getParameter("EliminarA").toString());
			System.out.println(eliminar);
			respuesta = alumnoNegocio.delete(eliminar);
			alumnos = alumnoNegocio.readAll();
	    	
	    	request.setAttribute("eliminado", respuesta);
	    	request.setAttribute("listadoA", alumnos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AlumnosPrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//LISTAR PROVINCIAS
		if (request.getParameter("cargar")!=null) {
			
		
		provincias= provNeg.listadoProvincias();
		
		request.setAttribute("listProv", provincias);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AddAlumnito.jsp");
		dispatcher.forward(request, response);
		
		}
		
		/*if (request.getParameter("cargarP")!=null) {
			
			
			provincias= provNeg.listadoProvincias();
			
			request.setAttribute("listProv", provincias);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarAlumno.jsp");
			dispatcher.forward(request, response);
			
			}*/
		
		
		

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);


	}

}
