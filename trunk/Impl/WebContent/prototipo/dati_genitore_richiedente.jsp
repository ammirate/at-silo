<%@
	include file="atsilo_files/header.jsp"
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
 
<!--A seconda del tipo di genitore sarà incluso il file con il form dati adeguato -->
<%@
include file="atsilo_files/dati_genitore_richiedente_personale.jsp"
 %>

</td><!--Chiudi content -->

<%@
include file="atsilo_files/footer.jsp"
 %>




</body>
</html>