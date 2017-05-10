$(function () {
    $("#BContra").on("click", function () {
    
        $("#fContra").validate
                ({
                    rules:
                            {
                                contra1: {required: true}
                            },
                    messages:
                            {
                                contra1: {required: "*Ingrese contraseña"}
                            }
                });
    });
});



$(function () {
    $("#BCambio").on("click", function () {
        $("#fCambio").validate
                ({
                    rules:
                            {
                                nueContra: {required: true},
                                ConfNueContra: {equalTo:"#nueContra"}
                            },
                    messages:
                            {
                                nueContra: {required: "*Ingrese la contraseña nueva"},
                                ConfNueContra: {equalTo: "*No coincide con la contraseña nueva"}
                            }
                            
                });
    
    });
    
    
});

function div2() {

    var divCambio = document.getElementById("DivCambio");
    var divContra = document.getElementById("DivContra");

    if (divContra.style.visibility === "visible") {
        divContra.style.visibility = "hidden";
        divCambio.style.visibility = "visible";

    }
}