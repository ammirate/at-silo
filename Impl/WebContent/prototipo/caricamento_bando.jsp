<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
include file="atsilo_files/sidebar_impiegato.jsp"
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
        	<td colspan="2"><p>Selezionare il pdf del bando da caricare sul sito</p>
        	  <p>&nbsp;</p></td>
       	 	
          </tr>
          <tr> 
        	<td colspan="2"><input name="password" type="file" id="password" maxlength="20"  /></td>
       	 	
          </tr>
         
          <tr> 
        	
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