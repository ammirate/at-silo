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
include file="atsilo_files/sidebar_top_bambino.jsp"
 %>
<%@ page import="atsilo.application.*,atsilo.entity.*,java.util.*"
 %>
<%
		ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
	   	Utente utente=cdt.getValoriUtente(username);
	  	Genitore genitore_richiedente=cdt.getDatiGenitore(utente.getCodiceFiscale());//genitore richiedente
	  	List<Bambino> figli= new ArrayList<Bambino>();
	  	figli= cdt.getFigli(genitore_richiedente.getCodiceFiscale());
	  	
	  	
	  	
	  	
	    	for (int i=0;i<figli.size();i++){
	%> <script type=text/javascript>

  	   		  objSelect = document.getElementById("select_bambini"); 
  	   	     objSelect.option[<%=i%>]=new Option("Selezionare il bambino", "", true)
  	  		 objSelect.optionsg[<%=i+1%>] = new Option('<%=figli.get(i).getNome()%>','<%=figli.get(i).getCodiceFiscale()%>');
							
	</script> 
	<%} %>
  <!--Script per gestire i form -->
 <script type="text/javascript">
function settaAttributi(slf){
	 document.getElementById("dati_bando").setAttribute("action","http://localhost:8080/Atsilo/ServletCompilazioneDatiBando");
	 document.getElementById("bottone_submit").setAttribute("value","Salva");
	 var f = document.forms[0];
	 var n = f.elements.length;
	 for(var i = 1; i < n; i++)
		 document.forms[0].elements[i].removeAttribute("readonly");
	 slf.onclick=null;
	 return false;
	 
}
</script>	
<%
	if ((request.getParameter("successo")) != null) {
		if (request.getParameter("successo").equals("ok")) {
			out.print("<script type=text/javascript>alert('Modifica effettuata con successo')</script>");
		}
		else {
			out.print("<script type=text/javascript>alert('Modifica fallita. Compila correttamente i campi')</script>");
		}
	}
%>
<form id="dati_bando" name="dati_bando" action="" method="post" >
<input name="chiamante" type="hidden" id="chiamante" value="bambino">
  <table width="80%" border="0" cellspacing="0">
  <tr>
    <td>&nbsp; </td></tr>
    <tr>
    <td colspan="4"><label for="altrifisglinido_1">Selezionare il figlio per il quale si vogliono inserire le informazioni</label>
      <br></td>
      
  </tr>
  <tr>
  <td colspan="2"><select name="select_bambini">
    <option selected>Selezionare il nome del bambino</option>
    <option value="nuovo">Aggiungere bambino</option>
  </select></td>
     <td>&nbsp;</td>
  </tr>
  <tr>
  <tr>
    <td>Cognome</td>
    <td> <input id="cognome_bambino" value="" name="cognome_bambino" size="25" maxlength="25" type="text"></td>
    <td>Nome</td>
    <td> <input id="nome_bambino" value="" name="nome_bambino" size="25" maxlength="50" type="text"></td>
  </tr>
  <tr>
    <td>Nato/a a</td>
    <td><input id="comune_nascita_bambino" value="" name="comune_nascita_bambino"  size="25" maxlength="25" type="text"></td>
    <td>Nato il</td>
    <td><input id="data_nascita_bambino" value="" name="data_nascita_bambino"  size="25" maxlength="10" type="text"></td>
  </tr>
  <tr>
    <td>Codice Fiscale</td>
    <td><input id="codice_fiscale_bambino" value="" name="codice_fiscale_bambino"  size="25" maxlength="16" type="text" /></td>
    <td>Cittadinanza</td>
    <td><input id="cittadinanza_bambino" value="" name="cittadinanza_bambino"  size="25" maxlength="25" type="text" /></td>
  </tr>
  <tr>
    <td>&nbsp; </td></tr>
<tr>
				<td></td>
				<td><input type="submit" name="bottone_submit"
					id="bottone_submit" value="Modifica"
					onClick="return settaAttributi(this)" /> <input type="reset"
					name="reset" value="Annulla" /></td>
			</tr>
</table>
 
</form>

</td><!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"
 %>