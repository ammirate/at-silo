<%@ include file="atsilo_files/header.jsp" %>
<%@ include file="atsilo_files/modifica_dati_account.jsp" %>

<script type="text/javascript">
function settaAttributi(slf){
	 document.getElementById("modifica_account").setAttribute("action","http://localhost:8080/Atsilo/ServletModificaDatiAccount");
	 document.getElementById("password").removeAttribute("readonly");
	 document.getElementById("indirizzo_email").removeAttribute("readonly");
	 document.getElementById("bottone_submit").setAttribute("value","Salva");
	 slf.onclick=null;
	 return false;
}
</script>	
<%
	if  (request.getParameter("successo") != null )  { 
		if (request.getParameter("successo").equals("ok")) {
			out.print("<script type=text/javascript> alert('Modifica effettuata con successo');window.location='"+temp_nome_chiamante+"';</script>");
		}
		else {
			out.print("<script type=text/javascript>alert('Modifica fallita. Compila correttamente i campi');window.location='"+temp_nome_chiamante+"';</script>");
		}
	}
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
include file="atsilo_files/sidebar_top_genitore.jsp"
 %>
<table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
    <tr>
      <td><table border="0">
        <tbody>
          <tr>
            <td class="tplTitolo">
            <form id="modifica_account" name="modifica_account" action="" method="post" >
        <table class="tabelle_form">
          <tr> 
        	<td>Username</td>
       	 	<td><input name="username" type="text" id="username" maxlength="16" value="<%=username %>" readonly="readonly"  /></td>
          </tr>
          <tr> 
        	<td>Password</td>
       	 	<td><input name="password" type="text" id="password" maxlength="20" value="******" readonly="readonly" /></td>
          </tr>
          <tr> 
        	<td>Indirizzo email</td>
       	 	<td><input name="indirizzo_email" type="text" id="indirizzo_email" value="<%=email %>" readonly="readonly"   /> </td>
          </tr>
          <tr> 
        	<td>Profilo di appartenenza</td>
       	 	<td><input name="tipologia_genitore" type="text" id="tipologia_genitore"  value="<%=tipologia_utente %>" readonly="readonly"  />
       	 	  </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><strong>N.B. All'indirizzo di posta elettronica verr&agrave; inviata la ricevuta dell'iscrizione da stampare e consegnare all'ufficio secondo quando previsto nel bando</strong></td></tr>
          <tr> 
        	<td></td>
       	 	<td><input type="submit" name="bottone_submit" id="bottone_submit" value="Modifica" onClick="return settaAttributi(this)"/>
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