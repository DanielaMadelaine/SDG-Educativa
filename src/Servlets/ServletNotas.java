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
import Dominio.Notas;
import Negocio.NotasNegocio;
import NegocioImpl.NotasNegocioImpl;


@WebServlet("/ServletNotas")
public class ServletNotas extends HttpServlet  {
	private static final long serialVersionUID = 1L;

	private NotasNegocio notaNeg = new NotasNegocioImpl();
	
	public ServletNotas() {
        super();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("idC") !=null) {
			ArrayList<Notas> listadoNotas = notaNeg.readNotas(Integer.parseInt(request.getParameter("idC").toString()));
			
			request.setAttribute("listadoNotas", listadoNotas);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/notas.jsp");
			dispatcher.forward(request, response);
		}
		
		if(request.getParameter("btnGuardar") !=null) {
			boolean respuesta = false;
			ArrayList<Notas> listaNotas = new ArrayList<>();
			String[] ListadoNotas1 = request.getParameterValues("nota1");
			String[] ListadoNotas2 = request.getParameterValues("nota2");
			String[] ListadoRec1 = request.getParameterValues("rec1");
			String[] ListadoRec2 = request.getParameterValues("rec2");
			String[] ListadoLegajos = request.getParameterValues("alumnoLegajo");
			String[] ListadoCondiones = request.getParameterValues("condicion");
			String[] ListadoIdNotas = request.getParameterValues("id_nota");
			
			for (int i = 0; i < ListadoNotas1.length; i++) {
				
				Alumnos alumno = new Alumnos(Integer.parseInt(ListadoLegajos[i]),"nombre","apellido");
				
				Notas nota = new Notas();
				nota.setId_nota(Integer.parseInt(ListadoIdNotas[i]));
				nota.setNota1(Integer.parseInt(ListadoNotas1[i]));
				System.out.println(ListadoNotas1[i]);
				nota.setNota2(Integer.parseInt(ListadoNotas2[i]));
				System.out.println(ListadoNotas2[i]);
				nota.setRecuperatorio1(Integer.parseInt(ListadoRec1[i]));
				System.out.println(ListadoRec1[i]);
				nota.setRecuperatorio2(Integer.parseInt(ListadoRec2[i]));
				System.out.println(ListadoRec2[i]);
				nota.setAlumno(alumno);
				System.out.println(ListadoLegajos[i] + " " + alumno);
				nota.setCondicion(Integer.parseInt(ListadoCondiones[i]));
				System.out.println(ListadoCondiones[i]);
				
				listaNotas.add(nota);
			}
			
			respuesta = notaNeg.insert(listaNotas);
			ArrayList<Notas> listadoNotas = notaNeg.readNotas(Integer.parseInt(request.getParameter("id_curso").toString()));
			
			request.setAttribute("listadoNotas", listadoNotas);
			request.setAttribute("respuesta", respuesta);
	    	RequestDispatcher dispatcher = request.getRequestDispatcher("/notas.jsp");
			dispatcher.forward(request, response);
		}
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
