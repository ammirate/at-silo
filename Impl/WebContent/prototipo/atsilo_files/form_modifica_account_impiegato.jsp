<form name="creazione_account" action="<%=action %>" method="post" onsubmit="CambioValoreForm();">
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
        	<td>&nbsp;</td>
       	 	<td>&nbsp;</td>
          </tr>
        	<td></td>
       	 	<td><input type="submit" name="modifica" value="<%=nome_bottone %> " />
        
                <input type="reset" name="reset" value="Annulla" />
            </td>
          </tr>
          
         </table>
        </form>