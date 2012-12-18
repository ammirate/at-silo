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
 <%@ page import="atsilo.application.*,atsilo.entity.*,java.util.*"%>

	<%
		// istanzio variabili per stato iscriizone
			ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
	 		ControlIscrizione cisc= ControlIscrizione.getIstance();
		   	Utente utente=cdt.getValoriUtente(username);
		  	Genitore genitore_richiedente=cdt.getDatiGenitore(utente.getCodiceFiscale());//genitore richiedente
		  	List<Bambino> figli= new ArrayList<Bambino>();
		  	figli= cdt.getFigli(genitore_richiedente.getCodiceFiscale()); //lista dei figli
	%> 
<table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
    <tr>
      <td><table border="0">
        <tbody>
          <tr>
            <td >Stato iscrizione: Domanda non inviata</td>
            
            </tr>
             <tr>
            <td >Stato pagamenti: Tassa iscrizione non pagata</td>
            
            </tr>
          </tbody>
        </table></td>
    </tr>
    <tr>
      <td><table cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td><table width="598" cellspacing="0" cellpadding="0" border="0">
            </table></td>
          </tr>
          <tr>
            <td><img border="0" alt="" height="20" width="1" src="atsilo_files/clearpixel.gif" /></td>
          </tr>
        </tbody>
      </table></td>
    </tr>

  </tbody>
</table>
</td><td class="fasciadxvariabile"></td>
</tr>
<%@
include file="atsilo_files/footer.jsp"
 %>



</body>
</html>