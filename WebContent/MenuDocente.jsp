<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>SDG Educativa</title>

<link  rel="icon"   href="img/favicon.png" type="image/png" >
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/css/bootstrap.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css">
<link rel="stylesheet" href="css/layoutAdmin.css">

<!-- DataTables -->
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">

</head>
<body>
<div class="page-wrapper chiller-theme toggled">
<%
		HttpSession sesion = request.getSession();
		String Usuario = "";
		

		if (sesion.getAttribute("user") != null && sesion != null) {
			Usuario = sesion.getAttribute("user").toString();
			}
		%>
  <nav id="sidebar" class="sidebar-wrapper">
    <div class="sidebar-content">
      <div class="sidebar-brand">
        <a href="InicioDocente.jsp">DOCENTE</a>
     
      </div>
      <div class="sidebar-header">
        <div class="user-pic">
          <img class="img-responsive img-rounded" src="https://img.icons8.com/bubbles/100/000000/system-administrator-female.png" alt="User picture">
        </div>
        <div class="user-info">
          <span class="user-name">
          <strong><%=Usuario%></strong>
          
          </span>
          <span class="user-role">Profesor</span>
          <span class="user-status">
            <i class="fa fa-circle"></i>
            <span>Online</span>
          </span>
        </div>
      </div>
      
      <div class="sidebar-menu">
        <ul>
          <li class="header-menu">
            <span>Men&uacute</span>
          </li>
          
            <li >
            <a href="InicioDocente.jsp">
            <i class="fas fa-home"></i>
 
              <span>Inicio</span>
            </a>
          </li>
          
          <%-- ACA PARECIERA QUE PASA ALGO  --%>
          
          <li>
            <a href="ServletCurso?listarCursosDocente=<%=sesion.getAttribute("legajo")%>">
            <i class="fas fa-chalkboard-teacher"></i>
            
              <span>Mis Cursos</span>
            </a>
          </li>
          
        </ul>
      </div>
      <!-- sidebar-menu  -->
    </div>
    <!-- sidebar-content  -->
    <div class="sidebar-footer">
      <a href="LogIn.jsp?cerrar=true">
        <i class="fa fa-power-off"></i>
      </a>
    </div>
  </nav>
  
<!-- Libreria JS -->

 
 
 <!-- datatable JS -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="js/layoutAdmin.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
		$(document).ready(
		function() {$('#example')
		.dataTable({
	"language" : {
	"url" : "https://cdn.datatables.net/plug-ins/1.10.20/i18n/Spanish.json"
		}
     	});
	    });
	</script>
 
</div>
</body>
</html>