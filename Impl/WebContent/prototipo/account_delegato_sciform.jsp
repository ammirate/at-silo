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
include file="atsilo_files/sidebar_scienzeformazione.jsp"
 %>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff"><table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
    <tr>
      <td><table border="0">
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
        	<td>&nbsp;</td>
       	 	<td>&nbsp;</td>
          </tr>
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

  </tbody>
</table>
</td><td class="fasciadxvariabile"></td>
</tr>
<%@
include file="atsilo_files/footer.jsp"
 %>
</body>
</html>