<%@ include file="atsilo_files/header.jsp" ,
				 "atsilo_files/modifica_dati_account.jsp" %>

 
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
<table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
    <tr>
      <td><table border="0">
        <tbody>
          <tr>
            <td class="tplTitolo">
            <form name="creazione_account" action="<%=action %>" method="post" onsubmit="<%CambioValoreForm();%>">
        <table class="tabelle_form">
          <tr> 
        	<td>Username</td>
       	 	<td><input name="username" type="text" id="username" maxlength="16" value="<%=username %>" <%=readOnly %>  /></td>
          </tr>
          <tr> 
        	<td>Password</td>
       	 	<td><input name="password" type="text" id="password" maxlength="20" value="non visualizzabile" <%=readOnly %>  /></td>
          </tr>
          <tr> 
        	<td>Indirizzo email</td>
       	 	<td><input name="indirizzo_email" type="text" id="indirizzo_email" value="<%=email %>" <%=readOnly %>  />
       	 	  </td>
          </tr>
          <tr> 
        	<td>Profilo di appartenenza</td>
       	 	<td><input name="tipologia_genitore" type="text" id="tipologia_genitore"  value="<%=tipologia_genitore %>" <%=readOnly %>  />
       	 	  </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><strong>N.B. All'indirizzo di posta elettronica verr&agrave; inviata la ricevuta dell'iscrizione da stampare e consegnare all'ufficio secondo quando previsto nel bando</strong></td></tr>
          <tr> 
        	<td></td>
       	 	<td><input type="submit" name="modifica" value="<%=nome_bottone %> " />
                <input type="reset" name="reset" value="Annulla" />
            </td>
          </tr>
          
         </table>
        </form>
        </td>
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