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
<form>
  <table width="80%" border="0" cellspacing="0">
    <tr>
    <td colspan="4"><label for="altrifisglinido_1">Selezionare il figlio per il quale si vogliono inserire le informazioni</label>
      <br></td>
      
  </tr>
  <tr>
  <td colspan="2"><select name="select">
    <option selected>Selezionare il nome del bambino</option>
  </select></td>
     <td>&nbsp;</td>
  </tr>
  <tr>
  <tr>
    <td>Cognome</td>
    <td> <input id="cognome" value="" name="cognome" size="25" maxlength="25" type="text"></td>
    <td>Nome</td>
    <td> <input id="nome" value="" name="nome" size="25" maxlength="50" type="text"></td>
  </tr>
  <tr>
    <td>Nato/a a</td>
    <td><input id="natoa" value="" name="natoa"  size="25" maxlength="25" type="text"></td>
    <td>Nato il</td>
    <td><input id="natoil" value="" name="natoil"  size="25" maxlength="10" type="text"></td>
  </tr>
  <tr>
    <td>Codice Fiscale</td>
    <td><input id="codice_fiscale" value="" name="codice_fiscale"  size="25" maxlength="16" type="text" /></td>
    <td>Cittadinanza</td>
    <td><input id="cittadinanza" value="" name="cittadinanza"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>&nbsp; </td></tr>
     <tr>
     <td colspan="4"><input value="Salva Dati" name="salva_dati" type="submit" />
     <input value="Modifica Dati" name="modifica_dati" type="submit" />
     </td>
    
  </tr>
</table>
 
</form>

</td><!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"
 %>