
function submitModule(tipo1, tipo2, porto, nris) {
		if(window.XMLHttpRequest) {
			req = new XMLHttpRequest();
			req.onreadystatechange=inviadati;
			req.open("GET", "getPorto.php?tipo="+typeBarca+"&porto="+porto+"&nris="+nris, true);
			req.send("");
		}
	}	
	function inviadati() {
		if(req.readyState==4) {
			var d = document.getElementById('inner');
			d.innerHTML=req.responseText;
		}
	}
	function prova()
	{
		nome = new Array();
		comp = true;
		frm = document.forms[0];
		for( var i  = 0; i<frm.elements.length; i++) {
			if((frm.elements[i].type.toLowerCase()=='checkbox' || frm.elements[i].type.toLowerCase()=='radio') && frm.elements[i].checked==true) {
				nome[nome.length] = frm.elements[i].name;
			}
			else if(frm.elements[i].type.toLowerCase()=='text' && frm.elements[i].value!="") {
				nome[nome.length] = frm.elements[i].name;
			}
			else if(frm.elements[i].type.toLowerCase()=='hidden') continue;		
		}
		for (var i = 0; i<frm.elements.length; i++) {
			n = frm.elements[i].name;
			if(frm.elements[i].type=='hidden'|| n=="") continue;
			trovato = false;
			for (var j = 0; j<nome.length; j++) {
				if (n == nome[j]) {
					trovato = true;
					break;
				}
			}
			if(trovato==false) break;
		}
		if(trovato==false) {
			alert("Attenzione: uno o più campi del questionario non sono stati compilati: Controlla prima di sottomettere");
		}
		else
		{
			frm.submit();
		}
	}	