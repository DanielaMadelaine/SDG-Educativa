<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>SDG Educativa</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
    <meta name="viewport" content="width-device-width,initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="sie-edge" />   
    <link  rel="icon"   href="img/favicon.png" type="image/png" >
    <link href="https://unpkg.com/ionicons@4.2.2/dist/css/ionicons.min.css" rel="stylesheet">   
    <link href="css/login.css" type="text/css" rel="stylesheet">
   
</head>
<body>
    <div class="container" id="container">
        <div class="form-container sign-in-container">
            <form action="LoginServlet" method="post">
                <div class="social-container">
                  <img src="https://preview.w3layouts.com/demos/flat_ui_web_forms/web/images/top-lock.png" alt=""/>
                </div>
                <h1>Log In</h1><br/>
                <span>Ingrese su nombre de usuario y password</span>


                <input type="text" placeholder="Usuario" name="txtUserLogin">
                <input type="password" placeholder="Password" name="txtPass">

                <br/>
                 <input class="button" type="submit" value="Ingresar" name="btnIngresar"> 
                

            </form>
        </div>
    </div>
     <%  
            HttpSession sesion = request.getSession();
            
                if(request.getAttribute("fail")!=null){
                    out.print("<script>alert('User incorrecto o pass invalida!');</script>   ");
                }
                
           	 if(request.getParameter("cerrar")!=null){
    			 sesion.invalidate();
    		response.sendRedirect("LogIn.jsp");
    		}
          

        %>
    
    <script src="js/login.js"></script>
    <script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>
</body>

</html>
