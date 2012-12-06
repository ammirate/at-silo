<%@
	include file="atsilo_files/header.jsp"
%>
<!--Prende i dati del genitore -->
<%@ page import="atsilo.test.application.*,atsilo.entity.*"
 %>
 <% 
	ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
 	Utente utente=cdt.getUtenteFromUsername(username);
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
	 document.getElementById("codice_fiscale_genitore_richiedente").setAttribute("readonly","readonly");
	 
	 slf.onclick=null;
	 return false;
	 
}
</script>	
<%
	if ((request.getParameter("successo")) != null) {
		if (request.getParameter("successo").equals("ok")) {
			out.print("<script type=text/javascript>alert('Modifica effettuata con successo')</script>");
		}
		else {
			out.print("<script type=text/javascript>alert('Modifica fallita. Compila correttamente i campi')</script>");
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

<% if ( tipologia_genitore.equals("personale") ) { %>
  <%@include file="atsilo_files/dati_genitore_richiedente_personale.jsp"%>
<% } else if ( tipologia_genitore.equals("residenti_fisciano")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_residenti_fisciano.jsp"%>
<% } else if ( tipologia_genitore.equals("altro")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_altro.jsp"%>
   <% } %>

<%@
include file="atsilo_files/dati_genitore_richiedente_personale.jsp"
 %>

</td><!--Chiudi content -->

<%@
include file="atsilo_files/footer.jsp"
 %>




</body>
</html>