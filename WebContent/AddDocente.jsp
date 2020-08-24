<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Dominio.Docentes"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Provincias"%>
<%@page import="Dominio.Localidades"%>
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
  
  <!--Alta docente -->

    <div class="container">
    
    <div class="page-header">

			<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Alta Docentes</h1>
		</div>
    
    <div class="container-fluid" style="margin: 50px 0;">
			<div class="row">
				<div class="col-xs-12">
					<img src="img/user02.png" alt="user"
						class="img-responsive center-box" style="max-width: 110px;">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
					Bienvenido a la sección para registrar nuevos docentes, para
					poder registrar un docente deberás completar todos los campos
					del siguiente formulario</div>
			</div>
		</div>
    
    
  
      <hr>
      <div class="row" style="margin-left:200px">
        <div class="form-group ">          
       		<form class="form" action="ServletDocente" method="get" style="width:500px">
       			<div  style="background:#ebebeb">
  					<div class="card-body">
				  		<input class="input" type="text" maxlength="10" placeholder="DNI" name="txtDNI" required></input>
   	  					<input class="input" type="text" placeholder="Nombre" name="txtNombre" required></input>
				  		<input class="input" type="text" placeholder="Apellido" name="txtApellido" required></input>
				  		<input class="input" type="date" name="txtfechaNac" width="276" required/>
				  		<input class="input" type="email" placeholder="Email" name="txtEmail" required></input>
				  		<input class="input" type="text" maxlength="10" placeholder="Telefono" name="txtTelefono" required></input>  		
				  		<input class="input" type="text" placeholder="Direccion" name="txtDireccion" required></input>
				  		<br/>
				  		
				  		<select class="form-control" name="provincia" id="provincia" data-toggle="tooltip"
								data-placement="top"
								title="Elige la provincia la que pertenece el alumno" 
								onchange="return showLocalidades();">
								
						<option value="prov0">Seleccione una provincia </option>
				  		<% 
				  		ArrayList<Provincias> listaProv = null;
				  		
				  		if (request.getAttribute("listProv") !=null)
				  		{
				  			
				  			listaProv =(ArrayList<Provincias>) request.getAttribute("listProv");
				  		}
				  		if (listaProv != null)
							for (Provincias prov : listaProv) {
				  		%>
				  		<option value="<%=prov.getId()%>"><%=prov.getDescripcion()%></option>
				  		<% } %>
				  		
				  		
				  		</select> 
				  		<br/>
				  		<br/>
			
						 <select class="form-control" id="localidad" name="localidad" >
				  		<option value="l0">Seleccione una localidad </option>
				  		
				  		<% 
				  		if (listaProv != null)
				  			
						for (Provincias prov : listaProv) {
					//int id = Integer.parseInt(request.getParameter("provincia"));
					ArrayList<Localidades> listaLoca= prov.getLocalidades();
			
							for (Localidades loca : listaLoca)
							{
				  		%>
						<option  id="<%=prov.getId()%>" value="<%=loca.getId()%>"><%=loca.getDescripcion()%></option>

								<% } 
				  		}
				  		%>
				  		</select>
				  		 <br/>  
				  		 
				  		 
				  		<input class="input" type="text" placeholder="Usuario Login" name="txtUsuario" required></input>  		
				  		<input class="input" type="text" placeholder="Password" name="txtPassword" required></input>
				  		 <br/>  <br/>
				  	  	<div>
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
       			</div>		

			</form>
			
    	</div>
      </div>
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
