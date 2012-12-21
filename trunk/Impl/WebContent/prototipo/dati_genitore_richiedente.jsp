<%@
	include file="atsilo_files/header.jsp"
%>
<!--Prende i dati del genitore -->
<%@ page import="atsilo.application.*,atsilo.entity.*"
 %>
 <%
 	ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
    	Utente utente=cdt.getValoriUtente(username);//restituisce l'utente associato a quello username. (Utente generalizza le varie tipologie di utenti)
    	String tipologia_genitore=cdt.getDatiGenitore(utente.getCodiceFiscale()).getTipo();
 %>
 <!--Script per gestire i form -->
 <script type="text/javascript">
function settaAttributi(slf){
	 document.getElementById("dati_bando").setAttribute("action","http://localhost:8080/Atsilo/ServletCompilazioneDatiBando");
	 document.getElementById("bottone_submit").setAttribute("value","Salva");
	 var f = document.forms[0];
	 var n = f.elements.length;
	 for(var i = 1; i < n; i++)
		 document.forms[0].elements[i].removeAttribute("readonly");
	 document.getElementById("codiceFiscale").setAttribute("readonly","readonly");
	 document.getElementById("day").setAttribute("readonly","readonly");
	 document.getElementById("month").setAttribute("readonly","readonly");
	 document.getElementById("bott_calendario").disabled=false;
	 document.getElementById("rapportoParentela").disabled=false;
	 document.getElementById("status_lavorativo").disabled=false;
	 
	 
	 slf.onclick=null;
	 return false;
	 
}
</script>	
<%
	if ( request.getParameter("successo") != null) { 
		if (request.getParameter("successo").equals("ok")) {
			out.print("<script type=text/javascript>alert('Modifica effettuata con successo');window.location='"+temp_nome_chiamante+"';</script>");
		}
		else {
			out.print("<script type=text/javascript>alert('Modifica fallita');window.location='"+temp_nome_chiamante+"';</script>");
		}
	}
%>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="breadcrumb " align="left"><p> </a></p>
  <p>&nbsp;</p></td>
</tr>
</tbody></table>
<%@
include file="atsilo_files/sidebar_genitore.jsp"
 %>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<%@
include file="atsilo_files/sidebar_top_genitore.jsp"
 %>
 
<!--A seconda del tipo di genitore sara'  incluso il file con il form dati adeguato -->

<% if ( tipologia_genitore.equals("personale_studenti") ) { %>
  <%@include file="atsilo_files/dati_genitore_richiedente_personale.jsp"%>
<% } else if ( tipologia_genitore.equals("residenti_fisciano")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_residenti_fisciano.jsp"%>
<% } else if ( tipologia_genitore.equals("altro")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_altro.jsp"%>
   <% } %>


</td><!--Chiudi content -->

<%@
include file="atsilo_files/footer.jsp"
 %>




</body>
</html>