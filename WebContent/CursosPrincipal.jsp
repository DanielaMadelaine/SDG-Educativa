<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Cursos"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link  rel="icon"   href="img/favicon.png" type="image/png" >

<script type="text/javascript" src="js/validaciones.js"></script>

 <style>
 
footer {
  font-size: 20px;
  margin-bottom: 20px;

}
</style>

</head>
<body id="myPage">

	<!--Menu -->
	<jsp:include page="MenuAdmin.jsp"></jsp:include>
	<!------->



	<!--Cursos Principal-->

	<div class="container1">
	<div class="row">
			<div class="col-lg-12">
			<div class="page-header">
				<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Cursos <small>Admistraci&oacuten</small></h1>
				</div>
					<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
				Esta sección es para registrar, editar, visualizar o eliminar cursos. Podrás buscar a los cursos por nombre, año o cuatrimestre. <br /> <br />
				<a class="btn btn-success" href="ServletCurso?cargar=1">Agregar Curso</a> <br>
				
		
		</div><br />
				<div class="table-responsive">





					<%
						ArrayList<Cursos> listaCursos = null;
					if (request.getAttribute("listadoC") != null) {
						listaCursos = (ArrayList<Cursos>) request.getAttribute("listadoC");
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
					<th class="text-center">Docente</th>
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
					<td><%=c.getDocente().toString()%></td>
						<td class="text-center">
						<a class="btn btn-warning" href="ServletCurso?idC=<%=c.getId()%>">Editar</a>
						<a class="btn btn-danger" onclick="ConfirmC(event)" href="ServletCurso?EliminarC=<%=c.getId()%>">Eliminar</a>
						<br/>
						<a class="btn btn-success" href="ServletCurso?par=1&cid=<%=c.getId()%>">Agregar Alumno</a>
						<a class="btn btn-danger" 
						href="ServletCurso?EliminarAC=1&cursoid=<%=c.getId()%>">Eliminar alumnos</a>
						</td>
				</tr>
				<%
					}
				%>
			</tbody>

		</table>



	</div>
	</div>
	</div>
	
	
	<%
	if (request.getAttribute("cursoOk") !=null) {
	System.out.println(request.getAttribute("cursoOk"));
	out.print("<script>alert('Curso agregado Correctamente');</script>");
}	if (request.getAttribute("modiOk") !=null) {
	System.out.println(request.getAttribute("modiOk"));
	out.print("<script>alert('Curso modificado Correctamente');</script>");
}
	
	
	 %>
	 
	 <br/>
<footer class="container-fluid text-center">
  <a href="#myPage" title="Arriba">
  
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p>© 2020 Laboratorio IV - UTN FRGP</p>
</footer>
	
	</div>



</body>
</html>

  