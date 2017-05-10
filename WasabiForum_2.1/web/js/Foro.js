$(function () {
    $("#BPublicar").on("click", function () {
        $("#fPublicar").validate
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

   $(function () {
    $("#BFiltrar").on("click", function () {
    
        $("#fFiltrar").validate
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
