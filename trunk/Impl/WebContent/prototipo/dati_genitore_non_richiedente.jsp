<%@page import="java.util.ArrayList"%>
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
<td class="content" valign="top" bgcolor="#ffffff"><%@
include
		file="atsilo_files/sidebar_top_genitore.jsp"%>
	<!--Dati genitore non richiedente--> <%@ page
		import="java.util.*,atsilo.application.*,atsilo.entity.*"%>
		<%//instanzion variabili
		String cognome="";
		String nome="";
		String codiceFiscale="";
		String dataNascita="" ;
 	 	String comuneNascita="";
 	 	String cittadinanza="";
 	 	String indirizzoResidenza="";
		String numeroCivicoResidenza="";
		String capResidenza="";
		String 	comuneResidenza="";
		String provinciaResidenza="";
		String indirizzoDomicilio="";
		String numeroCivicoDomicilio="";
		String capDomicilio="";
		String comuneDomicilio=""; 
		String provinciaDomicilio="";
		String rapportoParentela="";
		String condizioneLavorativa="";
		String tipoContratto="";
		String sedeDiLavoro="";
		
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
  	   		//prove  
  	   		with ( objSelect.elements["select_bambini"] )
            {
              options.length          = 0;
              options[options.length] = new Option( "Testo #1", "Valore_1", false, false );
              options[options.length] = new Option( "Testo #2", "Valore_2", false, false );
              options[options.length] = new Option( "Testo #3", "Valore_3", false, false );
            }
  	   		  
  	   	     objSelect.option[<%=i%>]=new Option("Selezionare il bambino", "", true)
  	  		 objSelect.optionsg[<%=i+1%>] = new Option('<%=figli.get(i).getNome()%>','<%=figli.get(i).getCodiceFiscale()%>');
							
	</script> 
	<%} %>
	 <%!
    void SettaCampiForm(String cf){
	 ControlDatiPersonali cdt=ControlDatiPersonali.getIstance();
	 Genitore genitore=new Genitore();
	if (cf!=null){ 
		Bambino bambino_selezionato=new Bambino();
		
   		bambino_selezionato=cdt.getDatiBambino(cf);
   	    genitore=cdt.getDatiGenitore(bambino_selezionato.getGenitoreNonRichiedente().getCodiceFiscale());
		        
	}
   		
		String cognome=genitore.getCognome(); 
		String nome=genitore.getNome();
		String codiceFiscale=genitore.getCodiceFiscale(); String
		dataNascita="dataNascita" ;
 	 	String comuneNascita=genitore.getComuneNascita(); String
		cittadinanza=genitore.getcittadinanza(); String
		indirizzoResidenza=genitore.getIndirizzoResidenza(); String
		numeroCivicoResidenza=genitore.getNumeroCivicoResidenza(); String
		capResidenza=genitore.getCapResidenza(); String
		comuneResidenza=genitore.getComuneResidenza(); String
		provinciaResidenza=genitore.getProvinciaResidenza(); String
		indirizzoDomicilio=genitore.getIndirizzoDomicilio(); String
		numeroCivicoDomicilio=genitore.getNumeroCivicoDomicilio(); String
		capDomicilio=genitore.getCapDomicilio(); String
		comuneDomicilio=genitore.getComuneDomicilio(); String
		provinciaDomicilio=genitore.getProvinciaDomicilio(); String
		rapportoParentela=genitore.getRapportoParentela(); String
		condizioneLavorativa=genitore.getCondizioneLavorativa(); String
		tipoContratto=genitore.getTipoContratto(); String
		sedeDiLavoro=genitore.getDipendentePresso();
 	
 }
 %>
	<!--Script per gestire i form --> <script type="text/javascript">
		function settaAttributi(slf) {
			document
					.getElementById("dati_bando")
					.setAttribute("action",
							"http://localhost:8080/Atsilo/ServletCompilazioneDatiBando");
			document.getElementById("bottone_submit").setAttribute("value",
					"Salva");
			var f = document.forms[0];
			var n = f.elements.length;
			for ( var i = 1; i < n; i++)
				document.forms[0].elements[i].removeAttribute("readonly");
			document.getElementById("codiceFiscale").setAttribute("readonly",
					"readonly");
			slf.onclick = null;
			return false;

		}
	</script> <%
 	if ((request.getParameter("successo")) != null) {
 		if (request.getParameter("successo").equals("ok")) {
 			out.print("<script type=text/javascript>alert('Modifica effettuata con successo')</script>");
 		} else {
 			out.print("<script type=text/javascript>alert('Modifica fallita. Compila correttamente i campi')</script>");
 		}
 	}
 %>
	<form id="dati_bando" name="dati_bando" action="" method="post">
		<input name="chiamante" type="hidden" id="chiamante"
			value="genitore_non_richiedente">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td colspan="4"><label for="altrifisglinido_1">Per
						inserire i dati del genitore non richiedente &egrave; necessario che
						siano stati inseriti i dati del bambino. Selezionare dal menu il
						bambino per il quale si vogliono inserire le informazioni del
						genitore non richiedente.</label> <br></td>
			</tr>
			<tr>
				<td colspan="2"><p>
						<select name="select_bambini" id="select_bambini" onChange="SettaCampiForm(this)">

				    </select>
					</p>
					<p>&nbsp;</p></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>In qualita' di</td>
				<td><select id="qualita" name="qualita">
						<option value="Seleziona">Seleziona</option>
						<option value="Padre">Padre</option>
						<option value="Madre">Madre</option>
						<option value="Tutore" selected>Tutore</option>
						<option value="Affidatario">Affidatario</option>
				</select></td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Cognome</td>
				<td><input name="cognome_genitore_non_richiedente" type="text"
					id="cognome_genitore_non_richiedente" value="<%=cognome%>"
					size="25" maxlength="25" readonly="readonly"></td>
				<td>Nome</td>
				<td><input name="nome_genitore_non_richiedente" type="text"
					id="nome_genitore_non_richiedente" value="<%=nome%>" size="25"
					maxlength="50" readonly="readonly"></td>
			</tr>
			<tr>
				<td>Nato/a a</td>
				<td><input name="comune_nascita_genitore_non_richiedente"
					type="text" id="comune_nascita_genitore_non_richiedente"
					value="<%=comuneNascita%>" size="25" maxlength="25"
					readonly="readonly"></td>
				<td>Nato il</td>
				<td><input name="dataNascita_genitore_non_richiedente"
					type="text" id="dataNascita_genitore_non_richiedente"
					value="<%=dataNascita%>" size="25" maxlength="10"
					readonly="readonly"></td>
			</tr>
			<tr>
				<td>Codice Fiscale</td>
				<td><input name="codice_fiscale_genitore_non_richiedente"
					type="text" id="codice_fiscale_genitore_non_richiedente"
					value="<%=codiceFiscale%>" size="25" maxlength="16"
					readonly="readonly" /></td>
				<td>Cittadinanza</td>
				<td><input name="cittadinanza_genitore_non_richiedente"
					type="text" id="cittadinanza_genitore_non_richiedente"
					value="<%=cittadinanza%>" size="25" maxlength="25"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Residente a</td>
				<td><input name="comune_residenza_genitore_non_richiedente"
					type="text" id="comune_residenza_genitore_non_richiedente"
					value="<%=comuneResidenza%>" size="25" maxlength="25"
					readonly="readonly" /></td>
				<td>Via/Piazza</td>
				<td><input name="indirizzo_residenza_genitore_non_richiedente"
					type="text" id="indirizzo_residenza_genitore_non_richiedente"
					value="<%=indirizzoResidenza%>" size="25" maxlength="25"
					readonly="readonly" /></td>
			</tr>
			<tr>
				<td>Numero civico</td>
				<td><input
					name="numero_civico_residenza_genitore_non_richiedente" type="text"
					id="numero_civico_residenza_genitore_non_richiedente"
					value="<%=numeroCivicoResidenza%>" size="25" maxlength="5"
					readonly="readonly" /></td>
				<td>CAP</td>
				<td><input name="cap_residenza_genitore_non_richiedente"
					type="text" id="cap_residenza_genitore_non_richiedente"
					value="<%=capResidenza%>" size="5" maxlength="5"
					readonly="readonly" /></td>
			<tr>
				<td>Provincia</td>
				<td><input name="provincia_residenza_genitore_non_richiedente"
					type="text" id="provincia_residenza_genitore_non_richiedente"
					value="<%=provinciaResidenza%>" size="2" maxlength="2"
					readonly="readonly" /></td>

				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>

			<tr>
				<td colspan="4"><p>&nbsp;</p>
					<p>Compilare i campi sottostanti solo se il domicilio &egrave;
						diverso dalla residenza</p></td>
			</tr>


			<td>Domiciliato a</td>
			<td><input name="comune_domicilio_genitore_non_richiedente"
				type="text" id="comune_domicilio_genitore_non_richiedente"
				value="<%=comuneDomicilio%>" size="25" maxlength="25"
				readonly="readonly" /></td>
			<td>Via/Piazza</td>
			<td><input id="indirizzo_domicilio_genitore_non_richiedente"
				value="<%=indirizzoDomicilio%>"
				name="indirizzo_domicilio_genitore_non_richiedente" size="25"
				maxlength="25" type="text" /></td>
			</tr>
			<tr>
				<td>Numero civico</td>
				<td><input
					name="numero_civico_domicilio_genitore_non_richiedente" type="text"
					id="numero_civico_domicilio_genitore_non_richiedente"
					value="<%=numeroCivicoDomicilio%>" size="25" maxlength="5"
					readonly="readonly" /></td>
				<td>CAP</td>
				<td><input id="cap_domicilio_genitore_non_richiedente"
					value="<%=capDomicilio%>"
					name="cap_domicilio_genitore_non_richiedente" size="5"
					maxlength="5" type="text" /></td>
			<tr>
				<td>Provincia</td>
				<td><input name="provincia_domicilio_genitore_non_richiedente"
					type="text" id="provincia_domicilio_genitore_non_richiedente"
					value="<%=provinciaDomicilio%>" size="2" maxlength="2"
					readonly="readonly" /></td> </
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>Condizione lavorativa</td>
				<td><input
					name="condizione_lavorativa_genitore_non_richiedente" type="text"
					id="condizione_lavorativa_genitore_non_richiedente"
					value="<%=condizioneLavorativa%>" size="25" maxlength="25"
					readonly="readonly"></td>
				<td>Tipo contratto</td>
				<td><select id="tipo_contratto_genitore_non_richiedente"
					name="tipo_contratto_genitore_non_richiedente">
						<option value="Seleziona">Seleziona</option>
						<option value="A tempo pieno">A tempo pieno</option>
						<option value="Part time">Part time</option>
				</select></td>
			</tr>
			<tr>
				<td>Sede di lavoro</td>
				<td colspan="4"><input
					name="sede_lavoro_genitore_non_richiedente" type="text"
					id="sede_lavoro_genitore_non_richiedente" value="<%=sedeDiLavoro%>"
					size="50" maxlength="150" readonly="readonly"></td>

			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="bottone_submit"
					id="bottone_submit" value="Modifica"
					onClick="return settaAttributi(this)" /> <input type="reset"
					name="reset" value="Annulla" /></td>
			</tr>
		</table>
	</form></td>
<!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"%>
</body>
</html>