<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Dominio.Materias"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Cursos"%>
<%@page import="Dominio.Reportes"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link  rel="icon"   href="img/favicon.png" type="image/png" >
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
	
<!--------- -->

  <!-- REPORTES -->

	<div class="container">
	
		<div class="page-content">
		<div class="text-center">
		<img src="img/chart.png" alt="chart"
					class="img-responsive center-box" style="max-width: 100px;">
		</div>
		
		<br/>
			<h1 ><i class="fa fa-angle-right"></i>&nbsp;
			Sistema Educativo &nbsp;<small>Reportes y estadisticas</small> 
			</h1>
		</div>
	

	<div class="container-fluid" style="margin: 50px 0;">
		<div class="row">
			<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
				 Bienvenido al area de reportes, aqui puedes ver las 
				estadisticas de los alumnos.</div>
		</div>
	</div>
				
	<form class="form" action="ServletReporte" method="get" style="width: 800px">	
			<table>
				<tr>
					<td>
					<label for="desde">Desde:
						<select class="form-control" name="desde">
					  		<option value="1">2019 Primer cuatrimestre</option>
					  		<option value="2">2019 Segundo cuatrimestre</option>
					  		<option value="3">2020 Primer cuatrimestre</option>
							<option value="4">2020 Segundo cuatrimestre</option>
				  		</select>
					</label>
					</td>
				</tr>	
				<tr>
					<td>
					<label for="hasta">Hasta:
						<select class="form-control" name="hasta">
				  			<option value="1">2019 Primer cuatrimestre</option>
							<option value="2">2019 Segundo cuatrimestre</option>
							<option value="3">2020 Primer cuatrimestre</option>
							<option value="4">2020 Segundo cuatrimestre</option>
						</select>
					</label>
					</td>
				</tr>
				<tr>
					<td>
						<label for="materia">Materia:
						<select class="form-control" name="materia">
							<% 
					  		ArrayList<Materias> listMaterias = null;
					  		
					  		if (request.getAttribute("listMaterias") !=null)
					  			
					  			listMaterias =(ArrayList<Materias>) request.getAttribute("listMaterias");
					  		if (listMaterias != null)
								for (Materias materia : listMaterias) {
					  		%>
					  		<option value="<%=materia.getId()%>"><%=materia.getDescripcion()%></option>
					  		<% } %>
						</select>
					</label>
					</td>
				</tr>
			</table>
						
			<br/><br/>	  		
	 	<input class="btn btn-success" type="submit" value="Buscar" name="btnBuscar">
		
	</form>
	
		<br/><br/>
	
		<div class="page-header">
		<h3 class="text-center all-tittles">Porcentaje de aprobacion</h3>
				<div class="table-responsive">
					<table id="example" class="table table-hover text-center" style="width: 100%">
						<thead>
							<tr class="success">
								<th class="text-center">Curso</th>
								<th class="text-center">Anio</th>
								<th class="text-center">Cuatrimestre</th>
								<th class="text-center">Porcentaje aprobados</th>
								<th class="text-center">Porcentaje desaprobados</th>
							</tr>
						</thead>
						<tbody>
						<% 
				  		ArrayList<Cursos> listCursos = null;
						ArrayList<Reportes> listReportes = null;
				  		if (request.getAttribute("listCursos") !=null && request.getAttribute("listReportes") !=null)
				  			listCursos =(ArrayList<Cursos>) request.getAttribute("listCursos");
				  			listReportes =(ArrayList<Reportes>) request.getAttribute("listReportes");
				  		
				  		if (listCursos != null){
							int i = 0;
							for (Cursos curso : listCursos) {
				  		%>
							<tr>
								<td><%=curso.getDescripcion()%></td>
								<td><%=curso.getAño()%></td>
								<td><%=curso.getCuatrimestre()%></td>
								<td><%=listReportes.get(i).getPorcAprovados()%></td>
								<td><%=listReportes.get(i).getPorcDesaprobados()%></td>
							</tr>
							<% i++; } }%>
						</tbody>
					</table>
				</div>
     	</div>
     	
     	
     	
     	    <br/><br/>
     <footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
  
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p>© 2020 Laboratorio IV - UTN FRGP</p>
</footer>
     </div>
 
     
</body>
</html>

