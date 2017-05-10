<%-- 
    Document   : registrarMateria
    Created on : May 7, 2017, 10:47:50 PM
    Author     : merlyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.*, java.util.*"%>
<!DOCTYPE html>
<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Wasabi Forum - Gestion de Area Basica </title>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

       <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
       <link rel="stylesheet" type="text/css" href="css/estilosGestion.css">
   </head>
   <body class="bodyProfes">

       <div class="col-md-12" style="padding-left:4em;padding-right:4em;">
         <h3 class="card">
           <div class="card-title">
              Registrar Materia
           </div>
        </h3>
        
           
           <form action="/Gestion/RegistrarMateria" method="GET">
            <div class="input-group">
                
              <span class="input-group-btn">
                  <input type="submit" name="button" class="btn btn-default" value="Nombre">
              </span>
              <input type="text" name="nombreMateria" value="" class="form-control">
              
            </div>
           </form>
        


       <div class="col-md-12">
         <strong>Seleccione un profesor que imparta esta materia</strong>
         
         <%
         
            Profesor profe = new Profesor();
            ArrayList<Profesor> profesores = profe.getProfesores();
            
            for (int i = 0; i < profesores.size(); i++) {
                    
                
         
         %>
         
            <div class="card academ-item">
            <div class="card-block">
              <blockquote class="card-blockquote academ" id="textocuadritoinstruccion">
                  <%= profesores.get(i).getNombre() %><input type="radio" name="same" value="">
              </blockquote>
            </div>
          </div>
         
         <%}%>
         
         
         
         
         
         
         
         
         
         
       </div>
</div>

       <!-- jQuery first, then Tether, then Bootstrap JS. -->
       <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

   </body>
</html>
