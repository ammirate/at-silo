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
include file="atsilo_files/sidebar_index.jsp"
 %>


<br>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
<div class="titolopagina">Accesso ai servizi dell'Asilo nido</div>
</td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">
	<div id="FormCreazioneAccount">
    
    	<form name="creazione_account" action="" method="post">
        <table class="tabelle_form">
          <tr> 
        	<td>Codice Fiscale</td>
       	 	<td><input name="cf" type="text" maxlength="16"  /></td>
          </tr>
          <tr> 
        	<td>Cognome</td>
       	 	<td><input name="cognome" type="text" id="cognome" maxlength="20"  /></td>
          </tr>
          <tr> 
        	<td>Nome</td>
       	 	<td><input name="nome" type="text" id="nome" maxlength="25"  /></td>
          </tr>
          <tr> 
        	<td>Indirizzo email</td>
       	 	<td><input name="indirizzo_email" type="text" id="indirizzo_email"  />
       	 	*</td>
          </tr>
           <tr> 
        	<td>Numero Cellulare</td>
       	 	<td><input name="num_cellulare" type="text" id="num_cellulare" maxlength="15"  /></td>
          </tr>
          <tr> 
        	<td>Selezionare profilo di appartenenza</td>
       	 	<td><select>
       	 	  <option value="personale" selected="selected">Personale e studenti dell'Ateneo</option>
       	 	  <option value="fisciano">Residenti nel Comune di Fisciano</option>
       	 	  <option value="altri">Altre tipologie di utenze</option>
            </select></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><strong>N.B. A questo indirizzo di posta elettronica verranno inviate le credenziali di accesso</strong></td></tr>
          <tr> 
        	<td></td>
       	 	<td><input type="submit" name="invia" value="Registrati"  onclick="parent.location.href='dati_account_genitore.jsp'" />
                <input type="reset" name="reset" value="Reset" />
            </td>
          </tr>
          
         </table>
        </form>
        
    </div>



</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="tplTitolo"><b> </b></td>
</tr>
</tbody></table>
</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td>
<table width="598" cellspacing="0" cellpadding="0" border="0"></table>
</td>
</tr>
<tr>
<td><img border="0" alt="" height="20" width="1" src="atsilo_files/clearpixel.gif"></td>
</tr>
</tbody></table>
</td>
</tr>
<tr>
<td class="tplHeader"></td>
</tr>
</tbody></table>
</td>
<%@
include file="atsilo_files/footer.jsp"
 %>


</body>
</html>