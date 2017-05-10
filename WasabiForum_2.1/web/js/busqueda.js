/*
function ComboBoxSemestree() {

    var myselect = document.getElementById("turnoo");
    var myselect2 = document.getElementById("semestree");
    var value = myselect.options[myselect.selectedIndex].value;

    if (value === "0")
    {
        myselect2.options.length = 0;
        myselect2.options[0] = new Option("Seleccione el turno", "");
    } else
    if (value === "1")
    {
        myselect2.options[0] = new Option("Seleccione el turno", "");
        myselect2.options[1] = new Option("1°", "1m");
        myselect2.options[2] = new Option("2°", "2m");
        myselect2.options[3] = new Option("3°", "3m");
        myselect2.options[4] = new Option("4°", "4m");
        myselect2.options[5] = new Option("5°", "5m");
        myselect2.options[6] = new Option("6°", "6m");

    } else
    if (value === "2")
    {
        myselect2.options[0] = new Option("Seleccione el turno", "");
        myselect2.options[1] = new Option("1°", "1v");
        myselect2.options[2] = new Option("2°", "2v");
        myselect2.options[3] = new Option("3°", "3v");
        myselect2.options[4] = new Option("4°", "4v");
        myselect2.options[5] = new Option("5°", "5v");
        myselect2.options[6] = new Option("6°", "6v");

    }
}
;

function ComboBoxGrupoo() {

    var myselect = document.getElementById("semestree");
    var myselect2 = document.getElementById("grupoo");
    var value = myselect.options[myselect.selectedIndex].value;
    var value = myselect.options[myselect.selectedIndex].value;
    if (value === "0m")
    {
        myselect2.options.length = 0;
        myselect2.options[0] = new Option("Seleccion el semestre", "");
    } else
    if (value === "1m")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("1IM1", "1");
        myselect2.options[2] = new Option("1IM2", "2");
        myselect2.options[3] = new Option("1IM3", "3");
        myselect2.options[4] = new Option("1IM4", "4");
        myselect2.options[5] = new Option("1IM5", "5");
        myselect2.options[6] = new Option("1IM6", "6");
        myselect2.options[7] = new Option("1IM7", "7");
    } else
    if (value === "2m")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("2IM1", "1");
        myselect2.options[2] = new Option("2IM2", "2");
        myselect2.options[3] = new Option("2IM3", "3");
        myselect2.options[4] = new Option("2IM4", "4");
        myselect2.options[5] = new Option("2IM5", "5");
        myselect2.options[6] = new Option("2IM6", "6");
        myselect2.options[7] = new Option("2IM7", "7");
    } else
    if (value === "3m")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("3IM1", "1");
        myselect2.options[2] = new Option("3IM2", "2");
        myselect2.options[3] = new Option("3IM3", "3");
        myselect2.options[4] = new Option("3IM4", "4");
        myselect2.options[5] = new Option("3IM5", "5");
        myselect2.options[6] = new Option("3IM6", "6");
        myselect2.options[7] = new Option("3IM7", "7");
    } else
    if (value === "4m")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("4IM1", "1");
        myselect2.options[2] = new Option("4IM2", "2");
        myselect2.options[3] = new Option("4IM3", "3");
        myselect2.options[4] = new Option("4IM4", "4");
        myselect2.options[5] = new Option("4IM5", "5");
        myselect2.options[6] = new Option("4IM6", "6");
        myselect2.options[7] = new Option("4IM7", "7");
    } else
    if (value === "5m")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("5IM1", "1");
        myselect2.options[2] = new Option("5IM2", "2");
        myselect2.options[3] = new Option("5IM3", "3");
        myselect2.options[4] = new Option("5IM4", "4");
        myselect2.options[5] = new Option("5IM5", "5");
        myselect2.options[6] = new Option("5IM6", "6");
        myselect2.options[7] = new Option("5IM7", "7");
    } else
    if (value === "6m")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("6IM1", "1");
        myselect2.options[2] = new Option("6IM2", "2");
        myselect2.options[3] = new Option("6IM3", "3");
        myselect2.options[4] = new Option("6IM4", "4");
        myselect2.options[5] = new Option("6IM5", "5");
        myselect2.options[6] = new Option("6IM6", "6");
        myselect2.options[7] = new Option("6IM7", "7");
    } else
    if (value === "0v")
    {
        myselect2.options.length = 0;
        myselect2.options[0] = new Option("Seleccion el semestre", "");
    } else
    if (value === "1v")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("1IV1", "1");
        myselect2.options[2] = new Option("1IV2", "2");
        myselect2.options[3] = new Option("1IV3", "3");
        myselect2.options[4] = new Option("1IV4", "4");
        myselect2.options[5] = new Option("1IV5", "5");
        myselect2.options[6] = new Option("1IV6", "6");
        myselect2.options[7] = new Option("1IV7", "7");
    } else
    if (value === "2v")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("2IV1", "1");
        myselect2.options[2] = new Option("2IV2", "2");
        myselect2.options[3] = new Option("2IV3", "3");
        myselect2.options[4] = new Option("2IV4", "4");
        myselect2.options[5] = new Option("2IV5", "5");
        myselect2.options[6] = new Option("2IV6", "6");
        myselect2.options[7] = new Option("2IV7", "7");
    } else
    if (value === "3v")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("3IV1", "1");
        myselect2.options[2] = new Option("3IV2", "2");
        myselect2.options[3] = new Option("3IV3", "3");
        myselect2.options[4] = new Option("3IV4", "4");
        myselect2.options[5] = new Option("3IV5", "5");
        myselect2.options[6] = new Option("3IV6", "6");
        myselect2.options[7] = new Option("3IV7", "7");
    } else
    if (value === "4v")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("4IV1", "1");
        myselect2.options[2] = new Option("4IV2", "2");
        myselect2.options[3] = new Option("4IV3", "3");
        myselect2.options[4] = new Option("4IV4", "4");
        myselect2.options[5] = new Option("4IV5", "5");
        myselect2.options[6] = new Option("4IV6", "6");
        myselect2.options[7] = new Option("4IV7", "7");
    } else
    if (value === "5v")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("5IV1", "1");
        myselect2.options[2] = new Option("5IV2", "2");
        myselect2.options[3] = new Option("5IV3", "3");
        myselect2.options[4] = new Option("5IV4", "4");
        myselect2.options[5] = new Option("5IV5", "5");
        myselect2.options[6] = new Option("5IV6", "6");
        myselect2.options[7] = new Option("5IV7", "7");
    } else
    if (value === "6v")
    {
        myselect2.options[0] = new Option("Seleccione el grupo", "");
        myselect2.options[1] = new Option("6IV1", "1");
        myselect2.options[2] = new Option("6IV2", "2");
        myselect2.options[3] = new Option("6IV3", "3");
        myselect2.options[4] = new Option("6IV4", "4");
        myselect2.options[5] = new Option("6IV5", "5");
        myselect2.options[6] = new Option("6IV6", "6");
        myselect2.options[7] = new Option("6IV7", "7");
    }
}
;




function ComboBoxArea() {

    var myselect = document.getElementById("academiaa");
    var myselect2 = document.getElementById("areaa");
    var value = myselect.options[myselect.selectedIndex].value;

    if (value === "0")
    {
        myselect2.options.length = 0;
        myselect2.options[0] = new Option("Seleccione la academia", "");
    } else
    if (value === "1")
    {
        myselect2.options[0] = new Option("Seleccione el area", "");
        myselect2.options[1] = new Option("Base de datos", "1");
        myselect2.options[2] = new Option("POO", "2");
        myselect2.options[3] = new Option("Seguridad WEB", "3");
        myselect2.options[4] = new Option("Laboratorio de tecnicas", "4");
        myselect2.options[5] = new Option("Administracion de proyectos", "5");

    } else
    if (value === "2")
    {
        myselect2.options[0] = new Option("Seleccione el area", "");
        myselect2.options[1] = new Option("TICS°", "1");
        myselect2.options[2] = new Option("Historia", "2");
    }
}
;
*/
$(function () {

    $("#alumnoButton").on("click", function () {
        $("#formAlumno").validate
                ({
                    rules:
                            {
                                turnoo: {required: true},
                                semestree: {required: true},
                                grupoo: {required: true}
                                




                    },
                    messages:
                            {
                                turnoo: {required: "*Seleccione turno"},
                                semestree: {required: "*Seleccione semestre"},
                                grupoo: {required: "*Seleccione grupo"}

                            }

                });
    });
});


$(function () {

    $("#profeButton").on("click", function () {
        $("#formProfe").validate
                ({
                    rules:
                            {
                                academiaa: {required: true},
                                areaa: {required: true}
                                




                    },
                    messages:
                            {
                                academiaa: {required: "*Seleccione academia"},
                                areaa: {required: "*Seleccione area"}

                            }

                });
    });
});