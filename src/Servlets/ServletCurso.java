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
import Dominio.Cursos;
import Dominio.Docentes;
import Dominio.Materias;
import Negocio.AlumnoNegocio;
import Negocio.CursoNegocio;
import Negocio.DocenteNegocio;
import Negocio.MateriaNegocio;
import NegocioImpl.AlumnoNegocioImpl;
import NegocioImpl.CursoNegocioImpl;
import NegocioImpl.DocenteNegocioImpl;
import NegocioImpl.MateriaNegocioImpl;

@WebServlet("/ServletCurso")
public class ServletCurso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CursoNegocio cursoNegocio = new CursoNegocioImpl();
	private DocenteNegocio docNeg = new DocenteNegocioImpl();
	private MateriaNegocio matNeg = new MateriaNegocioImpl();
	private AlumnoNegocio alumnoNegocio = new AlumnoNegocioImpl();
	
	public ServletCurso() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean respuesta = false;
		ArrayList<Cursos> cursos = new ArrayList<>();
		ArrayList<Alumnos> alumnos = new ArrayList<>();
		
		//LISTAR TODOS LOS CURSOS
		if(request.getParameter("Listar")!=null)
		{
			cursos = cursoNegocio.readAll();
	    	
	    	request.setAttribute("listadoC", cursos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/CursosPrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("CargarLista")!=null)
		{
			int idCur=Integer.parseInt(request.getParameter("cid").toString());
			ArrayList<Alumnos> alumnosC = new ArrayList<>();
			
			alumnosC=alumnoNegocio.obetenerAlumnosPorCurso(idCur);
			alumnos = alumnoNegocio.readAll();
			
			ArrayList<Alumnos> listadoAgregar = new ArrayList<>();
			for (Alumnos alumno : alumnos) {
				boolean esta = false;
				for(Alumnos alumCurso : alumnosC) {
					if(alumCurso.getLegajo() == alumno.getLegajo()) {
						esta= true;
					}
				}
				if(!esta) listadoAgregar.add(alumno);
			}
			
			request.setAttribute("idCurso", idCur);
	    	request.setAttribute("listAlum", listadoAgregar);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ListadoAlumnosXCurso.jsp");
			dispatcher.forward(request, response);
		}
		
		//LISTAR TODOS LOS ALUMNOS A AGREGAR AL CURSO
		if(request.getParameter("par")!=null)
		{
			int idCur=Integer.parseInt(request.getParameter("cid").toString());
			ArrayList<Alumnos> alumnosC = new ArrayList<>();
			
			alumnosC=alumnoNegocio.obetenerAlumnosPorCurso(idCur);
			alumnos = alumnoNegocio.readAll();
			
			ArrayList<Alumnos> listadoAgregar = new ArrayList<>();
			for (Alumnos alumno : alumnos) {
				boolean esta = false;
				for(Alumnos alumCurso : alumnosC) {
					if(alumCurso.getLegajo() == alumno.getLegajo()) {
						esta= true;
					}
				}
				if(!esta) listadoAgregar.add(alumno);
			}
			
			request.setAttribute("idCurso", idCur);
	    	request.setAttribute("listAlum", listadoAgregar);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AddAlumnoCurso.jsp");
			dispatcher.forward(request, response);
		}

		// AGREGAR ALUMNO AL CURSO
		if(request.getParameter("cargarA")!=null)
		{
			int idCur = Integer.parseInt(request.getParameter("curso").toString());
			int legAlum = Integer.parseInt(request.getParameter("legA").toString());
			respuesta = cursoNegocio.insertAlumnosCurso(legAlum, idCur);
			
			ArrayList<Alumnos> alumnosC = new ArrayList<>();
			
			alumnosC=alumnoNegocio.obetenerAlumnosPorCurso(idCur);
			alumnos = alumnoNegocio.readAll();
			
			ArrayList<Alumnos> listadoAgregar = new ArrayList<>();
			for (Alumnos alumno : alumnos) {
				boolean esta = false;
				for(Alumnos alumCurso : alumnosC) {
					if(alumCurso.getLegajo() == alumno.getLegajo()) {
						esta= true;
					}
				}
				if(!esta) listadoAgregar.add(alumno);
			}
			
	    	request.setAttribute("listAlum", listadoAgregar);
			request.setAttribute("agregarAlumnoOk", respuesta);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AddAlumnoCurso.jsp");
			dispatcher.forward(request, response);
		}
		
		//LISTAR ALUMNOS X CURSO
		if(request.getParameter("EliminarAC")!=null)
		{
			int idCur=Integer.parseInt(request.getParameter("cursoid").toString());
			
			alumnos = alumnoNegocio.obetenerAlumnosPorCurso(idCur);
	    	request.setAttribute("listAlum", alumnos);
	    	request.setAttribute("idC", idCur);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/EliminarAlumnoCurso.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("Eliminar")!=null)
		{
			int idCur=Integer.parseInt(request.getParameter("cur").toString());
			int legA = Integer.parseInt(request.getParameter("lA").toString());
			System.out.println(legA);
			
			respuesta = cursoNegocio.deleteAlumnoCurso(legA);
			alumnos = alumnoNegocio.obetenerAlumnosPorCurso(Integer.parseInt(request.getParameter("cur")));
			
			
			request.setAttribute("listAlum", alumnos);
			request.setAttribute("deleteOk", respuesta);
			request.setAttribute("idC", idCur);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/EliminarAlumnoCurso.jsp");
			dispatcher.forward(request, response);
		}
					
		//LISTAR TODOS LOS CURSOS DE UN DOCENTE
		if(request.getParameter("listarCursosDocente")!=null)
		{
			cursos = cursoNegocio.obetenerCursoPorDocente(Integer.parseInt(request.getParameter("listarCursosDocente")));
	    	
	    	request.setAttribute("listadoCursos", cursos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ListaCursosDocente.jsp");
			dispatcher.forward(request, response);
		}

		//AGREGAR CURSO
		if(request.getParameter("btnAgregar")!=null)
		{
			Docentes docente = new Docentes(Integer.parseInt(request.getParameter("docente")));
			Materias materia = new Materias(Integer.parseInt(request.getParameter("materia")));
			Cursos c = new Cursos(
				request.getParameter("txtDescripcion"),
				Integer.parseInt(request.getParameter("anio")),
				materia,
				docente,
				request.getParameter("cuatrimestre"),
				Integer.parseInt(request.getParameter("turno"))
				);

	    	respuesta = cursoNegocio.insert(c);
	    	cursos = cursoNegocio.readAll();
	    	
	    	request.setAttribute("cursoOk", respuesta);
	    	request.setAttribute("listadoC", cursos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/CursosPrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//MODIFICAR CURSO
		if(request.getParameter("idC")!=null)
		{ 
			int id = Integer.parseInt(request.getParameter("idC").toString());
			System.out.println(id);
			Cursos curso = cursoNegocio.obtenerCursoPorId(id);
			ArrayList<Materias> materias = new ArrayList<>();
		     materias= matNeg.readAll();
			ArrayList<Docentes> docentes = new ArrayList<>();
			docentes= docNeg.readAll();
			
			request.setAttribute("listMaterias", materias);
			request.setAttribute("listDocentes", docentes);
	    	request.setAttribute("curso", curso);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ModificarCurso.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnModificar")!=null)
		{
			Docentes docente = new Docentes(Integer.parseInt(request.getParameter("docente")));
			Materias materia = new Materias(Integer.parseInt(request.getParameter("materia")));
			Cursos c = new Cursos(
				Integer.parseInt(request.getParameter("txtId")),
				request.getParameter("txtDescripcion"),
				Integer.parseInt(request.getParameter("anio")),
				materia,
				docente,
				request.getParameter("cuatrimestre"),
				Integer.parseInt(request.getParameter("turno")),
				true
				);
			
	    	respuesta = cursoNegocio.update(c);
	    	cursos = cursoNegocio.readAll();
	    	
	    	request.setAttribute("modiOk", respuesta);
	    	request.setAttribute("listadoC", cursos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/CursosPrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//ELIMINAR CURSO
		if(request.getParameter("EliminarC")!=null)
		{
			respuesta = cursoNegocio.delete(Integer.parseInt(request.getParameter("EliminarC")));
	    	cursos = cursoNegocio.readAll();
	    	
	    	request.setAttribute("estado", respuesta);
	    	request.setAttribute("listadoC", cursos);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/CursosPrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		//LISTAR DOCENTES Y MATERIAS
		if (request.getParameter("cargar")!=null) {
		ArrayList<Materias> materias = new ArrayList<>();
		materias= matNeg.readAll();
		
		ArrayList<Docentes> docentes = new ArrayList<>();
		docentes= docNeg.readAll();
		
		request.setAttribute("listMaterias", materias);
		request.setAttribute("listDocentes", docentes);
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/AddCurso.jsp");
		dispatcher.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
}
