
<%@
	include file="atsilo_files/header.jsp"
%>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="breadcrumb " align="left"><p> </a></p>
  <p>&nbsp;</p></td>
</tr>
</tbody></table>

<%--include sidebar a seconda del chiamante
 <%@ 
include file="atsilo_files/autoinclude_sidebar_giusta_tipologia.jsp"
 %>
 --%>
 

 <form>
<table border="0" cellspacing="0">
  <tr>
    <td colspan="4">Selezionare la tipologia di utente da ricercare</td>
  </tr>
    <tr>
    <td colspan="4">
    				<select>
    				  <option value="genitori">Genitori</option>
    				  <option value="personale">Personale </option>
                    </select>
    </td>
  </tr>
</table>
</form>
<%-- Include form ricerca a seconda del chiamante e della scelta del personale da visualizzare 
<-%@ 
include file="atsilo_files/form_ricerca_personale.jsp" 
 %>
 --%>
 <%@
include file="atsilo_files/form_ricerca_genitore.jsp"
 %>
 
<%@
include file="atsilo_files/footer.jsp"
 %>
</body>
</html>