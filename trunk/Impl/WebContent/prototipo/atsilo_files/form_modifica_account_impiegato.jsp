<script type="text/javascript">
function risettaAttributi(slf){
	alert("fgd");
	 document.getElementById("modifica_account").setAttribute("action","http://localhost:8080/Atsilo/ServletModificaDatiAccount");
	 document.getElementById("password").removeAttribute("readonly");
	 document.getElementById("indirizzo_email").removeAttribute("readonly");
	 document.getElementById("bottone_submit").setAttribute("value","Salva");
	 slf.onclick=null;
	 return false;
}
</script>	
<%
	if (request.getParameter("successo") != null && !temp_nome_chiamante.equals("account_delegato_rettore.jsp")  && !temp_nome_chiamante.equals("account_delegato_sciform.jsp")  && !temp_nome_chiamante.equals("account_educatore.jsp")  && !temp_nome_chiamante.equals("account_impiegato.jsp")  && !temp_nome_chiamante.equals("account_impiegato_bando.jsp") ) {
		if (request.getParameter("successo").equals("ok")) {
			out.print("<script type=text/javascript>alert('Modifica effettuata con successo')</script>");
		}
		else {
			out.print("<script type=text/javascript>alert('Modifica fallita. Compila correttamente i campi')</script>");
		}
	}
%>
   <form id="modifica_account" name="modifica_account" action="" method="post" >
        <table class="tabelle_form">
          <tr> 
        	<td>Username</td>
       	 	<td><input name="username" type="text" id="username" maxlength="16" value="<%=username %>" readonly="readonly"  /></td>
          </tr>
          <tr> 
        	<td>Password</td>
       	 	<td><input name="password" type="text" id="password" maxlength="20" value="******" readonly="readonly"   /></td>
          </tr>
          <tr> 
        	<td>Indirizzo email</td>
       	 	<td><input name="indirizzo_email" type="text" id="indirizzo_email" value="<%=email %>" readonly="readonly"   /> </td>
          </tr>
          <tr>
        	<td></td>
       	 	<td><input type="submit" name="bottone_submit" id="bottone_submit" value="Modifica" onClick="return risettaAttributi(this)"/>
                <input type="reset" name="reset" value="Annulla" />
            </td>
          </tr>
          
         </table>
        </form>