<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Cursos"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="icon"   href="img/favicon.png" type="image/png">
<script src="js/validaciones.js"></script>
 <style>
footer {
  font-size: 20px;
  margin-bottom: 20px;

}
</style>
</head>
<body id="myPage">
  
  
<!-- Menu-->
	<jsp:include page="MenuDocente.jsp"></jsp:include>
<!--------- -->
  
<!-- Listado Curso del Docente -->
  <div class="container">   
  
  
  <div class="page-header">
				<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Mis Cursos</h1>
				</div>
					
					
  
       	<div class="container-fluid" style="margin: 50px 0;">
			<div class="row">
				<div class="col-xs-12">
					<img src="img/misCursos.png" alt="user"
						class="img-responsive center-box" style="max-width: 200px;">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
					En esta seccion podras visualizar tus cursos activos! Vas a poder buscarlos por año, cuatrimestre o materia.</div>
			</div>
		</div>
		<!------->      
      		
		<% 
		ArrayList<Cursos> listaCursos = null;
		if(request.getAttribute("listadoCursos")!=null)
		{
			listaCursos =(ArrayList<Cursos>) request.getAttribute("listadoCursos");
		}
 		%>
		
		<table id="example" class="table table-striped table-bordered" style="width: 100%">
			<thead>
				<tr>
					<th class="text-center">Descripcion</th>
					<th class="text-center">Materia</th>
					<th class="text-center">Cuatrimestre</th>
					<th class="text-center">Turno</th>
					<th class="text-center">Año</th>
					<th class="text-center">Acciones</th>
				</tr>
			</thead>
		
				<tbody>
				<%
					if (listaCursos != null)
					for (Cursos c : listaCursos) {
				%>
				<tr>
					<td><%=c.getDescripcion()%></td>
					<td><%=c.getMateria().getDescripcion()%></td>
					<td><%=c.getCuatrimestre()%></td>
					<td><% if(c.getTurno()==1){ %>
							Mañana
						<%}else%> Noche </td>
					<td><%=c.getAño()%></td>
						<td class="text-center">
						<a class="btn btn-success" href="ServletCurso?CargarLista=1&cid=<%=c.getId()%>">Ver Alumnos</a>
						<a class="btn btn-success" href="ServletNotas?idC=<%=c.getId()%>">Cargar notas</a>
						</td>
				</tr>

				<%
					}
				%>
			</tbody>
		</table>

    	</div>
    	
    	<br/>
    	<footer class="container-fluid text-center">
  <a href="#myPage" title="Arriba">
  
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p>© 2020 Laboratorio IV - UTN FRGP</p>
</footer>


</body>
</html>