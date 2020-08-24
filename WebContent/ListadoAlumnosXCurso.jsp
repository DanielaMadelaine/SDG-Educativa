
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Alumnos"%>

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
	<!--ALUMNOS PRINCIPAL  -->

	<div class="container1">
	
		<div class="row">
	
			<div class="form-group col-md-12">
			
		<div class="page-header">
				<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Alumnos <small>Admistraci&oacuten</small></h1>
				</div>
					
					<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
				Esta sección es para registrar, editar, visualizar o eliminar alumnos. Podrás buscar a los alumnos por nombre, apellido o legajo. <br /> <br />
				<a class="btn btn-success" href="servletAlumno?listarCursosDocente=<%=request.getAttribute("idCurso")%>">Agregar Nuevo</a>
				</div><br />
				<div class="table-responsive">
			

					<%
						ArrayList<Alumnos> listaAlumnos = null;
					if (request.getAttribute("listAlum") != null) {
						listaAlumnos = (ArrayList<Alumnos>) request.getAttribute("listAlum");
					}
					%>

					<table id="example" class="table table-striped table-bordered">
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
					<td  align="center"><%=a.getDireccion()%></td>
					<td  align="center"><%=a.getProvincia().getDescripcion()%></td>
					<td  align="center"><%=a.getLocalidad().getDescripcion()%></td>
					<td  align="center"><%=a.getEmail()%></td>
					<td  align="center"><%=a.getTelefono()%></td>
				</tr>

				<%}%>

						</tbody>
					</table>
				
				<button type="button" onclick="goBack()" class="btn btn-round  btn-success"><i class="fas fa-chevron-left"></i>&nbsp;Atr&aacutes</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				</div>
			</div>
			

		</div>
		
<footer class="container-fluid text-center">
  <a href="#myPage" title="Arriba">
  
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p>© 2020 Laboratorio IV - UTN FRGP</p>
</footer>

</div>


</body>
</html>