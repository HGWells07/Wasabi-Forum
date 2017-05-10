//Al dar Click en el boton Registrasre, se "scrolee" hacia el apartado de Registro
$(function ()
{
    $('#BRegistro').click(function ()
    {
        $('html,body').animate(
                {
                    scrollTop: $('#DivRegistro').offset().top
                },
                2000
                );

    });
});
//Valida puros numeros enteros
function validarEnteros(e)
{
   
    var keynum;
                if (window.event)
                    keynum = e.keyCode;
                else
                if (e.which)
                    keynum = e.wich;
                if ((keynum >= 48 && keynum <= 57) || keynum === 8)
                    return true;
                else
                    return false;
            
    
}
//Valida puras cadenas
function validarCadena(e)
{
    var keynum;
                if (window.event)
                    keynum = e.keyCode;
                else
                if (e.which)
                    keynum = e.wich;
                if ((keynum >= 48 && keynum <= 57) || keynum === !8)
                    return false;
                else
                    return true;
            
    
}
 
//  function validarInicioSesion(e)
//{
//   var InSesUsuario=document.getElementById("usuarioIn");
//   var InSesConstraseña=document.getElementById("contraseñaIn");
//
//}
//function validarRegistro(e)
//{
//   var RegNombres=document.getElementById("Nombres");
//   var RegApellido=document.getElementById("Apellido");
//   var RegGrupo=document.getElementById("Grupo");
//   var RegBoleta=document.getElementById("Boleta");
//   var RegSemestre=document.getElementById("Semestre");
//   var RegCorreo=document.getElementById("Correo");
//   var RegNombreUsuario=document.getElementById("Nombre_Usuario");
//   var RegContraseña=document.getElementById("Contraseña");
//   var RegConfirmContraseña=document.getElementById("Confirm_Contraseña");
//
//}

