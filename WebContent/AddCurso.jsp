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
	
<!--------- -->

  <!-- Alta Curso  -->
 <main class="page-content">
    <div class="container">

    <div class="page-header">

			<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Alta Cursos</h1>
	</div>
    
    <div class="container-fluid" style="margin: 50px 0;">
			<div class="row">
				<div class="col-xs-12">
					<img src="img/cursos.png" alt="user"
						class="img-responsive center-box" style="max-width: 110px;">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
					Bienvenido a la sección para registrar un nuevo curso, para
					poder registrar un curso deberás de llenar todos los campos
					del siguiente formulario</div>
			</div>
		</div>
		
		
      <hr>
      <div class="row" style="margin-left:300px">
        
        <div class="form-group ">          

       		<form class="form" action="ServletCurso" method="get" style="width: 500px">
       			<div class="card" style="background:#ebebeb">
  					<div class="card-body">
				  		
				  		<input class="input" type="text" placeholder="Descripcion" name="txtDescripcion" required></input>
				  		<br/>
		
  						<label for="materia">Materia:</label>
   	  					<select name="materia" class="form-control">
   	  					<option value="">Seleccione una materia</option>
				  		<% 
				  		ArrayList<Materias> listMaterias = null;
				  		
				  		if (request.getAttribute("listMaterias") !=null)
				  			
				  			listMaterias =(ArrayList<Materias>) request.getAttribute("listMaterias");
				  		if (listMaterias != null)
							for (Materias materia : listMaterias) {
				  		%>
				  		<option value="<%=materia.getId()%>"><%=materia.getDescripcion()%></option>
				  		<% } %>
				  		</select> <br/>
						
						
						<label for="cuatrimestre">Cuatrimestre:</label>
   	  					<select name="cuatrimestre" class="form-control">
   	  					<option value="cuatri">Seleccione un cuatrimestre</option>
				  		<option value="Primer Cuatrimestre">Primer Cuatrimestre</option>
				  		<option value="Segundo Cuatrimestre">Segundo Cuatrimestre </option>
				  		</select> <br/>


						<label for="turno">Turno:</label>
						<select name="turno" class="form-control">
						<option value="">Seleccione un turno</option>
				  		<option value="1">Mañana</option>
				  		<option value="2">Noche</option>
				  		</select> <br/>
				  		
				  		
						
				  		<input class="input" type="text" placeholder="Año" name="anio" required></input>
				 	    <br/>
				  		
				  		
						<label for="docente">Docente:</label>
				  		<select name="docente" class="form-control">
				  		<option value="">Seleccione un docente</option>
				  		<% 
				  		ArrayList<Docentes> listDocentes = null;
				  		if (request.getAttribute("listDocentes") !=null)
				  			listDocentes =(ArrayList<Docentes>) request.getAttribute("listDocentes");
				  		if (listDocentes != null)
							for (Docentes docente : listDocentes) {
				  		%>
				  		<option value="<%=docente.getLegajo()%>"><%=docente.toString()%></option>
				  		<% } %>
				  		</select> <br/>
					    <br/>

				  	<p class="text-center">
				  <button type="button" onclick="goBack()" class="btn btn-round  btn-success"><i class="fas fa-chevron-left"></i>&nbsp;Atr&aacutes</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="reset" class="btn btn-info"
							style="margin-right: 50px;">Limpiar</button>
						<input class="btn btn-success" type="submit" value="Aceptar" name="btnAgregar"> 
					</p>
				  		
			  		</div>
				</div>
       				  
			</form>
   		
    	</div>
      </div>
      <br/>
      <footer class="container-fluid text-center">
  <a href="#myPage" title="Arriba">
  
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p>© 2020 Laboratorio IV - UTN FRGP</p>
</footer>
    </div>
  </main>  
	


</body>
</html>
