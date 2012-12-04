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