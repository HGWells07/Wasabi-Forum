var flagColor = true;

function open_navbar(){
	document.getElementById("navbar-imagen-menu").style.visibility="hidden";
	document.getElementById("navbar-imagen-close").style.visibility="visible";
	document.getElementById("extended-navbar-container").style.width = "250px";
	//document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	document.getElementById("capa-oscura").style.visibility = "visible";
	flagColor = false;
}

function close_navbar(){
	document.getElementById("navbar-imagen-menu").style.visibility="visible";
	document.getElementById("navbar-imagen-close").style.visibility="hidden";
	document.getElementById("extended-navbar-container").style.width = "0px";
	//document.body.style.backgroundColor = "#E1E1E1";
	document.getElementById("capa-oscura").style.visibility = "hidden";
	flagColor = true;
}


function open_notification_bar(){
	var barra = document.getElementById("notification-bar");
	barra.style.width = "300px";
	//document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
	document.getElementById("capa-oscura").style.visibility = "visible";
}

function close_notification_bar(){
	var barra = document.getElementById("notification-bar");
	barra.style.width = "0px";
	if(flagColor){
            //document.body.style.backgroundColor = "#E1E1E1";
            document.getElementById("capa-oscura").style.visibility = "hidden";
	}
}
