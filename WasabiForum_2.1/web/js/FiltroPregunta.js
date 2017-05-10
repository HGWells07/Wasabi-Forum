
   $(function () {
    $("#BFiltrarP").on("click", function () {
    
        $("#formFiltrar").validate
                ({
                    rules:
                            {
                                selectFiltroAcademia: {required: true},
                                selectFiltroMateria: {required: true}
                            },
                    messages:
                            {
                                selectFiltroAcademia: {required: "Seleccione academia"},
                                selectFiltroMateria: {required: "Seleccione Materia"}
                            }
                });
    });
});

$(function () {
    $("#submitPublicacion").on("click", function () {
        $("#formularioPublicar").validate
                ({
                    rules:
                            {
                                inputTituloPublicacion: {required: true},
                                selectAcademia: {required: true},
                                selectMateria: {required:true}
                                
                            },
                    messages:
                            {
                                inputTituloPublicacion: {required: "Ingrese el titulo"},
                                selectAcademia: {required: "Seleccione academia"},
                                selectMateria: {required: "Seleccione materia"}
                            }
                });
    });
});