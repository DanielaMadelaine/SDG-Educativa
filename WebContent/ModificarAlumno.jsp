<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Dominio.Alumnos"%>
<%@page import="Dominio.Provincias"%>
<%@page import="Dominio.Localidades"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  rel="icon"   href="img/favicon.png" type="image/png">
<link rel="stylesheet" href="css/ABML.css">
<script src="js/validaciones.js"></script>
 <style>
footer {
  font-size: 20px;
  margin-bottom: 20px;

}
</style>

<script type="text/javascript">
 history.forward();
</script>
</head>
<body id="myPage">

<!--Menu -->

<jsp:include page="MenuAdmin.jsp"></jsp:include>
	
<!------->
  
<!-- Modificar Alumno  -->

<div class="container">
		<div class="page-header">

			<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Modificar Alumnos</h1>
		</div>


		<div class="container-fluid" style="margin: 50px 0;">
			<div class="row">
				<div class="col-xs-12">
					<img src="img/user03.png" alt="user"
						class="img-responsive center-box" style="max-width: 110px;">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
					Bienvenido a la sección para actualizar los datos del alumno, para
					poder realizar una modificación eliga un campo: </div>
			</div>
		</div>

  <form class="form" action="servletAlumno" method="get">
		<div class="containerM">
		<div class="card-body">
		
	<% 
	Alumnos a = null;
	if(request.getAttribute("alumno")!=null)
	{
		a = (Alumnos) request.getAttribute("alumno");
	}

 %>
 
		<table>
			 	<%
					if (a != null) {
				%>
				
				<tr>
				<td>DNI:</td>
				<td> <input class="input-modi" type="text" value="<%=a.getDni()%>"  name="txtDNI" readonly="readonly"></input>   </td>
				</tr>
				<tr>
				<td>Legajo:</td>
				<td> <input class="input-modi" type="text" value="<%=a.getLegajo()%>" name="txtLegajo" readonly="readonly"></input> </td>
				</tr>
				<tr>
				<td>Nombre:</td>
				<td><input class="input-modi" type="text" value="<%=a.getNombre()%>" name="txtNombre" required></input>  </td>
				</tr>
				<tr>
				<td>Apellido:</td>
				<td> <input class="input-modi" type="text" value="<%=a.getApellido()%>"  name="txtApellido" required></input> </td>
				</tr>
				<tr>
				<td>Fecha Nacimiento:</td>
				<td> <input class="input-modi" type="date" name="txtfechaNac" value="<%=a.getFechaNacimiento()%>" width="276" required /> </td>
				</tr>
				<tr>
				<td>Direccion:</td>
				<td> <input class="input-modi"  type="text" value="<%=a.getDireccion()%>" name="txtDireccion" required></input>   </td>
				</tr>
				<tr>
				<td>Email:</td>
				<td> <input class="input-modi" type="text" value="<%=a.getEmail()%>"  name="txtEmail" required></input> </td>
				</tr>
				<tr>
				<td>Telefono:</td>
				<td> <input class="input-modi"  type="text" value="<%=a.getTelefono()%>"  name="txtTelefono" required></input> </td>
				</tr>
				
				
				
				<tr>
				<td>Provincia:</td>
				<td> <br/>
					<select class="form-control" name="provincia" id="provincia" data-toggle="tooltip"
								data-placement="top"
								title="Elige la provincia la que pertenece el alumno" 
								onchange="return showLocalidades();">
				  		<option value="p0">Seleccione Provincia </option>
				  		<% 
				  		ArrayList<Provincias> listaProv = null;
				  		
				  		if (request.getAttribute("listProv") !=null)
				  		{
				  			
				  			listaProv =(ArrayList<Provincias>) request.getAttribute("listProv");
				  		}
				  		if (listaProv != null)
							for (Provincias prov : listaProv) {
								if(prov.getId() == a.getProvincia().getId()){
				  		%>
				  		<option selected="selected" value="<%=prov.getId()%>"><%=prov.getDescripcion()%></option>
				  		
				  		<% 		} else {%>
				  		
				  		<option  value="<%=prov.getId()%>"><%=prov.getDescripcion()%></option>
								<% }} %>

				  	</select>
				</td>
				</tr>
					
				
				<tr>
				<td>Localidad:</td>
				<td>
				<br/><br/>
					<select  class="form-control" id="localidad" name="localidad">
				  		<option value="L0">Seleccione una localidad </option>
				  		
				  		<% 
				  		if (listaProv != null)
						for (Provincias prov : listaProv) {
					//int id = Integer.parseInt(request.getParameter("provincia"));
					ArrayList<Localidades> listaLoca= prov.getLocalidades();
			
							for (Localidades loca : listaLoca)
							{ if(loca.getId()== a.getLocalidad().getId()){
				  		%>
				  			<option selected="selected" id="<%=prov.getId()%>" value="<%=loca.getId()%>"><%=loca.getDescripcion()%></option>
<% 		} else {%>
						<option id="<%=prov.getId()%>" value="<%=loca.getId()%>"><%=loca.getDescripcion()%></option>



								<% } 
				  		}}
				  		%>
				  		
				  		
				  		
				  		
				  		
				  	</select>
				</td>
				</tr>
				
				<%
					}
				%>
				
			</table>
			
			<br/><br/><br/>
			<button type="button" onclick="goBack()" class="btn btn-round  btn-info"><i class="fas fa-chevron-left"></i>&nbsp;Atr&aacutes</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="btn btn-success" type="submit" value="Modificar" name="btnModificar"> 

			</div>
		</div>
	</form>
	
<br/><br/><br/>
<footer class="container-fluid text-center">
  <a href="#myPage" title="Arriba">
  
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p>© 2020 Laboratorio IV - UTN FRGP</p>
</footer>

</div>


</body>
</html>

  