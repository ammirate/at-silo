var BROWSER_EXPLORER = 'Explorer';
var BROWSER_OPERA = 'Opera';
var BROWSER_SAFARI = 'Safari';
var BROWSER_MOZILLA = 'Mozilla';
var BROWSER_NETSCAPE = 'Netscape';
var BROWSER_UNKNOWN = '#NULL#';


var menuDisabled = false;
/**
* Wrapper per il browser
*/
function Browser(name,versione){
	this.name = name;
	this.versione = versione;
}

/**
* Verifica le proprietà del browser
* e crea un oggetto wrapper.
*/
function checkBrowser(){
	var temp, i;
	var useragent = navigator.userAgent;
	i = useragent.indexOf('Opera');
	if (i > -1){
		browserVer = parseInt(useragent.substring(i+6,useragent.length));
		browserName = BROWSER_OPERA;
	} else if (useragent.indexOf('Safari') > -1){
		browserVer = parseInt(useragent.substring(i+6,useragent.length));
		browserName = BROWSER_SAFARI;
	} else {
		if (navigator.appName == 'Microsoft Internet Explorer'){
			browserName = BROWSER_EXPLORER;
			i = useragent.indexOf('MSIE');
			browserVer = useragent.substr(i+5,1);
		} else {
			i = useragent.indexOf('Netscape');
			if (i > -1) {
				browserVer = parseInt(useragent.substring(i+9,useragent.length));
				browserName = BROWSER_NETSCAPE;
			} else {
				if ((useragent.indexOf('Mozilla') > -1)&&(useragent.indexOf('Gecko') > -1)){
					browserName = BROWSER_MOZILLA;
					i = useragent.indexOf('rv:');
					temp = useragent.substring(i+3,useragent.length)
					temp = temp.split(')');
					browserVer = temp[0];
				} else {
					browserVer = 0;
					browserName = BROWSER_UNKNOWN;
				}
			}
		}
	}
	return new Browser(browserName,browserVer);
}

/**
* Istanzia la variabile wrapper per il browser utente
*/
var browserUtente = checkBrowser();


/**
* Disabilita il link ai CSS hover per evitare
* conflitti con la funzione javascript
*/
if(document.getElementById){
	var cssHover = document.getElementById('hoverCSS');
	// ora non fa nulla!!
//	cssHover.disabled = true;
}

/**
* Funzione di inizializzazione dei menu.
* Chiama la funzione RICORSIVA trovaNodi()
* sull'elemento definito da menuID.
* Se menuID non esiste non fa nulla!
*/
function initMenu(menuID){
	if(menuDisabled) return;
//	if(browserUtente.name!=BROWSER_EXPLORER) return;

	var rootmenu = document.getElementById(menuID);
	// Il menu non è stato trovato, si esce senza danni!!
	if(!rootmenu) return;

	var nodes = new Array();
	trovaNodi(rootmenu, nodes);
	
}

/**
* Cicla ricorsivamente sugli elementi figli di root.
* Popola per elementi corretti gli eventi onouseover - onmouseout
* per la visualizzazione del menu
*/
function trovaNodi(root, nodes){
	for(var i=0;i<root.childNodes.length;i++){
		var node = root.childNodes[i];
		// i nodi testo vengono ignorati
		if(node.nodeName!="#text"){
			if((node.nodeName=="A")){
				// diversa gestione delle funzionalità DOM
				if(browserUtente.name==BROWSER_EXPLORER){
					node.parentNode.onmouseover=mouseOverLI;
					node.parentNode.onmouseout=mouseOutLI;
				}
//				else {
//					node.parentNode.setAttribute("onmouseover", "mouseOverLI(this)");
//					node.parentNode.setAttribute("onmouseout", "mouseOutLI(this)");
//				}
			}
			// array di debug
			nodes[nodes.length]=node;
		}
		// chiamata ricorsiva
		trovaNodi(node, nodes);
	}
}

/**
* wrapper della funzione onmouseover
* per la chiamata sia da explorer che da browser gecko-based.
* Invoca la funzione visualizzaMenu
*/
function mouseOverLI(obj){
	if(!obj) obj=this;
	visualizzaMenu(obj);
}
/**
* wrapper della funzione onmouseout
* per la chiamata sia da explorer che da browser gecko-based
* Invoca la funzione nascondiMenu
*/
function mouseOutLI(obj){
	if(!obj) obj=this;
	nascondiMenu(obj);
}
/**
* Visualizzazione del menu.
* Prende in ingresso il nodo che ha scatenato l'evento.
* Imposta la classe CSS al primo nodo <UL /> figlio!
* vedere le classi CSS:
* 	.visualizzato{}
*	.visualizzatoPrimo{}
*/
function visualizzaMenu(nodo){
	for(var i=0;i<nodo.childNodes.length;i++){
		var subMenu = nodo.childNodes[i];
		if(subMenu.nodeName=="UL"){
			if(nodo.parentNode.className=="topmenu")
				subMenu.className="visualizzatoPrimo";
			else
				subMenu.className="visualizzato";
			break;
		}
	}
}
/**
* Occultamento del menu.
* Prende in ingresso il nodo che ha scatenato l'evento.
* Elimina la classe CSS al primo nodo <UL /> figlio!
*/
function nascondiMenu(nodo){
	for(var i=0;i<nodo.childNodes.length;i++){
		var subMenu = nodo.childNodes[i];
		if(subMenu.nodeName=="UL"){
			subMenu.className="menuNascosto";
			break;
		}
	}
}

/**
* Funzione che permette di controllare che la form sia inviata una volta sola.
* Deve essere invocata nell'evento onClick dei bottoni di tipo submit con la seguente sintassi:
* ... onClick="return checkClick(this);" ...
*/
var submittedForm = null;
function checkClick(button) {
	var messaggio = "Richiesta gi\u00E0 inviata!";
	if (submittedForm!=button.form) {
		submittedForm = button.form;
		return true;
	} else {
		alert(messaggio);
		button.disabled = true;
		return false;
	}
}


/**
* Funzione che permette di calcolare e visualizzare il numero totale di CFU
* selecionati. deve essere invocata come segue
* onClick="refreshCounter(input, 3, 5, $WEB_FORMAT_DEC)"
* dove 3 e 5 sono il numero minimo e massimo associato ai cfu.
*/
function refreshCounter(input, cfuMin, cfuMax, formatDec) {
	var form = input.form;
	var totCFUMin;
	var totCFUMax;
	if (form.NUM_UNT != null) {
    	totCFUMin = form.NUM_UNT.value;
    	totCFUMax = form.NUM_UNT.value;
	} else {
    	totCFUMin = form.CFU_MIN.value;
    	totCFUMax = form.CFU_MAX.value;		
	}

	totCFUMin = parseFloat(totCFUMin.replace(",","."));
	totCFUMax = parseFloat(totCFUMax.replace(",","."));

	if (input.type == 'radio') {
		totCFUMin = cfuMin;
		totCFUMax = cfuMax;
	} else { //è un input di tipo checkbox
		if (input.type == 'checkbox') {
			if (input.checked){
				totCFUMin += cfuMin;
				totCFUMax += cfuMax;
			} else {
				totCFUMin -= cfuMin;
				totCFUMax -= cfuMax;
			}
		}
	}

	if (formatDec == 0) {
		totCFUMin = totCFUMin.toString().replace(".",",");
		totCFUMax = totCFUMax.toString().replace(".",",");
	}

    if (form.NUM_UNT!=null) {
    	form.NUM_UNT.value = totCFUMin;
    } else {
    	form.CFU_MIN.value = totCFUMin;
    	form.CFU_MAX.value = totCFUMax;
    }
}


/**
 *
 */
function hideShowElem(elemId){
	var elem = document.getElementById(elemId);
	if(elem){
		var hide = (elem.style.display=='none');
		if (hide)
			elem.style.display = '';
		else
			elem.style.display = 'none';
	}
}




/*****************************************
 * funzione di verifica del numero di cellulare in anagrafica
 */
 function RecapitoFormLoad(alertOnError){
	var radioSi = document.getElementById("sms_si");
	var radioNo = document.getElementById("sms_no");
	var numCell = document.getElementById("cell_num");
	verificaNumCell(numCell, radioSi, radioNo, alertOnError);
}

function verificaNumCell(numCell, radioSi, radioNo, alertOnError){
	var validNumber = verificaNumero(numCell);
	if(radioSi.checked && !validNumber){
    if(alertOnError)
		  alert('Attenzione. Il numero di cellulare fornito non permette di attivare la funzione di notifica via SMS.\nPer poter attivare la funzione inserire un numero di cellulare valido. es: +39 3486767676');
	}
	radioNo.checked =  ((radioSi.checked && !validNumber)|| radioNo.checked);
	radioNo.disabled = !validNumber;
	radioSi.disabled = !validNumber;
	return validNumber;
}

function verificaNumero(elemNumero){

	var ok = true;
	var numValue = elemNumero;
  if(elemNumero.value)
    numValue = formatCellNumber(elemNumero);
  if (/\+\d{2,} \d{8,}$/.test(numValue))
    ok=true;
  else
    ok=false;


/*
  ok = (ok && numValue.length>0);
	var start = numValue.indexOf('+39 ');
	if(start!=-1)
		start+=4;
	else
		start=0;
	var substr = numValue.substring(start);
	ok = (ok && (!isNaN(substr)));
*/
	if (ok)
		return true;
	return false;
}

var prefixList = new Array('+67212' , '+67211' , '+67210' , '+1876'  , '+1869'  , '+1868'  , '+1787'  , '+1784'  , '+1767'  , '+1758'  , '+1664'  , '+1649'  , '+1473'  , '+1441'  , '+1345'  , '+1340'  , '+1284'  , '+1268'  , '+1264'  , '+1246'  , '+1242'  , '+998',
                               '+996', '+995', '+994', '+993', '+977', '+976', '+975', '+974', '+973', '+972', '+971', '+968', '+967', '+966', '+965', '+964', '+963', '+962', '+961', '+960', '+886', '+880', '+856', '+855', '+853', '+852', '+850', '+737',
                               '+692', '+689', '+688', '+687', '+686', '+685', '+684', '+683', '+682', '+681', '+680', '+679', '+678', '+677', '+676', '+675', '+673', '+672', '+671', '+670', '+599', '+598', '+596', '+595', '+594', '+593', '+592', '+591', '+590',
                               '+509', '+508', '+507', '+506', '+505', '+504', '+503', '+502', '+501', '+500', '+423', '+421', '+420', '+389', '+387', '+386', '+385', '+381', '+380', '+377', '+376', '+375', '+374', '+373', '+372', '+371', '+370', '+359',
                               '+358', '+357', '+356', '+355', '+354', '+353', '+352', '+351', '+350', '+299', '+298', '+297', '+291', '+290', '+269', '+268', '+267', '+266', '+265', '+264', '+263', '+262', '+261', '+260', '+258', '+257', '+256', '+255', '+254',
                               '+253', '+252', '+251', '+250', '+249', '+248', '+247', '+246', '+245', '+244', '+243', '+242', '+241', '+240', '+239', '+238', '+237', '+236', '+235', '+234', '+233', '+232', '+231', '+230', '+229', '+228', '+226', '+225', '+224', '+223', '+222', '+221', '+220', '+218', '+216', '+213', '+212',
                               '+98' , '+94' , '+93' , '+92' , '+91' , '+90' , '+86' , '+84' , '+82' , '+81' , '+66' , '+65' , '+64' , '+63' , '+62' , '+61' , '+60' , '+58' , '+57' , '+56' , '+55' , '+54' , '+53' , '+52' , '+51' , '+49' , '+48' , '+47' , '+46' , '+45' , '+44' , '+43' , '+41' , '+40' ,
                               '+39' , '+36' , '+34' , '+33' , '+32' , '+31' , '+30' , '+27' , '+20' , '+7'  , '+1');

function parsePrefix(numTel){
	var retVal = '';
	var trovato=false;
	var i=0;
	while (!trovato & i<prefixList.length) {
		if (numTel.indexOf(prefixList[i],'0')>=0){
			retVal = numTel.replace(prefixList[i],prefixList[i]+' ');
			trovato=true;
		}
		i++;
	}
	return retVal;
}

function cleanTelNumber(numTel) {
	var retVal = numTel;
	var noSymbol = new Array('/','.','_','-','(',')');

	for (var i=0; i<noSymbol.length;i++) {
		if (retVal.indexOf(noSymbol[i],'0')>=0){
			retVal = retVal.replace(noSymbol[i],' ');
		}
	}
	return retVal;
}

function cleanSpace(value){
	var retVal = '';
	v = value.split(' ');
	for (var i = 0; i < v.length; i++) {
		retVal += v[i];
	}
	return retVal;
}

function formatCellNumber(elemNumero){
	var retVal='';
	var numValue = elemNumero.value;
	var ok = (numValue!="undefined");
	if(ok){
		var v = cleanTelNumber(numValue);
		v = cleanSpace(v);
		retVal = parsePrefix(v);
        if (retVal == '') {
    		if (v != 'xxxx') {
				retVal = '+39 ' + v;
			} else {
				retVal = v;
			}
		}
		elemNumero.value = retVal;
	}
	return retVal;
}
 /******************************************
  * FINE funzione di verifica del numero di cellulare in anagrafica
  */

 function getCookie(NameOfCookie){
          if (document.cookie.length > 0) {
                  begin = document.cookie.indexOf(NameOfCookie+"=");
                          if (begin != -1) {
                                  begin += NameOfCookie.length+1;
                                  end = document.cookie.indexOf(";", begin);
                                          if (end == -1)  {
                                          end = document.cookie.length;
                                          }
                                          return  unescape(document.cookie.substring(begin, end));
                          }
                  return null;
          }

}

function setCookie(NameOfCookie, value, expiredays) {
        var ExpireDate = new Date ();
        ExpireDate.setTime(ExpireDate.getTime() + (expiredays * 24 * 3600 *1000));
        document.cookie = NameOfCookie + "=" + escape(value) + ((expiredays== null) ? "" : "; expires=" + ExpireDate.toGMTString());

}

function delCookie (NameOfCookie) {
        if (getCookie(NameOfCookie)) {
        document.cookie = NameOfCookie + "=" + "; expires=Thu, 01-Jan-7000:00:01 GMT";
        }

}

function isCookieEnabled() {
        setCookie("testCookieEnabled","on",1);
        if(!getCookie("testCookieEnabled")) {
                return false;
        }else {
                delCookie("testCookieEnabled");
                return true;
        }

}

function testCookie() {
        if(!isCookieEnabled()) {
                alert("Cookie are disabled");
        } else {
                alert("tutto ok");
        }

}

function removeJsessionId() {

  if(browserUtente.name==BROWSER_SAFARI){
    if(isCookieEnabled()) {


      var elemA = document.getElementsByTagName('a');
      for (i = 0; i < elemA.length; i++) {
        var attrHref = elemA[i].getAttribute('href');
	var newA = removeJsessionIdNewUrl(attrHref);
	if (newA != "") {
	  document.links[i].href=newA;
	}
      }

      var elemFORM = document.getElementsByTagName('form');
      for (i = 0; i < elemFORM.length; i++) {
        var attrAction = elemFORM[i].getAttribute('action');
	var newA = removeJsessionIdNewUrl(attrAction);
	if (newA != "") {
	  document.forms[i].action=newA;
	}
      }


/*

      var start_query_string = "?";
      var key_jsession = ";jsessionid=";

      var elemA = document.getElementsByTagName('a');
      for (i = 0; i < elemA.length; i++) {
        var attrHref = elemA[i].getAttribute('href');

        var start = attrHref.indexOf(key_jsession);
        if(start>0){
          newurl = attrHref.substring(0, start);
          var end = attrHref.indexOf(start_query_string, start);
          if (end>start) {
            newurl = newurl + attrHref.substring(end);
          }
          document.links[i].href=newurl;
        }
      }

      var elemFORM = document.getElementsByTagName('form');
      for (i = 0; i < elemFORM.length; i++) {
        var attrAction = elemFORM[i].getAttribute('action');

        var start = attrAction.indexOf(key_jsession);
        if(start>0){
          newurl = attrAction.substring(0, start);
          var end = attrAction.indexOf(start_query_string, start);
          if (end>start) {
            newurl = newurl + attrAction.substring(end);
          }
          document.forms[i].action=newurl;
        }

      }
*/

    }
  }
}

function removeJsessionIdNewUrl(attr) {

      var start_query_string = "?";
      var key_jsession = ";jsessionid=";
      var newurl = "";

      var start = attr.indexOf(key_jsession);
      if(start>0){
        newurl = attr.substring(0, start);
        var end = attr.indexOf(start_query_string, start);
        if (end>start) {
          newurl = newurl + attr.substring(end);
        }
      }
      return newurl;
}


///////////////////////////////////////
//
//  Generic onload by Brothercake
//  http://www.brothercake.com/
//
///////////////////////////////////////

//setup onload function
if(typeof window.addEventListener != 'undefined')
{
	//.. gecko, safari, konqueror and standard
	window.addEventListener('load', removeJsessionId, false);
}
else if(typeof document.addEventListener != 'undefined')
{
	//.. opera 7
	document.addEventListener('load', removeJsessionId, false);
}
else if(typeof window.attachEvent != 'undefined')
{
	//.. win/ie
	window.attachEvent('onload', removeJsessionId);
}

//** remove this condition to degrade older browsers
else
{
	//.. mac/ie5 and anything else that gets this far

	//if there's an existing onload function
	if(typeof window.onload == 'function')
	{
		//store it
		var existing = onload;

		//add new onload handler
		window.onload = function()
		{
			//call existing onload function
			existing();

			//call generic onload function
			removeJsessionId();
		};
	}
	else
	{
		//setup onload function
		window.onload = removeJsessionId;
	}
}


var xmlhttp=false;
function creaXmlHttpRequest(){
//  var xmlhttp=false;
  /*@cc_on @*/
  /*@if (@_jscript_version >= 5)
    // JScript gives us Conditional compilation, we can cope with old IE versions.
    // and security blocked creation of the objects.
    try {
      xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e) {
      try {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (E) {
      xmlhttp = false;
    }
  }
  @end @*/
  if (!xmlhttp && typeof XMLHttpRequest!='undefined') {
    try {
      xmlhttp = new XMLHttpRequest();
    } catch (e) {
      xmlhttp=false;
    }
  }
  if (!xmlhttp && window.createRequest) {
    try {
      xmlhttp = window.createRequest();
    } catch (e) {
      xmlhttp=false;
    }
  }
  return xmlhttp;
}

function doCompletion(nazId, siglaProv) {
  xmlhttp = creaXmlHttpRequest();
  var url = "Anagrafica/Lookup/Comuni.do" + "?nazId=" + nazId + "&prov=" + siglaProv + "&tmp=" + Math.random();
  xmlhttp.onreadystatechange = recuperaComuni;
  xmlhttp.open("GET", url, true);
  xmlhttp.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
  xmlhttp.send(null);
}

function doCompletionNascita(nazId, siglaProv) {
  xmlhttp = creaXmlHttpRequest();
  var url = "Anagrafica/Lookup/ComuniNascita.do" + "?nazId=" + nazId + "&prov=" + siglaProv + "&tmp=" + Math.random();
  xmlhttp.onreadystatechange = recuperaComuniNascita;
  xmlhttp.open("GET", url, true);
  xmlhttp.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
  xmlhttp.send(null);
}

function doCompletionConId(nazId, siglaProv) {
  xmlhttp = creaXmlHttpRequest();
  var url = "Anagrafica/Lookup/Comuni.do" + "?nazId=" + nazId + "&prov=" + siglaProv + "&tmp=" + Math.random();
  xmlhttp.onreadystatechange = recuperaComuniConId;
  xmlhttp.open("GET", url, true);
  xmlhttp.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
  xmlhttp.send(null);
}

var CMB_COMUNI_NAME_HIDDEN_FIELD = '#*HIDDENfIELD*#';

function loadElencoComuni(siglaProv, cmbComuniName){
  var nameCmbComuni = document.getElementById(CMB_COMUNI_NAME_HIDDEN_FIELD);
  if(!nameCmbComuni){
    nameCmbComuni = document.createElement('input');
    nameCmbComuni.setAttribute('id', CMB_COMUNI_NAME_HIDDEN_FIELD);
    nameCmbComuni.setAttribute('type', 'hidden');
    document.forms[0].appendChild(nameCmbComuni);
  }
  nameCmbComuni.value=cmbComuniName;
  doCompletion(1, siglaProv);
}

function loadElencoComuniNascita(siglaProv, cmbComuniName){
  var nameCmbComuni = document.getElementById(CMB_COMUNI_NAME_HIDDEN_FIELD);
  if(!nameCmbComuni){
    nameCmbComuni = document.createElement('input');
    nameCmbComuni.setAttribute('id', CMB_COMUNI_NAME_HIDDEN_FIELD);
    nameCmbComuni.setAttribute('type', 'hidden');
    document.forms[0].appendChild(nameCmbComuni);
  }
  nameCmbComuni.value=cmbComuniName;
  doCompletionNascita(1, siglaProv);
}

function loadElencoComuniConId(siglaProv, cmbComuniName){
  var nameCmbComuni = document.getElementById(CMB_COMUNI_NAME_HIDDEN_FIELD);
  if(!nameCmbComuni){
    nameCmbComuni = document.createElement('input');
    nameCmbComuni.setAttribute('id', CMB_COMUNI_NAME_HIDDEN_FIELD);
    nameCmbComuni.setAttribute('type', 'hidden');
    document.forms[0].appendChild(nameCmbComuni);
  }
  nameCmbComuni.value=cmbComuniName;
  doCompletionConId(1, siglaProv);
}


function recuperaComuni() {
  if (xmlhttp.readyState == 4) {
    var resp = xmlhttp.responseText;
    var arrayComuni = eval(resp);
    var cmbComuniToUpdate = document.getElementById(CMB_COMUNI_NAME_HIDDEN_FIELD);
    var comboComuni = document.getElementById(cmbComuniToUpdate.value);

    for( var j=comboComuni.options.length;j>0;j--) {
      comboComuni.options[j] = null;
    };

    for(var i=0;i<arrayComuni.length;i++){
      var des = arrayComuni[i].des;
      comboComuni.options[i+1]=new Option(des,des);
    }
  }
}

function recuperaComuniNascita() {
 if (xmlhttp.readyState == 4) {
    var resp = xmlhttp.responseText;
    var arrayComuni = eval(resp);
    var cmbComuniToUpdate = document.getElementById(CMB_COMUNI_NAME_HIDDEN_FIELD);
    var comboComuni = document.getElementById(cmbComuniToUpdate.value);

    for( var j=comboComuni.options.length;j>0;j--) {
      comboComuni.options[j] = null;
    };

    for(var i=0;i<arrayComuni.length;i++){
      var des = arrayComuni[i].des;
      comboComuni.options[i+1]=new Option(des,des);
    }
  }
}

function recuperaComuniConId() {
  if (xmlhttp.readyState == 4) {
    var resp = xmlhttp.responseText;
    var arrayComuni = eval(resp);
    var cmbComuniToUpdate = document.getElementById(CMB_COMUNI_NAME_HIDDEN_FIELD);
    var comboComuni = document.getElementById(cmbComuniToUpdate.value);

    for( var j=comboComuni.options.length;j>0;j--) {
      comboComuni.options[j] = null;
    };

    for(var i=0;i<arrayComuni.length;i++){
      var des = arrayComuni[i].des;
      var comune_id = arrayComuni[i].comune_id;
      comboComuni.options[i+1]=new Option(des,comune_id);
    }
  }
}

var DISABLE_ELEMENT=1;
var ENABLE_ELEMENT=2;

function hideShowElements(){
	var elem = document.getElementsByTagName('*');
  var inputFields, selectFields;
	for(var i=0;i<elem.length;i++){
		if(elem[i].getAttribute('showMeWithJS')){
      elem[i].style.display='';
      inputFields = elem[i].getElementsByTagName('input');
      selectFields = elem[i].getElementsByTagName('select');
      changeDisabledAttr(inputFields, ENABLE_ELEMENT);
      changeDisabledAttr(selectFields, ENABLE_ELEMENT);
    }
		if(elem[i].getAttribute('hideMeWithJS')){
      elem[i].style.display='none';
      inputFields = elem[i].getElementsByTagName('input');
      changeDisabledAttr(inputFields, DISABLE_ELEMENT);
    }
	}
}

function changeDisabledAttr(elements, operation){
  var disabled = (operation==DISABLE_ELEMENT);
  for(var j=0;j<elements.length;j++){
    elements[j].disabled=disabled;
  }
}

//Salierno R. - Inizio
  function doCompletionAule(edificioId) {
    xmlhttp = creaXmlHttpRequest();
    var url = "auth/docente/CalendarioEsami/LookupAule.do" + "?edificioId=" + edificioId;
    xmlhttp.onreadystatechange = recuperaAule;
    xmlhttp.open("GET", url, true);
    xmlhttp.send(null);
  }

  var CMB_AULE_NAME_HIDDEN_FIELD = '#*HIDDENfIELD*#';

  function loadElencoAule(edificioId, cmbAuleName){
    var nameCmbAule = document.getElementById(CMB_AULE_NAME_HIDDEN_FIELD);
    if(!nameCmbAule){
      nameCmbAule = document.createElement('input');
      nameCmbAule.setAttribute('id', CMB_AULE_NAME_HIDDEN_FIELD);
      nameCmbAule.setAttribute('type', 'hidden');
      document.forms[0].appendChild(nameCmbAule);
    }
    nameCmbAule.value=cmbAuleName;
    doCompletionAule(edificioId);
  }

  function recuperaAule() {
    if (xmlhttp.readyState == 4) {
      var resp = xmlhttp.responseText;
      var arrayAule = eval(resp);
      var cmbAuleToUpdate = document.getElementById(CMB_AULE_NAME_HIDDEN_FIELD);
      var comboAule = document.getElementById(cmbAuleToUpdate.value);

      for( var j=comboAule.options.length;j>0;j--) {
        comboAule.options[j] = null;
      };

      for(var i=0;i<arrayAule.length;i++){
        var des = arrayAule[i].des;
        comboAule.options[i+1]=new Option(des,arrayAule[i].aula_id);
      }
    }
  }
//Salierno R. - Fine

//Salierno R. GS: 24522
function setDiffDate(data_ini,gg_diff,data_new) {

  var arrayData = data_ini.split("/");
  var my_data_ini = new Date(1900,1,1);
  var oneDay = 1000*60*60*24;

  // la trasformazione dava dei problemi con cifre del tipo 09, con lo 0 avanti
  if (arrayData[0].charAt(0)=='0') arrayData[0] = arrayData[0].substr(1,1);
  if (arrayData[1].charAt(0)=='0') arrayData[1] = arrayData[1].substr(1,1);

  my_data_ini.setMonth(parseInt(arrayData[1]) - 1);
  my_data_ini.setDate(parseInt(arrayData[0]));
  my_data_ini.setFullYear(parseInt(arrayData[2]));

  var new_date = my_data_ini.getTime() + (oneDay * gg_diff);
  var my_new_date = new Date(new_date);

  var str_new_date = "";
  if (parseInt(my_new_date.getDate())<10) str_new_date = str_new_date + "0"+my_new_date.getDate()+"/";
  else str_new_date = str_new_date + my_new_date.getDate() + "/";
  if (parseInt(my_new_date.getMonth() + 1)<10) str_new_date = str_new_date + "0"+(my_new_date.getMonth() + 1)+"/";
  else str_new_date = str_new_date + (my_new_date.getMonth() + 1) + "/";
  str_new_date = str_new_date + my_new_date.getFullYear();

  var campoData = document.getElementById(data_new);
  campoData.value = str_new_date;

}

function checkDecheck1To1(checkboxDom, idCheckboxSlave, canCheck, canDecheck)
{
  checkboxDomState = checkboxDom.checked
  checkboxSlave=document.getElementById(idCheckboxSlave)
  if(!checkboxSlave.disabled) checkboxSlave.checked = ((checkboxSlave.checked && (checkboxDomState || !canDecheck)) || (checkboxDomState && canCheck))
}

function checkDecheckAllIdNum(checkboxSelectAll, idListaCheck, num)
{
  checkboxSelectAllState = checkboxSelectAll.checked

  for (i=1; i<num+1; ++ i){
    checkBoxList=document.getElementById(idListaCheck + i)
    if(checkBoxList&&!checkBoxList.disabled) checkBoxList.checked=checkboxSelectAllState
  }
}
//funzione che seleziona/deseleziona una serie di checkbox in base al valore di un'espressione (es. voto)
function checkDecheckAllIdNumExpr(checked, idListaCheck, num, value, condition)
{
  checkboxSelectExprState = checked
  for (i=1; i<num+1; ++ i){
    checkBoxList=document.getElementById(idListaCheck + i)
    val = eval(value.replace('index',i)+condition);
    if(checkBoxList&&!checkBoxList.disabled) {
    	if(val) {
    		checkBoxList.checked=checkboxSelectExprState
    	} else {
    		checkBoxList.checked=!checkboxSelectExprState
    	}
    }
  }
}
//funzione che seleziona/deseleziona una serie di checkbox in base al valore di un'espressione (es. voto)
function checkDecheckAllIdNumExpr(checked, idListaCheck, num, value, condition)
{
  checkboxSelectExprState = checked
  for (i=1; i<num+1; ++ i){
    checkBoxList=document.getElementById(idListaCheck + i)
    val = eval(value.replace('index',i)+condition);
    if(checkBoxList&&!checkBoxList.disabled) {
    	if(val) {
    		checkBoxList.checked=checkboxSelectExprState
    	} else {
    		checkBoxList.checked=!checkboxSelectExprState
    	}
    }
  }
}
// utilizzata da RegistrazioneEsitiEsame.xsl per trasformare il voto numerico in lettere
function getVotoLettere(votoNum,arrayVoti) {
	if(votoNum=='' || votoNum=='ASS' || votoNum=='RIT') {
		return '';
	}
	if(isNaN(votoNum)||votoNum>=arrayVoti.length){
		return 'Error';
	} else{
		return arrayVoti[votoNum];
	}
}

//INIZIO SCRIPT DI GESTIONE DELL'APERTURA DEI MENU CON JAVASCRIPT
/**
 * Questo metodo permette di aprire (senza fare una richiesta) una
 * voce di menu. 
 * Requisiti: Il metodo apre (con la proprietà css display:block) i link con nome 'menusecondo'
 *			  e chiude quelli che non hanno lo stile forceOpened;
 */
function toggleMenu(menuCssId){
	//alert('toggleMenu'+menuCssId);
	var objs;
	objs = getElementsByClassName('menusecondo')
	var found = -1;
	//var selected = -1;
	for (var i=0; i<objs.length; i++) {		
		found = objs[i].className.search(menuCssId) 
		var forceOpened = isForceOpened(objs[i].className);
		if (found >= 0) {
			objs[i].style.display = "block";
		} else {
			if(! forceOpened){
				objs[i].style.display = "none";
			} 
		}
	}

}

/**
 * Funzione che permette di sapere se nella classe passata come input è presente la
 * classe css forceOpened.
 */
function isForceOpened(obj){
	containForceOpened = obj.search('forceOpened')
	if (containForceOpened >= 0) {
		return true;
	}	
	return false;
}

/**
 * Funzione che permette di sapere se nella classe passata come input è presente la
 * classe css opened.
 */
function isOpened(obj){
	var containOpened = obj.search('opened')
	if(containOpened >= 0) return true;	
	return false;
}

function dateChange(id){
	var el = scwID(id);
	if (el){
		if (el.onchange != undefined) el.onchange();
		el.focus();
	}
}

//FINE SCRIPT DI GESTIONE DELL'APERTURA DEI MENU CON JAVASCRIPT
/**
 * Funzione che permette di ottenere l'array di nody che hanno 
 * la classe css fornita come primo parametro a partire dal 
 * nodo passato come secondo parametro.
 * Se il secondo parametro è vuoto la ricerca partirà dal nodo body.
 */
function getElementsByClassName(classname, node) {
	if(!node) node = document.getElementsByTagName("body")[0];
	var a = [];
	var re = new RegExp('\\b' + classname + '\\b');
	var els = node.getElementsByTagName("*");
	for(var i=0,j=els.length; i<j; i++)
	if(re.test(els[i].className))a.push(els[i]);
	return a;

}


function selezionaServer(currSelect) {
	selIndex = currSelect.selectedIndex;
    serverToSelect = currSelect.options[selIndex].value;

	//Deseleziono le scelte precedenti
    checkServerType('JAGUAR', false);
    checkServerType('TOMCAT', false);
    checkServerType('JBOSS', false);
    
    //Seleziono solo quello scelto
    if(serverToSelect=='ALL'){
    	checkServerType('JAGUAR', true);
    	checkServerType('TOMCAT', true);
    	checkServerType('JBOSS', true);
    } else if (serverToSelect=='NOTHING') {
    	//Non faccio nullaperchè ho già deselezionato le scelte precedenti 
    }else {
    	checkServerType(serverToSelect, true);
    }

}

function getCheckedValue(radioObj) {
	if(!radioObj)
		return "";
	var radioLength = radioObj.length;
	if(radioLength == undefined)
		if(radioObj.checked)
			return radioObj.value;
		else
			return "";
	for(var i = 0; i < radioLength; i++) {
		if(radioObj[i].checked) {
			return radioObj[i].value;
		}
	}
	return "";
}

function checkServerType(serverToSelect, seleziona) {
    var inputs = document.body.getElementsByTagName("input");    
    
    var inputsForServer = getElementsByClassName(serverToSelect);
    for (var i =0; i < inputsForServer.length; i++){
		if(inputsForServer[i].type='checkbox'){
			inputsForServer[i].checked = seleziona;
		}
	}
}