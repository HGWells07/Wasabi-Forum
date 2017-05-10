<%-- 
    Document   : registrarAcademia
    Created on : May 7, 2017, 10:47:35 PM
    Author     : merlyn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controllers.Profesor, controllers.Materia, java.util.*"%>

<!DOCTYPE html>
<html>
   <head>
       <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <title>Wasabi Forum - Gestion de Area Basica </title>
       <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
       <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
       <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
       
       <script src="./js/jquery-3.2.1.min.js"></script>
       <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
       <link rel="stylesheet" type="text/css" href="css/estilosGestion.css">
   </head>
   <body class="bodyProfes">
   
       <div class="col-md-12" style="padding-left:4em;padding-right:4em;">
         <h3 class="card">
           <div class="card-title">
              Registrar Academia
           </div>
        </h3>

        <div class="input-group">
          <span class="input-group-btn">
            <button type="button" name="button" class="btn btn-default">Nombre</button>
          </span>
            <input type="text" id="nombreAcademia" value="" class="form-control">
        </div>
        <br>

        <div class="input-group">
          <span class="input-group-btn">
            <button type="button" name="button" class="btn btn-default">Jefe</button>
          </span>
            <select class="form-control" id="nombreProfesor">
                <%
                Profesor aux = new Profesor();
                ArrayList<Profesor> profesores = aux.getProfesores();
                
                for (int i = 0; i < profesores.size(); i++) {
                %>
                <option value="<%= profesores.get(i).getIdUsuario()%>"><%= profesores.get(i).getNombre() %></option>
                <%}%>
            </select>
        </div>


       <div class="col-md-12">
         <strong>Materias</strong>
         
         <%
         
         Materia mat = new Materia();
         ArrayList<Materia> materias = mat.getMaterias();
         
         for (int j = 0; j < materias.size(); j++) {
         %>
         
         <div class="card academ-item">
           <div class="card-block">
             <blockquote class="card-blockquote academ" id="textocuadritoinstruccion">
                 <p><%= materias.get(j).getNombre() %></p><input type="checkbox" name="materias" id="<%= materias.get(j).getIdMateria() %>" >
             </blockquote>
           </div>
         </div>
         <% } %>
       </div>
       
         <button onclick="registrarAcademia();" class="form-control">Registrar Academia</button>
           
           <script>
               function registrarAcademia(){
                   var materias = document.getElementsByName('materias');
                   var registrar = [];
                   
                   for (var i = 0; i < materias.length; i++) {
                       if(materias[i].checked){
                           registrar.push(materias[i].id);
                       }
                   }
                   
                   var select = document.getElementById("nombreProfesor");
                   var profesor = select.options[select.selectedIndex].value;
                   
                   var data = {
                       nombre:document.getElementById("nombreAcademia").value,
                       profesor:profesor,
                       materias:JSON.stringify(registrar)
                   }
                   
                   $.ajax({
                       method:"GET",
                       url:"/Gestion/RegistrarAcademia",
                       data:$.param(data),
                       success:function(response){
                           console.log(response);
                           alert('Academia ' + data.nombre + ' registrada exitosamente!');
                       }
                   });
                   
               }
           </script>
</div>

       <!-- jQuery first, then Tether, then Bootstrap JS. -->
   </body>
</html>