<%@
	include file="atsilo_files/header.jsp"%>
<table width="100%" cellspacing="0" cellpadding="0" border="0">
	<tbody>
		<tr>
			<td class="breadcrumb " align="left"><p>
					</a>
				</p>
				<p>&nbsp;</p></td>
		</tr>
	</tbody>
</table>
<%@
include file="atsilo_files/sidebar_genitore.jsp"%>
<img width="209" border="0" alt="" height="1"
	src="atsilo_images/clearpixel.gif">
</td>
<td class="content" valign="top" bgcolor="#ffffff"><%@
include
		file="atsilo_files/sidebar_top_bambino.jsp"%>
	<%@ page import="atsilo.application.*,atsilo.entity.*,java.util.*"%>
	<%
		// setto select bambino
			ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
		   	Utente utente=cdt.getValoriUtente(username);
		  	Genitore genitore_richiedente=cdt.getDatiGenitore(utente.getCodiceFiscale());//genitore richiedente
		  	List<Bambino> figli= new ArrayList<Bambino>();
		  	figli= cdt.getFigli(genitore_richiedente.getCodiceFiscale()); //lista dei figli
	%> 
     <script>
		function submitForm() {
			document.forms[0].submit();
		}
	</script>
       <!--Script per resettare campi --> 
  <script>
  function resetForm(){
 
  }
  </script>
     <%
 	//setta campi form una volta selezionato il nome del bambino
 	  String cfb=null;
 		String cognome="";
 		String nome="";
 		String codiceFiscale="";
 		String dataNascita="dataNascita" ;
  	    String comuneNascita=""; 
 		String cittadinanza=""; 
 		
 	 if (request.getParameter("select_bambini")!=null)
 	  cfb=(String)request.getParameter("select_bambini");
 	  cdt=ControlDatiPersonali.getIstance();
 	 Genitore genitore=new Genitore();
 	 
 	 if (cfb!=null && ! cfb.equals("null")){ 
 		Bambino bambino_selezionato=new Bambino();
    	bambino_selezionato=cdt.getDatiBambino(cfb);
 		cognome=bambino_selezionato.getCognome(); 
 		nome=bambino_selezionato.getNome();
 		codiceFiscale=bambino_selezionato.getCodiceFiscale(); 
 		dataNascita="dataNascita" ;
  	    comuneNascita=bambino_selezionato.getComuneNascita(); 
 		cittadinanza=bambino_selezionato.getcittadinanza(); 

 	 }
 %> <!--Script per gestire i form --> <!--Script per gestire i form -->
	<script type="text/javascript">
		function settaAttributi(slf) {
			document
					.getElementById("dati_bando")
					.setAttribute("action",
							"http://localhost:8080/Atsilo/ServletCompilazioneDatiBando");
			document.getElementById("bottone_submit").setAttribute("value",
					"Salva");
			document.getElementById("bottone_submit").setAttribute("onClick",
					"return  controlloAndSubmit(this)");		
			var f = document.forms[0];
			var n = f.elements.length;
			for ( var i = 1; i < n; i++)
				document.forms[0].elements[i].removeAttribute("readonly");
			document.getElementById("select_bambini").removeAttribute(
					"onChange", "");
			//slf.onclick = null;
			return false;
		}
	</script>
    <script>
	function controlloAndSubmit(slf){
		if ( (document.getElementById("codice_fiscale_bambino").value).length!=16)
			alert("Controllare la correttezza dei campi");
		else
		document.forms[0].submit();
	}
		
	</script>
     <%
 	if ((request.getParameter("successo")) != null) {
 		if (request.getParameter("successo").equals("ok")) {
 			out.print("<script type=text/javascript>alert('Modifica effettuata con successo')</script>");
 		} else {
 			out.print("<script type=text/javascript>alert('Modifica fallita. Compila correttamente i campi')</script>");
 		}
 	}
 %>
	<form id="dati_bando" name="dati_bando" action="" method="post">
		<input name="chiamante" type="hidden" id="chiamante" value="bambino">
		<table width="80%" border="0" cellspacing="0">
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="4"><label for="altrifisglinido_1">Selezionare
						il figlio per il quale si vogliono inserire le informazioni</label> <br></td>

			</tr>
			<tr>
				<td colspan="2"><select name="select_bambini" id="select_bambini"
							onfocus="popolaSelect(this)" onchange="submitForm()">
							<% out.print("<option value='null' >Selezionare Bambino</option>");
						String selected="";
						if(figli!=null)
						{
							  for (int i=0;i<figli.size();i++){
								  if (figli.get(i).getCodiceFiscale().equals(cfb))
									  selected="selected";
							  out.print("<option value='"+figli.get(i).getCodiceFiscale()+"'"+selected+" >"+figli.get(i).getNome()+"</option>");
							  }
						}
						%>
						</select></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
			<tr>
				<td>Cognome</td>
				<td><input name="cognome_bambino" type="text"
					id="cognome_bambino" value="<%=cognome%>" size="25" maxlength="25"
					readonly="readonly"></td>
				<td>Nome</td>
				<td><input name="nome_bambino" type="text" id="nome_bambino"
					value="<%=nome%>" size="25" maxlength="50" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Nato/a a</td>
				<td><input name="comune_nascita_bambino" type="text"
					id="comune_nascita_bambino" value="<%=comuneNascita%>" size="25" maxlength="25"
					readonly="readonly"></td>
				<td>Nato il</td>
				<td><input name="data_nascita_bambino" type="text"
					id="data_nascita_bambino" value="<%=dataNascita%>" size="25" maxlength="10"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>Codice Fiscale</td>
				<td><input name="codice_fiscale_bambino" type="text"
					id="codice_fiscale_bambino" value="<%=codiceFiscale%>" size="25" maxlength="16"
					readonly="readonly" /></td>
				<td>Cittadinanza</td>
				<td><input name="cittadinanza_bambino" type="text"
					id="cittadinanza_bambino" value="<%=cittadinanza%>" size="25" maxlength="25"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="button" name="bottone_submit"
					id="bottone_submit" value="Modifica"
					onClick="return settaAttributi(this)" /> <input type="reset"
					name="reset" value="Annulla" /></td>
			</tr>
		</table>

	</form></td>
<!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"%>