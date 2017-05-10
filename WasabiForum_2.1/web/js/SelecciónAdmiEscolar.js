//JQuery Validate... Valida todos los campos vacios de cada div correspondiente
$(function () {
    $("#BNuevaArea").on("click", function () {
        $("#fNuevaArea").validate
                ({
                    rules:
                            {
                                NomArea: {required: true},
                                injefearea:{required: true}
                            },
                    messages:
                            {
                                NomArea: {required: "*Ingrese nombre del area"},
                                injefearea:{required: "Seleccione jefe de area"}
            }
                });
    });
});

$(function () {
    $("#BEliminarArea").on("click", function () {
        $("#fEliminarArea").validate
                ({
                    rules:
                            {
                                ElimArea: {required: true}
                            },
                    messages:
                            {
                                ElimArea: {required: "*Seleccione el area"}
                            }
                });
    });
});
$(function () {
    $("#BNuevoProfesor").on("click", function () {
        $("#fNuevoProfesor").validate
                ({
                    rules:
                            {
                                NumEmplinput: {required: true},
                                Contrainput: {required: true}
                            },
                    messages:
                            {
                                NumEmplinput: {required: "*Ingrese numero de empleado"},
                                Contrainput: {required: "*Ingrese contraseña"}
                            }
                });
    });
});
$(function () {
    $("#BElimProfesor").on("click", function () {
        $("#fElimProfesor").validate
                ({
                    rules:
                            {
                                SelecProfesor: {required: true}
                            },
                    messages:
                            {
                                SelecProfesor: {required: "*Seleccione un profesor"}
                            }
                });
    });
});
$(function () {
    $("#BNuevoGrupo").on("click", function () {
        $("#fNuevoGrupo").validate
                ({
                    rules:
                            {
                                NomGrupo: {required: true},
                                SelecSemestre1: {required: true}
                            },
                    messages:
                            {
                                NomGrupo: {required: "*Ingrese el nombre del grupo"},
                                SelecSemestre1: {required: "*Seleccione el semestre"}
                            }
                });
    });
});
$(function () {
    $("#BElimGrupo").on("click", function () {
        $("#fElimGrupo").validate
                ({
                    rules:
                            {
                                SelecSemestre2: {required: true},
                                SelecGrupo: {required: true}
                            },
                    messages:
                            {
                                SelecSemestre2: {required: "*Seleccione el semestre"},
                                SelecGrupo: {required: "*Seleccione el grupo"}
                            }
                });
    });
});

function OpccionesArea(){
    var OpcArea=document.getElementById("opcAreas");
    var OpcProfesores=document.getElementById("opcProfesores");
    var OpcEstudios=document.getElementById("opcEstudios");
    var PantNuevaArea=document.getElementById("PantallaNuevaArea");
    var PantEliminarArea=document.getElementById("PantallaEliminarArea");
    var PantNuevoProfe=document.getElementById("PantallaNuevoProfesor");
    var PantEliminarProfe=document.getElementById("PantallaEliminarProfesor");
    var PantNuevoGrupo=document.getElementById("PantallaNuevoGrupo");
    var PantEliminarGrupo=document.getElementById("PantallaEliminarGrupo");
    OpcArea.style.visibility="visible";
    OpcProfesores.style.visibility="hidden";
    OpcEstudios.style.visibility="hidden";
    PantNuevaArea.style.visibility="visible";
    PantEliminarArea.style.visibility="hidden";
    PantNuevoProfe.style.visibility="hidden";
    PantEliminarProfe.style.visibility="hidden";
    PantNuevoGrupo.style.visibility="hidden";
    PantEliminarGrupo.style.visibility="hidden";
}

function OpccionesProfesores(){
    var OpcArea=document.getElementById("opcAreas");
    var OpcProfesores=document.getElementById("opcProfesores");
    var OpcEstudios=document.getElementById("opcEstudios");
     var PantNuevaArea=document.getElementById("PantallaNuevaArea");
    var PantEliminarArea=document.getElementById("PantallaEliminarArea");
     var PantNuevoProfe=document.getElementById("PantallaNuevoProfesor");
    var PantEliminarProfe=document.getElementById("PantallaEliminarProfesor");
    var PantNuevoGrupo=document.getElementById("PantallaNuevoGrupo");
    var PantEliminarGrupo=document.getElementById("PantallaEliminarGrupo");
    OpcArea.style.visibility="hidden";
    OpcProfesores.style.visibility="visible";
    OpcEstudios.style.visibility="hidden";
    PantNuevaArea.style.visibility="hidden";
    PantEliminarArea.style.visibility="hidden";
    PantNuevoProfe.style.visibility="visible";
    PantEliminarProfe.style.visibility="hidden";
    PantNuevoGrupo.style.visibility="hidden";
    PantEliminarGrupo.style.visibility="hidden";
}

function OpccionesEstudios(){
    var OpcArea=document.getElementById("opcAreas");
    var OpcProfesores=document.getElementById("opcProfesores");
    var OpcEstudios=document.getElementById("opcEstudios");
    var PantNuevaArea=document.getElementById("PantallaNuevaArea");
    var PantEliminarArea=document.getElementById("PantallaEliminarArea");
    var PantNuevoProfe=document.getElementById("PantallaNuevoProfesor");
    var PantEliminarProfe=document.getElementById("PantallaEliminarProfesor");
    var PantNuevoGrupo=document.getElementById("PantallaNuevoGrupo");
    var PantEliminarGrupo=document.getElementById("PantallaEliminarGrupo");
    OpcArea.style.visibility="hidden";
    OpcProfesores.style.visibility="hidden";
    OpcEstudios.style.visibility="visible";
    PantNuevaArea.style.visibility="hidden";
    PantEliminarArea.style.visibility="hidden";
    PantNuevoProfe.style.visibility="hidden";
    PantEliminarProfe.style.visibility="hidden";
    PantNuevoGrupo.style.visibility="visible";
    PantEliminarGrupo.style.visibility="hidden";
}

function PantNuevaArea(){
    var PantNuevaArea=document.getElementById("PantallaNuevaArea");
    var PantEliminarArea=document.getElementById("PantallaEliminarArea");
    PantNuevaArea.style.visibility="visible";
    PantEliminarArea.style.visibility="hidden";
}

function PantEliminarArea(){
    var PantNuevaArea=document.getElementById("PantallaNuevaArea");
    var PantEliminarArea=document.getElementById("PantallaEliminarArea");
    PantNuevaArea.style.visibility="hidden";
    PantEliminarArea.style.visibility="visible";
}

function PantNuevoProfesor(){
    var PantNuevoProfe=document.getElementById("PantallaNuevoProfesor");
    var PantEliminarProfe=document.getElementById("PantallaEliminarProfesor");
    PantNuevoProfe.style.visibility="visible";
    PantEliminarProfe.style.visibility="hidden";
}

function PantEliminarProfesor(){
    var PantNuevoProfe=document.getElementById("PantallaNuevoProfesor");
    var PantEliminarProfe=document.getElementById("PantallaEliminarProfesor");
    PantNuevoProfe.style.visibility="hidden";
    PantEliminarProfe.style.visibility="visible";
}

function PantNuevoGrupo(){
    var PantNuevoGrupo=document.getElementById("PantallaNuevoGrupo");
    var PantEliminarGrupo=document.getElementById("PantallaEliminarGrupo");
    PantNuevoGrupo.style.visibility="visible";
    PantEliminarGrupo.style.visibility="hidden";
}

function PantEliminarGrupo(){
    var PantNuevoGrupo=document.getElementById("PantallaNuevoGrupo");
    var PantEliminarGrupo=document.getElementById("PantallaEliminarGrupo");
    PantNuevoGrupo.style.visibility="hidden";
    PantEliminarGrupo.style.visibility="visible";
}