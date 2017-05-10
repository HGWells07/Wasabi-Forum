//JQuery Validate... Sirve para validar campos vacios en formulario de Inicio de Sesion
$(function () {

    $("#BIniciarSesion").on("click", function () {
    
        $("#fInicioSesion").validate
                ({
                    rules:
                            {
                                usuarioIn: {required: true,rangelength: [5, 10]},
                                contraIn: {required:true}
                                
                            },
                    messages:
                            {
                                usuarioIn: {required: "Ingrese el usuario",rangelength:"Ingrese usuario válido"},
                                contraIn: {required: "Ingrese la contraseña"}
                            }
                });
    });
});

$(function () {

    $("#BAdmin").on("click", function () {
    
        $("#fAdmin").validate
                ({
                    rules:
                            {
                                UsuPrivi: {required: true,minlength:5,maxlength:5},
                                ContraPrivi: {required:true}
                                
                            },
                    messages:
                            {
                                UsuPrivi: {required: "Ingrese num o nombre de empleado",minlength:"Número de empleado inválido",maxlength:"Número de empleado inválido"},
                                ContraPrivi: {required: "Ingrese contraseña de empleado"}
                            }
                });
    });
});
