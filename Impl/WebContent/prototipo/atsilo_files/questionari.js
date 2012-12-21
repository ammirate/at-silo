var arrInput = new Array(0);
var arrInputValue = new Array(0);
v=1;
n=0;
c=0;
idM = 0;
function addInput(id) {
  //arrInput.push(createInput(arrInput.length));
  //arrInput.push(arrInput.length);
  arrInputValue.push(arrInputValue.length);
  display(id);
  c++;
}
function createToolTip(){
	
	var i=10;
}
function set(id) {
		if(idM!=id) {
			idM=id;
			frm = document.forms[0]
			tbl = document.getElementById(id);
		}
	
}
function display(id , n) {
	set(id);
	row = tbl.insertRow(-1);
	row.innerHTML = "<td> Opzione <td> <input type=text name=opzione"+n+"[]>";
}
function addDomanda() {
	  //arrInput.push(createInput(arrInput.length));
	 
	  frm = document.getElementById("formdomande");
	  div = document.createElement("div");
	 
	  div.setAttribute("id", "domanda_header"+v);
	  
	  nome = "parah" + v;
	  str = "<br><br><fieldset><table id="+nome+"><tr><td><h3>Domanda: </h3><td><input type=text name='domanda"+v+"' size=80><tr><td> Opzione  <td> <input type=text name=opzione"+v+"[] ></table><br><br>";
	  str += "<Select name=tipo"+v+" onchange=\"abilitaAdd(this.value, this.name, "+v+")\">" +
	  		"		<option value=1>Selezione Multipla</option>" +
	  		"		<option value=2>Selezione Unica</option>" +
	  		"		<option value=3 selected>Risposta Aperta</option>" +
	  		"		</Select><input type=button disabled = disabled id='addCampo"+v+"' value='Aggiungi Campo' onclick=\"display('"+nome+"', "+v+" );\">" +
	  	    "		<input type=button value='Elimina Domanda' onClick='eliminaDomanda("+  v+")'>"+
	  		"</fieldset><br><br>";
	  frm.appendChild(div);
	 
	  document.getElementById("domanda_header" + v).innerHTML=str;
	  v++;
	  
}
function setv(i) {
	v=i;
}


function eliminaDomanda(id) {
	
	
	var dom=id;
	var idDom="domanda_header"+dom
		
		var d = document.getElementById(idDom);
		d.parentNode.removeChild(d);
	
	
	
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
			if((tbl.rows.length-1)>2){
				n = tbl.rows.length;
				for(j = 0; j<(n-2); j++) {
					tbl.deleteRow(-1);
				}
				document.getElementById(d).setAttribute("disabled", "disabled");
			}
			else document.getElementById(d).setAttribute("disabled", "disabled");
		}
	}
	
}


function controlData() {
	frm = document.forms[0];
	var dataIn = null; 
	var dataOu = null;
	for(var i = 0; i<frm.length; i++) {
		if (frm[i].name=='dataIn') dataIn = frm[i];
		if (frm[i].name=='dataOu') dataOu = frm[i];
		if(dataIn!=null && dataOu!=null) break;
	}
	if(dataIn.value=="" || dataOu.value=="") {
		alert("Errore: Il campo data non può essere vuoto");
		return false;
	}

	var val = confronta_data(dataIn.value, dataOu.value);
	if (val==true) return true;
	else {
		alert("Errore: la data di fine deve essere posteriore alla data di inizio");
		return false;
	}

}
	
function controllo_data(stringa){
    var espressione = /^[0-9]{2}\/[0-9]{2}\/[0-9]{4}$/;
    if (!espressione.test(stringa))
    {
        return false;
    }else{
        anno = parseInt(stringa.substr(6),10);
        mese = parseInt(stringa.substr(3, 2),10);
        giorno = parseInt(stringa.substr(0, 2),10);
        
        var data=new Date(anno, mese-1, giorno);
        if(data.getFullYear()==anno && data.getMonth()+1==mese && data.getDate()==giorno){
            return true;
        }else{
            return false;
        }
    }
}



function confronta_data(data1, data2){
	// controllo validità formato data
    if(controllo_data(data1) &&controllo_data(data2)){
		//trasformo le date nel formato aaaammgg (es. 20081103)
        data1str = data1.substr(6)+data1.substr(3, 2)+data1.substr(0, 2);
		data2str = data2.substr(6)+data2.substr(3, 2)+data2.substr(0, 2);
		//controllo se la seconda data è successiva alla prima
        if (data2str-data1str<0) {
           return false;
        }else{
			return true;
        }
    }else{
       return false;
    }
}

