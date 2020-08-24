<%@page import="Dominio.Cursos"%>
<%@page import="Dominio.Materias"%>
<%@page import="Dominio.Docentes"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="icon"   href="img/favicon.png" type="image/png" />
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
  
<!-- Modificar curso  -->
 <div class="container">
 <div class="page-header">

			<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Modificar Cursos</h1>
		</div>
		
		<div class="container-fluid" style="margin:50px 0;">
			<div class="row">
				<div class="col-xs-12">
					<img src="img/cursos.png" alt="user"
						class="img-responsive center-box" style="max-width: 110px;">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
					Bienvenido a la sección para actualizar los datos del curso, para
					poder realizar una modificación eliga un campo: </div>
			</div>
		</div>
 	<div class="row" style="margin-left:70px">
		
		
		
		
		
		<div class="containerM">
		<div class="card-body">
		<table>
		<tr>
				<% Cursos curso = (Cursos) request.getAttribute("curso"); %>
				
				<td><br/>ID CURSO:</td>
				<td> <input class="input-modi" type="text" value="<%=curso.getId()%>"  name="txtId" readonly="readonly"></input>   </td>
				</tr>
				<tr>
				<td>Descripción:</td>
				<td> 
		<input class="input-modi" type="text" value="<%=curso.getDescripcion()%>"  name="txtDescripcion"></input>
			 </td>
				</tr>
				
				<tr>
				
				<td><br/><br/>Materia:</td>
				
				<td><br/><br/><select name="materia" class="form-control">
   	  		
   	  				<% 
				  		ArrayList<Materias> listMaterias = null;
   	  				
				  		if (request.getAttribute("listMaterias") !=null)
				  			listMaterias =(ArrayList<Materias>) request.getAttribute("listMaterias");
				  		
				  		if (listMaterias != null)
							for (Materias materia : listMaterias) {
								if(materia.getId()== curso.getMateria().getId()) {
				  		%>
				  				<option selected="selected" value="<%=materia.getId()%>"><%=materia.getDescripcion()%></option>
				  		<% 		} else {%>
				  				<option value="<%=materia.getId()%>"><%=materia.getDescripcion()%></option>
				  		<% } } %>
				  		</select> </td>
				</tr>
				<tr>
				<td><br/><br/>Cuatrimestre: </td>
				
			<td>	
			<br/><br/><select name="cuatrimestre" class="form-control">
				  		<% 	
						if(curso.getCuatrimestre().equals("Primer Cuatrimestre")) {
						%>
				  			<option selected="selected" value="Primer Cuatrimestre">Primer Cuatrimestre</option>
				  			<option value="Segundo Cuatrimestre">Segundo Cuatrimestre </option>
				  		<% 
						}else {
				  		%>	
				  			<option value="Primer Cuatrimestre">Primer Cuatrimestre</option>
				  			<option selected="selected" value="Segundo Cuatrimestre">Segundo Cuatrimestre </option>
				  		<% 
							}
				  		%>	
				  		</select> </td>
				</tr>
				<tr>
				<td><br/><br/>Turno:</td>
				
		<td>		<br/><br/><select name="turno" class="form-control">
						<% 	
							if(curso.getTurno().equals("Noche")) {
						%>
				  			<option value="1">Mañana</option>
				  			<option selected="selected" value="2">Noche</option>
				  		<% 
						}else {
				  		%>	
				  			<option selected="selected" value="1">Mañana</option>
				  			<option value="2">Noche</option>
				  		<% 
							}
				  		%>	
				  		</select> </td>

				</tr>
				
				<tr>
				<td>Año:</td>
				<td> <input class="input-modi" type="text" name="anio" value="<%=curso.getAño()%>" required /> </td>
				</tr>
				
				
					<tr>
				<td><br/><br/>Docentes:</td>
				
			<td>	<br/><br/> <select name="docente" class="form-control">
				  		<% 
				  		ArrayList<Docentes> listDocentes = null;
				  		if (request.getAttribute("listDocentes") !=null)
				  			listDocentes =(ArrayList<Docentes>) request.getAttribute("listDocentes");
				  		
				  		if (listDocentes != null)
							for (Docentes docente : listDocentes) {
				  			if(docente.getLegajo()==curso.getDocente().getLegajo()) {
				  		%>
				  				<option selected="selected" value="<%=docente.getLegajo()%>"><%=docente.toString()%></option>
				  		<% 		} else {%>
				  		<option value="<%=docente.getLegajo()%>"><%=docente.toString()%></option>
				  		<% } }%>
				  		</select></td>
						</tr>
	
		
						</table>
			
			
	  
				</div>
		
				<br/>
				<br/><br/><br/>
			<button type="button" onclick="goBack()" class="btn btn-round  btn-info"><i class="fas fa-chevron-left"></i>&nbsp;Atr&aacutes</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-success" type="submit" value="Modificar" name="btnModificar"> 
			</div>
			
			
			
<footer class="container-fluid text-center">
<br/><br/><br/>
  <a href="#myPage" title="Arriba">
  <br/>
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p class="text-center"> © 2020 Laboratorio IV - UTN FRGP</p>
</footer>  
		</div>
	
 
		</div>	  
		
</body>
</html>

  