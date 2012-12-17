var arrInput = new Array(0);
  var arrInputValue = new Array(0);
v=1;
n=0;
c=0;
function addInput(id) {
  //arrInput.push(createInput(arrInput.length));
  //arrInput.push(arrInput.length);
  arrInputValue.push(arrInputValue.length);
  display(id);
  c++;
}

function display(id , n) {
	frm = document.forms[0]
	tbl = document.getElementById(id);
	row = tbl.insertRow(-1);
	row.innerHTML = "<td> Opzione <td> <input type=text name=opzione"+n+"[]>";
}
function addDomanda() {
	  //arrInput.push(createInput(arrInput.length));
	 
	  frm = document.getElementById("formdomande");
	  div = document.createElement("div");
	  div.setAttribute("id", "domanda_header" + v);
	  nome = "parah" + v;
	  str = "<br><br><fieldset><table id="+nome+"><tr><td><h3>Domanda: </h3><td><input type=text name='domanda"+v+"' size=80><tr><td> Opzione  <td> <input type=text name=opzione"+v+"[] ></table><br><br>";
	  str += "<Select name=tipo"+v+">" +
	  		"		<option>Seleziona</option>" +
	  		"		<option value=1>Selezione Multipla</option>" +
	  		"		<option value=2>Selezione Unica</option>" +
	  		"		<option value=3>Risposta Aperta</option>" +
	  		"		</Select><input type=button disabled = disabled value='Aggiungi Campo' onclick=\"display('"+nome+"', "+v+" );\"></fieldset><br><br>";
	  frm.appendChild(div);
	  document.getElementById("domanda_header" + v).innerHTML=str;
	  v++;
	  
}
function setv(i) {
	v=i;
}

function abilitaAdd(value, name, b) {
	frm = document.forms[0];
	for(var i = 0; i<frm.length; i++) {
		d = frm[i].id;
		s = "addCampo" + b;
		if(d == s && value!=3)
		{
			document.getElementById(d).removeAttribute("disabled");
			break;
		}
		if(value==3 && d==s) {
			if((tbl.rows.length-1)>1){
				for(j = 0; j<tbl.rows.length; j++) {
					tbl.deleteRow(-1);
				}
				document.getElementById(d).setAttribute("disabled", "disabled");
			}
			else document.getElementById(d).setAttribute("disabled", "disabled");
		}
	}
}
	


