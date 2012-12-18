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
 <%
 	if ((request.getParameter("successo")) != null) {
 		if (request.getParameter("successo").equals("ok")) {
 			out.print("<script type=text/javascript>alert('Modifica effettuata con successo')</script>");
 		} else {
 			out.print("<script type=text/javascript>alert('Modifica fallita. Compila correttamente i campi')</script>");
 		}
 	}
 %>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
  
    <tr>
      <td><table border="0">
        <tbody>
      	
          <tr>
            <td ><p>IL COMPLETAMENTO DELLA DOMANDA &Egrave; OBBLIGATORIO PER COMPLETARE L'ISCRIZIONE DOPO LA PUBBLICAZIONI DELLE GRADUATORIE.
              </p>
              <p><br>
                PRIMA DELL'INVIO DELLA DOMANDA SI RACCOMANDA DI CONTROLLARE L'ESATTA COMPILAZIONE DI TUTTI I CAMPI POICHE', DOPO L'INVIO, NON SARA' POSSIBILE EFFETTUARE ALCUNA MODIFICA</p>
              <p><br>
                N.B.: Per completare l'invio della domanda &egrave; necessario compilare i seguenti campi:</p>
               
            <form name="presenta_domanda_iscrizione" action="http://localhost:8080/Atsilo/ServletIscrizioneBambino" method="post" onSubmit="return confirm('Presentando la domanda ora non potrai pi&uacute; modificare i tuoi dati.Sei sicuro di volerla presentare? ');">
            
                <input name="chiamante" type="hidden" id="chiamante"
			value="iscrizione_completa">
              <table>
                  <tr>
    				<td colspan="4"><label for="altrifisglinido_1">Selezionare il figlio per il quale si vogliono inserire le informazioni</label>
     				 <br>
                    </td>
      
  					</tr>
 					 <tr>
 				 <td colspan="2">
                 <select name="select_bambini" id="select_bambini">
  				  <option selected>Selezionare il nome del bambino</option>
 					</select></td>
  				   <td>&nbsp;</td>
  					</tr>
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
                    <td><textarea name="vaccinazioni" id="vaccinazioni" cols="45" rows="5"></textarea></td>
                </tr>
                <tr>
                	<td>Inserire le malattie infettive contratte</td>
                    <td>
                      <label for="malattie_contratte"></label>
                      <textarea name="malattie_contratte" id="malattie_contratte" cols="45" rows="5"></textarea>
                 </td>
                </tr>
                <tr>
                	<td height="80"><input type="submit" value="Invio Domanda Iscrizione"  ></td>
                </tr>
              </table>
               </form>
               <p><br>
          </p></td>
            
            </tr>
                <!-- Se tutti i dati sono stati compilati correttamente e non è scaduto il bando, il tasto PRESENTA DOMANDA ISCRIZIONE sarà abilitato, altrimenti sarà disabled-->
          </tbody>
        </table></td>
            </tr>
          
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