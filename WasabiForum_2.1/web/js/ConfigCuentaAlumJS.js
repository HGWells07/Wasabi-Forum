$(function () {
    $("#BContraAlum").on("click", function () {
    
        $("#fContraAlum").validate
                ({
                    rules:
                            {
                                contra1Alum: {required: true}
                            },
                    messages:
                            {
                                contra1Alum: {required: "*Ingrese contraseña"}
                            }
                });
    });
});



$(function () {
    $("#BCambioContraAlum").on("click", function () {
        $("#fCambioContraAlum").validate
                ({
                    rules:
                            {
                                nueContraAlum: {required: true},
                                ConfNueContraAlum: {equalTo:"#nueContraAlum"}
                            },
                    messages:
                            {
                                nueContraAlum: {required: "*Ingrese la contraseña nueva"},
                                ConfNueContraAlum: {equalTo: "*No coincide con la contraseña nueva"}
                            }
                            
                });
    });
});

    $(function () {
    $("#BCambioGrupoAlum").on("click", function () {
    
        $("#fCambioGrupoAlum").validate
                ({
                    rules:
                            {
                                nueGrupo: {required: true}
                            },
                    messages:
                            {
                                nueGrupo: {required: "Seleccione Grupo"}
                            }
                });
    });
});
