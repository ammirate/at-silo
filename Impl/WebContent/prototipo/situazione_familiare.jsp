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
<td class="content" valign="top" bgcolor="#ffffff"><%@include
		file="atsilo_files/sidebar_top_bambino.jsp"%>
	<%@ page import="atsilo.application.*,atsilo.entity.*,java.util.*"%>

	<%
		// istanzio variabili per select bambini
			ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
	 		ControlIscrizione cisc= ControlIscrizione.getIstance();
		   	Utente utente=cdt.getValoriUtente(username);
		  	Genitore genitore_richiedente=cdt.getDatiGenitore(utente.getCodiceFiscale());//genitore richiedente
		  	List<Bambino> figli= new ArrayList<Bambino>();
		  	figli= cdt.getFigli(genitore_richiedente.getCodiceFiscale()); //lista dei figli
	%> <script>
		function submitForm() {
			document.forms[0].submit();
		}
	</script> <%
 	//setta campi form una volta selezionato il nome del bambino
  	
  	    String cfb=null;
 	    String isee="";
         boolean bambino_disabile=false;
         boolean genitore_invalido=false;
         boolean genitore_solo=false;
         boolean vedovo=false;
         boolean nubile=false;
         boolean separato=false;
         boolean figlio_non_riconosciuto=false;
         boolean affido_esclusivo=false;
         boolean altri_figli_disabili=false;
         String altre_condizioni_calcolo_punteggio="";
  		
  	 if (request.getParameter("select_bambini")!=null)
  	   cfb=(String)request.getParameter("select_bambini");
  	 
  	 cdt=ControlDatiPersonali.getIstance();
  	 Genitore genitore=new Genitore();
  	
 	if (cfb != null && !cfb.equals("null")) {
 		Bambino bambino_selezionato = new Bambino();
 		bambino_selezionato = cdt.getDatiBambino(cfb);
 		DomandaIscrizione domandaIscrizione = cisc
 				.getDomandaIscrizione(cfb);
 		if (domandaIscrizione != null) {
 			Float isee_temp = domandaIscrizione.getIsee();
 			isee = isee_temp.toString();
 			bambino_disabile = domandaIscrizione.getBambinoDisabile();
 			genitore_invalido = domandaIscrizione.getGenitoreInvalido();
 			genitore_solo = domandaIscrizione.getGenitoreSolo();
 			vedovo = domandaIscrizione.getGenitoreVedovo();
 			nubile = domandaIscrizione.getGenitoreNubile();
 			separato = domandaIscrizione.getGenitoreSeparato();
 			figlio_non_riconosciuto = domandaIscrizione.getFiglioNonRiconosciuto();
 			affido_esclusivo = domandaIscrizione.getAffidoEsclusivo();
 			altri_figli_disabili = domandaIscrizione.getAltriComponentiDisabili();
 			if (domandaIscrizione.getCondizioniCalcoloPunteggio() != null)
 				altre_condizioni_calcolo_punteggio = domandaIscrizione.getCondizioniCalcoloPunteggio();

 		}
 	}
 %> <!--Script per gestire i form --> <!--Script per gestire i form -->
	<script type="text/javascript">
		function settaAttributi(slf) {
			document
					.getElementById("dati_bando")
					.setAttribute("action",
							"<%=request.getContextPath()%>/ServletCompilazioneDatiBando");
			document.getElementById("bottone_submit").setAttribute("value",
					"Salva");
			var f = document.forms[0];
			var n = f.elements.length;
			for ( var i = 1; i < n; i++)
				document.forms[0].elements[i].removeAttribute("readonly");
			document.getElementById("select_bambini").removeAttribute(
					"onChange", "");
			slf.onclick = null;
			return false;
		}
	</script> <%
 	if ((request.getParameter("successo")) != null  ) {
 		if (request.getParameter("successo").equals("ok")) {
 			out.print("<script type=text/javascript> alert('Modifica effettuata con successo');window.location='"+temp_nome_chiamante+"';window.location='"+temp_nome_chiamante+"';</script>");
 		} else {
 			if ((request.getParameter("errore")) != null) {
 				out.print("<script type=text/javascript>alert('"+request.getParameter("errore").toString()+"'); window.location='"+temp_nome_chiamante+"';</script>");
 		 	} else {
			out.print("<script type=text/javascript>alert('Modifica fallita');window.location='"+temp_nome_chiamante+"';</script>");
			}
		}
 	}
 %>
	<form id="dati_bando" name="dati_bando" action="" method="post">
		<input name="chiamante" type="hidden" id="chiamante"
			value="situazione_familiare">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td colspan="4"><label for="altrifisglinido_1">Selezionare
						il figlio per il quale si vogliono inserire le informazioni</label> <br></td>

			</tr>
			<tr>
				<td colspan="2">
						
						<% 
						if(figli.size()>0)
						{
							out.print("<select name='select_bambini' id='select_bambini' onchange='submitForm()'><option value='null' >Selezionare Bambino</option>");
							String selected="";
							  for (int i=0;i<figli.size();i++){
							  	selected="";
								  if (figli.get(i).getCodiceFiscale().equals(cfb))
									  selected="selected";
							  out.print("<option value='"+figli.get(i).getCodiceFiscale()+"'"+selected+" >"+figli.get(i).getNome()+"</option>");
							  }
						}
						else
						{
							out.print("<em><b>E' necessario inserire un bambino</b></em>");
							return;
						}
						%>
				</select></td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td colspan="1">L'indicatore ISEE &egrave; pari a Euro</td>
				<td><input name="isee" type="text" id="isee" value="<%=isee%>"
					maxlength="10" readonly="readonly" /></td>
			</tr>
			<tr>
				<td colspan="4">Il/la bambino/a per la/il quale si chiede
					l'iscrizione &egrave; in situazione di disabilit&agrave; (allegare,
					in busta chiusa, diagnosi funzionale del servizio di Neuro
					Psichiatria Infantile, ovvero certificazione ex L. 104/92 di presa
					in carico dell'Asl)</td>
			</tr>
			<tr><% 
			
				out.append("<td colspan='2'><input name='bambino_disabile'")
				.append(" id='bambino_disabile' value='false' checked='checked' type='radio'>")
				.append("	No");
					
					String checked="";
					if (bambino_disabile)
						checked="checked='checked'";
					out.append("<input")
					.append(" name='bambino_disabile' id='bambino_disabile' value='true' "+checked)
					.append(" type='radio'> Si </td> ");
				%>

			</tr>

			<tr>
				<td colspan="4">Il padre/la madre &agrave; in situazione di
					invalidit&agrave; riconosciuta (con invalidit&agrave; pari o
					superiore a 2/3 ai sensi dell'art. 3 Legge 104/92 o malattia
					permanente con grave riduzione delle funzioni psico/fisiche
					allegare in busta chiusa certificazione dell'Asl</td>
			</tr>
			<tr>
				<% 
			
				out.append("<td colspan='2'><input name='genitore_invalido'")
				.append(" id='genitore_invalido' value='false' checked='checked' type='radio'>")
				.append("	No");
					
					 checked="";
					if (genitore_invalido)
						checked="checked='checked'";
					out.append("<input")
					.append(" name='genitore_invalido' id='genitore_invalido' value='true' "+checked)
					.append(" type='radio'> Si </td> ");
				%>
			</tr>
			<tr>
				<td colspan="1">Il padre/la madre &egrave; genitore solo</td> 
				<td colspan="2">
					<%
						out.print("<select name='select_genitore_solo' id='select_genitore_solo' ><option value='false'  >Selezionare </option>");
						String selected = "";

						if (vedovo)
							selected = "selected";
						out.print("<option value='vedovo'"
								+ selected + " > Vedovo </option>");
						selected = "";
						
						if (nubile)
							selected = "selected";
						out.print("<option value='nubile'"
								+ selected + " > Nubile </option>");
						selected = "";
						
						if (separato)
							selected = "selected";
						out.print("<option value='separato'"
								+ selected + " > Separato </option>");
						selected = "";
						
						if (figlio_non_riconosciuto)
							selected = "selected";
						out.print("<option value='figlio_non_riconosciuto'"
								+ selected + " > Figlio non riconosciuto </option>");
						selected = "";
						
						if (affido_esclusivo)
							selected = "selected";
						out.print("<option value='affido_esclusivo'"
								+ selected + " > Affido esclusivo </option>");
						selected = "";
					%> </select>
			</tr>
			<tr>
		
				<td>&nbsp;</td>
				<td></td>
			</tr>
			<tr>
				<td colspan="4"><label for="altriinvalidi_1">Altri
						componenti il nucleo familiare (figli) con
						disabilit&agrave;/invalidit&agrave; (allegare, in busta chiusa,
						certificazione dell'Asl) </label> <br></td>
			</tr>
			<tr>
				<% 
			
				out.append("<td colspan='2'><input name='altri_figli_disabili'")
				.append(" id='altri_figli_disabili' value='false' checked='checked' type='radio'>")
				.append("	No");
					
					 checked="";
					if (altri_figli_disabili)
						checked="checked='checked'";
					out.append("<input")
					.append(" name='altri_figli_disabili' id='altri_figli_disabili' value='true' "+checked)
					.append(" type='radio'> Si </td> ");
				%>
			</tr>
			<tr>
				<td colspan="1">ALTRE CONDIZIONI RILEVANTI AI FINI DEL
					PUNTEGGIO</td>
				<td colspan="1"><textarea
						name="altre_condizioni_calcolo_punteggio" cols="50" rows="5"
						readonly="readonly"><%=altre_condizioni_calcolo_punteggio %></textarea></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td colspan="2"></td>
			</tr>
						<%  if (cfb!=null && cfb!="null"){
			out.append("<tr>")
				.append("<td></td>")
				.append("<td><input type='submit' name='bottone_submit'")
				.append(" id='bottone_submit' value='Modifica' ") 
				 .append(" onClick='return settaAttributi(this)' /> ")
				.append("<input type='reset' name='reset' value='Annulla' /></td></tr>");
			}%>
		</table>

	</form></td>
<!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"%>

</html>