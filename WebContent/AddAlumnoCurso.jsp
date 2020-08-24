<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Alumnos"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="icon"   href="img/favicon.png" type="image/png" >
<link rel="stylesheet" href="css/ABML.css">
<script src="js/validaciones.js"></script>


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
  
  <!--Alta alumno -->
 <div class="container">
		
<div class="row">
		
		<div class="container-fluid" style="margin: 50px 0;">
			<div class="row">
				<div class="col-xs-12">
					<img src="img/cursos.png" alt="user"
						class="img-responsive center-box" style="max-width: 110px;">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
					<h1><i class="fa fa-angle-right"></i>Agregar Alumnos<small>&nbsp;Admistraci&oacuten</small></h1><br/>
					En esta sección podra seleccionar a un alumno para agregar al curso correspondiente.
					</div>
			</div>
		</div>
		
					<%
					
						ArrayList<Alumnos> listaAlumnos = null;
					if (request.getAttribute("listAlum") != null) {
						listaAlumnos = (ArrayList<Alumnos>) request.getAttribute("listAlum");
					}
					%>

		<table id="example" class="table table-striped table-bordered" style="width: 100%">
			<thead>
				<tr>
					<th class="text-center">DNI</th>
					<th class="text-center">Legajo</th>
					<th class="text-center">Nombre</th>
					<th class="text-center">Apellido</th>
					<th class="text-center">Fecha Nacimiento</th>
		<%--  		<th class="text-center">Direccion</th>
					<th class="text-center">Provincia</th>
					<th class="text-center">Localidad</th> --%>
					<th class="text-center">Email</th>
					<th class="text-center">Telefono</th>
					<th class="text-center">Acciones</th>

				</tr>
			</thead>
			<tbody>
			
			<%
					if (listaAlumnos != null)
					for (Alumnos a : listaAlumnos) {
				%>

				<tr >
					<td  align="center"><%=a.getDni()%></td>
					<td  align="center"><%=a.getLegajo()%></td>
					<td  align="center"><%=a.getNombre()%></td>
					<td  align="center"><%=a.getApellido()%></td>
					<td  align="center"><%=a.getFechaNacimiento()%></td>
				<%-- <td  align="center"><%=a.getDireccion()%></td>
					<td  align="center"><%=a.getProvincia().getDescripcion()%></td>
					<td  align="center"><%=a.getLocalidad().getDescripcion()%></td>--%>
					<td  align="center"><%=a.getEmail()%></td>
					<td  align="center"><%=a.getTelefono()%></td>
					<td class="text-center"><a class="btn btn-success" href="ServletCurso?cargarA=1&legA=<%=a.getLegajo()%>&curso=<%=request.getAttribute("idCurso")%>">Agregar Alumno</a></td>
			
				</tr>
				<%}%>
			
<%
if (request.getAttribute("agregarAlumnoOk") !=null) {
	System.out.println(request.getAttribute("agregarAlumnoOk"));
	out.print("<script>alert('Alumno agregado correctamente');</script>");
}


%>

			</tbody>
		</table>
	
			
		</div>
		<button type="button" onclick="goBack()" class="btn btn-round  btn-info"><i class="fas fa-chevron-left"></i>&nbsp;Atr&aacutes</button>
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