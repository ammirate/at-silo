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
        String bambino_disabile="false";
        String genitore_invalido="false";
        String genitore_solo="false";
        String vedovo="false";
        String nubile="false";
        String separato="false";
        String figlio_non_riconosciuto="false";
        String affido_esclusivo="false";
        String altri_figli_disabili="false";
        String altre_condizioni_calcolo_punteggio="";
 		
 	 if (request.getParameter("select_bambini")!=null)
 	   cfb=(String)request.getParameter("select_bambini");
 	 
 	 cdt=ControlDatiPersonali.getIstance();
 	 Genitore genitore=new Genitore();
 	
 	if (cfb!=null && !cfb.equals("null")){ 
 		Bambino bambino_selezionato=new Bambino();
    	bambino_selezionato=cdt.getDatiBambino(cfb);
    	DomandaIscrizione domandaIscrizione= cisc.getDomandaIscrizione(cfb);
       	if (domandaIscrizione!=null){
       	   Float isee_temp=domandaIscrizione.getIsee();
       	isee=isee_temp.toString();
 	 	}
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
			<tr>
				<td colspan="2"><input name="bambino_disabile"
					id="bambino_disabile" value="false" checked="checked" type="radio">
					No <span id="bambino_disabile"> <input
						name="bambino_disabile" id="bambino_disabile" value="true"
						type="radio"> Si
				</span></td>

			</tr>

			<tr>
				<td colspan="4">Il padre/la madre &agrave; in situazione di
					invalidit&agrave; riconosciuta (con invalidit&agrave; pari o
					superiore a 2/3 ai sensi dell'art. 3 Legge 104/92 o malattia
					permanente con grave riduzione delle funzioni psico/fisiche
					allegare in busta chiusa certificazione dell'Asl</td>
			</tr>
			<tr>
				<td colspan="2" id="genitore_invalido"><input
					name="genitore_invalido" id="genitore_invalido" value="false"
					checked="checked" type="radio"> No <input
					name="genitore_invalido" id="genitore_invalido" value="true"
					type="radio"> Si</td>
			</tr>
			<tr>
				<td colspan="2">Il padre/la madre &egrave; genitore solo</td>
				<td colspan="2"><span id="genitore_solo"> <input
						name="genitore_solo" id="genitore_solo" value="false"
						checked="checked" type="radio"> No
				</span> <input name="genitore_solo" id="genitore_solo" value="true"
					type="radio"> Si</td>
			</tr>
			<tr>
				<td colspan="4"><p>
						vedova/o <input id="vedovo" name="vedovo" type="checkbox">
					</p>
					<p>
						nubile <input id="nubile" name="nubile" type="checkbox">
					</p>
					<p>
						separato/divorziato con affido del minore <input id="separato"
							name="separato" type="checkbox">
					</p>
					<p>
						genitore solo con figlio non riconosciuto dall'altro genitore <input
							id="figlio_non_riconosciuto" name="figlio_non_riconosciuto"
							type="checkbox">
					</p>
					<p>
						genitore solo con figlio riconosciuto dall'altro genitore che non
						contribuisce n&egrave; all'educazione, n&egrave; al mantenimento,
						in possesso di dichiarazione di "affido esclusivo" <input
							id="affido_esclusivo" name="affido_esclusivo" type="checkbox">
					</p></td>

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
				<td colspan="2"><input name="altri_figli_disabili"
					id="altri_figli_disabili" value="false" checked="checked"
					type="radio"> No <input name="altri_figli_disabili"
					id="altri_figli_disabili" value="true" type="radio"> Si</td>
			</tr>
			<tr>
				<td colspan="2">ALTRE CONDIZIONI RILEVANTI AI FINI DEL
					PUNTEGGIO</td>
				<td colspan="1"><textarea
						name="altre_condizioni_calcolo_punteggio" cols="50" rows="5"
						readonly="readonly"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
				<td colspan="2"></td>
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

</html>