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
include file="atsilo_files/sidebar_top_iscrizione.jsp"
 %>
<%@ page
		import="java.util.*,atsilo.application.*,atsilo.entity.*"%>
 <% // setto select bambino
		ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
	   	Utente utente=cdt.getValoriUtente(username);
	  	Genitore genitore_richiedente=cdt.getDatiGenitore(utente.getCodiceFiscale());//genitore richiedente
	  	List<Bambino> figli= new ArrayList<Bambino>();
	  	figli= cdt.getFigli(genitore_richiedente.getCodiceFiscale()); //lista dei figli idonei 
	  	%>

	
<table cellspacing="10" cellpadding="0" border="0" width="100%">
        <tr>
 				 <td >
                 <%
                 	if (figli.size() > 0) {
                 		out.print("<select name='select_bambini' id='select_bambini'><option value='null' >Selezionare Bambino</option>");

                 		for (int i = 0; i < figli.size(); i++) {

                 			out.print("<option value='"
                 					+ figli.get(i).getCodiceFiscale() + " >"
                 					+ figli.get(i).getNome() + "</option>");
                 		}
                 	} else {
                 		out.print("<em><b>E' necessario inserire un bambino</b></em>");
                 		return;
                 	}
                 %>
						</select></td>
  				   <td>&nbsp;</td>
  					</tr>
          <tr>
            <td >Stato iscrizione: Domanda non inviata</td>
            
            </tr>
             <tr>
            <td >Stato pagamenti: Tassa iscrizione non pagata</td>
            
            </tr>

</table>
</td><td class="fasciadxvariabile"></td>
</tr>
<%@
include file="atsilo_files/footer.jsp"
 %>

</body>
</html>