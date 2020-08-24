<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Dominio.Notas"%>
<%@page import="Dominio.Alumnos"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SDG Educativa</title>
<link  rel="icon"   href="img/favicon.png" type="image/png" >
<script src="js/validaciones.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
<main class="page-content">
    <div class="container">
    
    <div class="page-header">

			<h1 class="all-tittles"><i class="fa fa-angle-right"></i>&nbsp;Notas</h1>
		</div>


		<div class="container-fluid" style="margin: 50px 0;">
			<div class="row">
				<div class="col-xs-12">
					<img src="https://img.icons8.com/cute-clipart/128/000000/task.png" alt="user"
						class="img-responsive center-box" style="max-width: 256px;">
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="col-xs-12 col-sm-8 col-md-8 text-justify lead">
					Bienvenido a la sección para registrar las notas de los alumnos! </div>
			</div>
		</div>
    
    <%
		ArrayList<Notas> listaNotas = null;
		if (request.getAttribute("listadoNotas") != null) {
			listaNotas = (ArrayList<Notas>) request.getAttribute("listadoNotas");
		}
	%>
    
      <hr>
      <div class="row">
        <div class="form-group col-md-12">
        <form action="ServletNotas" method="get">
        	<table id="example" class="display" style="width:100%">
        <thead>
            <tr>
                <th>Alumno</th>
                <th>1er Parcial</th>
                <th>Recuperatorio 1</th>
                <th>2do Parcial</th>
                <th>Recuperatorio 2</th>
                <th>Estado</th>
            </tr>
        </thead>
        <tbody>
        		<%
					if (listaNotas != null)
					for (Notas n : listaNotas) {
				%>

            <tr>
                <td><input type="text" name="alumnoLegajo" value="<%= n.getAlumno().getLegajo()%>">
                	<input type="text" name="alumnoNombre" value="<%= n.getAlumno().toStringNota()%>"></td>
                <td><input type="number" name="nota1" value="<%= n.getNota1()%>"></td>
                <td><input type="number" name="rec1" value="<%= n.getRecuperatorio1()%>"></td>
                <td><input type="number" name="nota2" value="<%= n.getNota2()%>"></td>
                <td><input type="number" name="rec2" value="<%= n.getRecuperatorio2()%>"></td>
                <td>
                	
            	<input type="hidden" name="id_nota" value="<%= n.getId_nota()%>">
                	<select size="1" name="condicion">
                <%
					if (n.getCondicion()==1) {
				%>
                    	<option value="1" selected="selected">Regular</option>
                    	<option value="2">Libre</option>
                <%
					} else {
				%>
                    	<option value="1">Regular</option>
                    	<option value="2" selected="selected">Libre</option>
                    	
                   <% } %>
                	</select>
                	
            	<input type="hidden" name="id_curso" value="<%= n.getId_curso() %>">
                </td>
            </tr>
            
           	 <% }%>
        </tbody>
    </table>
    	
   		 <br/><br/>
    		<p class="text-center">
			<input class="btn btn-success" type="submit" name="btnGuardar" value="Guardar">
		</p>
		
    </form>	


			<button type="button" onclick="goBack()" class="btn btn-round  btn-success"><i class="fas fa-chevron-left"></i>&nbsp;Atr&aacutes</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
							<br/>	<br/>
<footer class="container-fluid text-center">
  <a href="#myPage" title="Arriba">
  
    <i class="fas fa-chevron-circle-up"></i>
  </a>
  <p>© 2020 Laboratorio IV - UTN FRGP</p>
</footer>
        </div>
        
           
      </div>
   </div>
   
   
</main>



</body>
</html>