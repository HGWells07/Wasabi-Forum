//JQuery Validate... Valida todos los campos acios del apartado de Registro
$(function () {

    $("#BRegistrarse").on("click", function () {
        $("#formRegistro").validate
                ({
                    rules:
                            {
                                Nombres: {required: true},
                                Apellido: {required: true},
                                Grupos: {required: true, min: 1},
                                Boleta: {required: true, minlength:10, maxlength:10},
                                Semestres: {required: true, min: 1},
                                Correo: {required: true,email:true},
                                Nombre_Usuario: {required: true, minlength: 5},
                                Password: {required: true, minlength: 5},
                                Confirm_Password: {equalTo:"#Password"}


                            },
                    messages:
                            {
                                Nombres: {required: "*Ingrese Nombres"},
                                Apellido: {required: "*Ingrese Apellidos"},
                                Grupos: {required: "*Seleccione Grupo"},
                                Boleta: {required: "*Ingrese Boleta",minlength:"Boleta inválida",maxlength:"Boleta inválida"},
                                Semestres: {required: "*Seleccione Semestre"},
                                Correo: {required:"Ingrese Correo" ,email: "*Ingrese Correo válido"},
                                Nombre_Usuario: {required: "*Ingrese Nombre de Usuario",minlength:"Ingrese al menos 5 caracteres"},
                                Password: {required: "*Ingrese Contraseña",minlength:"Ingrese al menos 5 caracteres"},
                                Confirm_Password: {equalTo: "*Ingrese nuevamente la contraseña"}
                            }
                });
    });
});

function ComboBoxSemestre() {

    var myselect = document.getElementById("Semestres");
    var myselect2 = document.getElementById("Grupos");
    var value = myselect.options[myselect.selectedIndex].value;
    var value2 = myselect.options[myselect2.selectedIndex].value;

    if (value === '0')
    {
        myselect2.options.length = 0;
        myselect2.options[0] = new Option("Seleccion el grupo", "1");
    } else
    if (value === '1')
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "1");
        myselect2.options[1] = new Option("Grupo 1.1", '2');
        myselect2.options[2] = new Option("Grupo 1.2", '3');
        myselect2.options[3] = new Option("Grupo 1.3", '4');
        myselect2.options[4] = new Option("Grupo 1.3", '5');
        myselect2.options[5] = new Option("Grupo 1.4", '6');
        myselect2.options[6] = new Option("Grupo 1.5", "7");
        myselect2.options[7] = new Option("Grupo 1.6", "8");
    } else
    if (value === '2')
    {
        myselect2.options[0] = new Option("Seleccione el grupo", 'opca');
        myselect2.options[1] = new Option("Grupo 2.1", '2');
        myselect2.options[2] = new Option("Grupo 2.2", '3');
        myselect2.options[3] = new Option("Grupo 2.3", '4');
        myselect2.options[4] = new Option("Grupo 2.3", '5');
        myselect2.options[5] = new Option("Grupo 2.4", '6');
        myselect2.options[6] = new Option("Grupo 2.5", '7');
        myselect2.options[7] = new Option("Grupo 2.6", '8');
    } else
    if (value === '3')
    {
        myselect2.options[0] = new Option("Seleccione el grupo", 'opca');
        myselect2.options[1] = new Option("Grupo 3.1", '2');
        myselect2.options[2] = new Option("Grupo 3.2", '3');
        myselect2.options[3] = new Option("Grupo 3.3", '4');
        myselect2.options[4] = new Option("Grupo 3.3", '5');
        myselect2.options[5] = new Option("Grupo 3.4", '6');
        myselect2.options[6] = new Option("Grupo 3.5", '7');
        myselect2.options[7] = new Option("Grupo 3.6", '8');
    }
    if (value === '4')
    {
        myselect2.options[0] = new Option("Seleccione el grupo", 'opca');
        myselect2.options[1] = new Option("Grupo 4.1", '2');
        myselect2.options[2] = new Option("Grupo 4.2", '3');
        myselect2.options[3] = new Option("Grupo 4.3", '4');
        myselect2.options[4] = new Option("Grupo 4.3", '5');
        myselect2.options[5] = new Option("Grupo 4.4", '6');
        myselect2.options[6] = new Option("Grupo 4.5", '7');
        myselect2.options[7] = new Option("Grupo 4.6", '8');
    }
    if (value === '5')
    {
        myselect2.options[0] = new Option("Seleccione el grupo", 'opca');
        myselect2.options[1] = new Option("Grupo 5.1", '2');
        myselect2.options[2] = new Option("Grupo 5.2", '3');
        myselect2.options[3] = new Option("Grupo 5.3", '4');
        myselect2.options[4] = new Option("Grupo 5.3", '5');
        myselect2.options[5] = new Option("Grupo 5.4", '6');
        myselect2.options[6] = new Option("Grupo 5.5", '7');
        myselect2.options[7] = new Option("Grupo 5.6", '8');
    }

}
;
function validaCorreo() {
    if (!/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(correo)) {
        alert("Tu dirección de correo electronico es inválida");
        return (false);
    }
}