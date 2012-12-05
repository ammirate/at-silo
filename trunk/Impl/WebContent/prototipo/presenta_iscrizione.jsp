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
            <td ><p>PER COMPLETARE LA DOMANDA DI ISCRIIZONE &Egrave; NECESSARIO ALLEGARE I SEGUENTI DOCUMENTI ALLA DOMANDA DA PRESENTARE IN SEGRETERIA:</p>
              <p>COPIA FRONTE/RETRO DEL DOCUMENTO DI RICONOSCIMENTO VALIDO DEL RICHIEDENTE (obbligatorio)</p>
              <p><br>
                PRIMA DELL'INVIO DELLA DOMANDA SI RACCOMANDA DI CONTROLLARE L'ESATTA COMPILAZIONE DI TUTTI I CAMPI POICHE', DOPO L'INVIO, NON SARA' POSSIBILE EFFETTUARE ALCUNA MODIFICA</p>
              <p><br>
                N.B.: Per completare l'invio della domanda &egrave; necessario compilare i seguenti campi:</p>
              <table>
              	<tr>
                	<td>Selezionare tipo di servizio desiderato</td>
                    <td>
                    <select id="servizio_selezionato" name="servizio_selezionato">
                    <option>Servizio1</option>
                    <option>Servizio1</option>	
                    </select>
                    </td>
                </tr>
                <tr>
                	<td>Inserire le vaccinazioni obbligatorie fatte</td>
                    <td>
                    <input type="text">
                    </td>
                </tr>
                <tr>
                	<td>Inserire le malattie infettive contratte</td>
                    <td><form name="form1" method="post" action="">
                      <label for="malattie_contratte"></label>
                      <textarea name="malattie_contratte" id="malattie_contratte" cols="45" rows="5"></textarea>
                  </form></td>
                </tr>
                <tr>
                	<td height="80"></td>
                </tr>
              </table>
              <p><br>
              </p></td>
            
            </tr>
            <tr>
              <td>&nbsp;</td></tr>
                <!-- Se tutti i dati sono stati compilati correttamente e non è scaduto il bando, il tasto PRESENTA DOMANDA ISCRIZIONE sarà abilitato, altrimenti sarà disabled-->
             <tr>
            <td ><form name="presenta_domanda_iscrizione" action="" method="post" nSubmit="return confirm('Presentando la domanda ora non potrai più modificare i tuoi dati.Sei sicuro di volerla presentare? ');">
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