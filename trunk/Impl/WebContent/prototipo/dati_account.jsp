<%@
	include file="atsilo_files/header_dinamico.jsp"
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
<table width="100%">
<tbody><tr>
<td>
<tbody><tr>
<td align="center" height="0" nowrap="true" class="stepprimoselhbar"><a href="#">Dati account</a></td>
<td align="center" height="0" nowrap="true" class="stepprimohbar"><a href="dati_genitore_richiedente.jsp">Dati genitore richiedente</a></td>
<td align="center" height="0" nowrap="true" class="stepprimohbar"><a href="dati_genitore_nonrichiedente.jsp">Dati genitore non richiedente</a></td>
<td align="center" height="0" nowrap="true" class="stepprimohbar"><a href="sitauzione_familiare.jsp">Sitazione familiare</a></td>
<td align="center" height="0" nowrap="true" class="stepprimohbar"><a href="sitauzione_reddituale.jsp">Situazione reddituale</a></td>
</tr>

</tbody></table>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
    <tr>
      <td><table cellspacing="0" cellpadding="0" border="0">
        <tbody>
          <tr>
            <td class="tplTitolo"><form name="creazione_account" action="" method="post">
        <table class="tabelle_form">
          <tr> 
        	<td>Username</td>
       	 	<td><input name="username" type="text" id="username" maxlength="16" readonly="readonly"  /></td>
          </tr>
          <tr> 
        	<td>Password</td>
       	 	<td><input name="password" type="text" id="password" maxlength="20"  /></td>
          </tr>
          <tr> 
        	<td>Indirizzo email</td>
       	 	<td><input name="indirizzo_email" type="text" id="indirizzo_email"  />
       	 	  *</td>
          </tr>
          <tr> 
        	<td>Profilo di appartenenza</td>
       	 	<td><select disabled="disabled">
       	 	  <option value="personale" selected="selected">Personale e studenti dell'Ateneo</option>
       	 	  <option value="fisciano">Residenti nel Comune di Fisciano</option>
       	 	  <option value="altri">Altre tipologie di utenze</option>
            </select></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><strong>N.B. All'indirizzo di posta elettronica verrà inviata la ricevuta dell'iscrizione da stampare e consegnare all'ufficio secondo quando previsto nel bando</strong></td></tr>
          <tr> 
        	<td></td>
       	 	<td><input type="submit" name="modifica" value="Modifica dati " />
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
    <tr>
      <td class="tplHeader">&nbsp;</td>
    </tr>
  </tbody>
</table>
<p>&nbsp;</p></td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>
</td>
<td class="fasciadxvariabile"></td>
</tr>
<tr>
<td class="bottom" width="209">&nbsp;2012 © Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>