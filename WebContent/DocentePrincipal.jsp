<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Docentes"%>
<%@page import="Dominio.Login"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="icon"   href="img/favicon.png" type="image/png" >
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
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
	<!-- Docente Principal  -->

	<div class="container1">
		<div class="page-header">
				<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Docentes<small>&nbsp;&nbsp;Admistraci&oacuten</small></h1>
				</div>
					
					<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
				Esta sección es para registrar, editar, visualizar o eliminar docentes. Podrás buscar a los docentes por nombre, apellido o legajo. <br /> <br />
				
		<a class="btn btn-success" href="ServletDocente?cargar=1">Agregar Nuevo</a> <br>
		</div>
			<br/>

<% 
	ArrayList<Docentes> listaDocentes = null;
	if(request.getAttribute("listadoD")!=null)
	{
		listaDocentes =(ArrayList<Docentes>) request.getAttribute("listadoD");
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
					<th class="text-center">Direccion</th>
					<th class="text-center">Provincia</th>
					<th class="text-center">Localidad</th>
					<th class="text-center">Email</th>
					<th class="text-center">Telefono</th>
					<th class="text-center">UserLogin</th>
					<th class="text-center">Password</th>
					<th class="text-center">Acciones</th>
				</tr>
			</thead>
			<tbody>
				<%
					if (listaDocentes != null)
					for (Docentes d : listaDocentes) {
				%>

				<tr>
					<td><%=d.getDni()%></td>
					<td><%=d.getLegajo()%></td>
					<td><%=d.getNombre()%></td>
					<td><%=d.getApellido()%></td>
					<td><%=d.getFechaNacimiento()%></td>
					<td><%=d.getDireccion()%></td>
					<td><%=d.getProvincia().getDescripcion()%></td>
					<td><%=d.getLocalidad().getDescripcion()%></td>
					<td><%=d.getEmail()%></td>
					<td><%=d.getTelefono()%></td>
					<td><%=d.getLogin().getUserlogin()%></td>
					<td><%=d.getLogin().getPassword()%></td>

					<td class="text-center">
					<a class="btn btn-warning" href="ServletDocente?legajoD=<%=d.getLegajo()%>">Editar</a> <br/>&nbsp;&nbsp;
					<a class="btn btn-danger" onclick="ConfirmD(event)" href="ServletDocente?EliminarD=<%=d.getLegajo()%>">Eliminar</a>
					</td>
				</tr>

				<%
					}
				%>
			</tbody>
		</table>
<%
if (request.getAttribute("insertOk") !=null) {
	System.out.println(request.getAttribute("agregarok"));
	out.print("<script>alert('Alumno agregado correctamente');</script>");
}
if (request.getAttribute("modiD") !=null) {
	System.out.println(request.getAttribute("alumnoModi"));
	out.print("<script>alert('Alumno modificado correctamente');</script>");
}

%>

<footer class="container-fluid text-center">
  <a href="#myPage" title="Arriba">
  <br/>
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p class="text-center"> © 2020 Laboratorio IV - UTN FRGP</p>
</footer>

</div>
	
	


</body>
</html>

    
