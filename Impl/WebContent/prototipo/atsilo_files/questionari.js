var arrInput = new Array(0);
  var arrInputValue = new Array(0);
v=1;
n=0;
function addInput(id) {
  //arrInput.push(createInput(arrInput.length));
  //arrInput.push(arrInput.length);
  arrInputValue.push(arrInputValue.length);
  display(id);
}

function display(id , n) {
//  document.getElementById('parah').innerHTML="";
 // for (intI=0;intI<arrInput.length;intI++) {
	
//	document.getElementById(id).innerHTML+="<tr><td> Opzione <td> <input type=text name=opzione"+v+"[]>";
	tbl = document.getElementById(id);
	row = tbl.insertRow(-1);
	row.innerHTML = "<td> Opzione <td> <input type=text name=opzione"+n+"[]>";
  //}
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
	  		"		</Select><input type=button value='Aggiungi Campo' onclick=\"display('"+nome+"', "+v+" );\"></fieldset><br><br>";
	  frm.appendChild(div);
	  document.getElementById("domanda_header" + v).innerHTML=str;
	  v++;
	  
}
function setv(i) {
	v=i;
}

	


