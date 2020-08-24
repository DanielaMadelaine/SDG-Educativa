package Servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dominio.Cursos;
import Dominio.Materias;
import Dominio.Notas;
import Dominio.Reportes;
import Negocio.CursoNegocio;
import Negocio.MateriaNegocio;
import Negocio.NotasNegocio;
import NegocioImpl.CursoNegocioImpl;
import NegocioImpl.MateriaNegocioImpl;
import NegocioImpl.NotasNegocioImpl;

@WebServlet("/ServletReporte")
public class ServletReporte extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private NotasNegocio notaNeg = new NotasNegocioImpl();
	private CursoNegocio cursoNeg = new CursoNegocioImpl();
	private MateriaNegocio matNeg = new MateriaNegocioImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("Reporte") !=null) {
			ArrayList<Materias> listadoMaterias = matNeg.readAll();
			
			request.setAttribute("listMaterias", listadoMaterias);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ReportePrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnBuscar") !=null) {
			ArrayList<Cursos> listadoCursos = new ArrayList<>();
			if(Integer.parseInt(request.getParameter("desde")) == 1) {
				listadoCursos.addAll(cursoNeg.obtenerCursosReporte(2019, "Primer cuatrimestre", Integer.parseInt(request.getParameter("materia"))));
			}
			if(Integer.parseInt(request.getParameter("desde")) <= 2 && Integer.parseInt(request.getParameter("hasta")) >= 2) {
				listadoCursos.addAll(cursoNeg.obtenerCursosReporte(2019, "Segundo cuatrimestre", Integer.parseInt(request.getParameter("materia"))));
			}
			if(Integer.parseInt(request.getParameter("desde")) <= 3 && Integer.parseInt(request.getParameter("hasta")) >= 3) {
				listadoCursos.addAll(cursoNeg.obtenerCursosReporte(2020, "Primer cuatrimestre", Integer.parseInt(request.getParameter("materia"))));
			}
			if(Integer.parseInt(request.getParameter("hasta")) == 4) {
				listadoCursos.addAll(cursoNeg.obtenerCursosReporte(2020, "Segundo cuatrimestre", Integer.parseInt(request.getParameter("materia"))));
			}
			
			ArrayList<Reportes> listadoReportes = new ArrayList<>();
			for(Cursos curso : listadoCursos) {
				ArrayList<Notas> listadoNotas = notaNeg.readNotas(curso.getId());
				int cantA=0;
				int cantD=0;
				for(int i=0; i<listadoNotas.size(); i++) {
					if(listadoNotas.get(i).getCondicion()==1) {
						cantA++;
					} else cantD++;
				}
				Reportes reporte = new Reportes();
				reporte.setId_curso(curso.getId());
				reporte.setPorcAprovados(cantA*100/listadoNotas.size());
				reporte.setPorcDesaprobados(cantD*100/listadoNotas.size());
				
				listadoReportes.add(reporte);
			}
			ArrayList<Materias> listadoMaterias = matNeg.readAll();
			
			request.setAttribute("listMaterias", listadoMaterias);
			request.setAttribute("listCursos", listadoCursos);
			request.setAttribute("listReportes", listadoReportes);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/ReportePrincipal.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
