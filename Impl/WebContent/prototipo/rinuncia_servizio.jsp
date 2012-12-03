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
<form name="rinuncia" method="post" onSubmit="return confirm('Sei sicuro di voler cancellare la tua iscrizione all asilo? ');">
  <table width="80%" border="0" cellspacing="0">
    <tr>
    <td colspan="4"><label for="altrifisglinido_1">Selezionare il figlio per il quale si vuole fare richiesta di rinuncia all'iscrizione<br>
    </label>
      <br></td>
      
  </tr>
  <tr>
  <td colspan="2"><select name="select">
    <option selected>Selezionare il nome del bambino</option>
  </select></td>
     <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    
  </tr>
  <tr>
    <td><input type="submit" value="Rinuncia all'iscrizione" ></td>
    
  </tr>
</table>
 
</form>

</td><!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"
 %>