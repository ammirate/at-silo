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
<table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
    <tr>
      <td><table border="0">
        <tbody>
      	    <tr>
    <td colspan="4"><label for="altrifisglinido_1">Selezionare il figlio per il quale si vuole inviare la domanda di iscrizione</label>
      <br></td>
      
  </tr>
  <tr>
  <td colspan="2"><select name="select">
    <option selected>Selezionare il nome del bambino</option>
  </select></td>
     <td>&nbsp;</td>
  </tr>
          <tr>
            <td >Si ricorda che per presentare la domanda di iscrizione &egrave; necessario aver compilato tutti i campi relativi a Dati Account e Dati Bambino ed &egrave; obbligatorio l'invio della stessa entro i termini indicati dal bando.</td>
            
            </tr>
            <tr>
              <td>&nbsp;</td></tr>
                <!-- Se tutti i dati sono stati compilati correttamente e non &egrave; scaduto il bando, il tasto PRESENTA DOMANDA ISCRIZIONE sarà abilitato, altrimenti sarà disabled-->
             <tr>
            <td ><form name="presenta_domanda_bando" action="" method="post" nSubmit="return confirm('Presentando la domanda ora non potrai più modificare i tuoi dati.Sei sicuro di volerla presentare? ');">
            	<input type="submit" value="Invio Domanda Iscrizione"  >
            </form></td>
            
            </tr>
          </tbody>
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