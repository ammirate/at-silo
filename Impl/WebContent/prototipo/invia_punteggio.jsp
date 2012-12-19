<%@page import="atsilo.util.AtsiloConstants"%>
<%@
	include file="atsilo_files/header.jsp"%>
<%@ page import="atsilo.application.*,atsilo.entity.*"%>

<script type="text/javascript">
function valutaIscrizione(){
	document.getElementById("val").style.display = "block";
	document.getElementById("esc").style.display = "none";
	document.getElementById("inpv").setAttribute("disabled","disabled");
	document.getElementById("inpe").removeAttribute("disabled");
}
function escludiIscrizione(){
	document.getElementById("esc").style.display = "block";
	document.getElementById("val").style.display = "none";
	document.getElementById("inpe").setAttribute("disabled","disabled");
	document.getElementById("inpv").removeAttribute("disabled");
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57))
      return false;

   return true;
}
</script>

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
include file="atsilo_files/sidebar_impiegato_bando.jsp"%>
<img width="209" border="0" alt="" height="1"
	src="atsilo_images/clearpixel.gif">
</td>
<td class="content" valign="top" bgcolor="#ffffff"><table
		cellspacing="10" cellpadding="0" border="0" width="100%">
		<tbody>
			<tr>
				<td><table border="0">
						<tbody>
							<tr>
								<td class="tplTitolo">
<form action="http://localhost:8080/Atsilo/ServletAggiungiPunteggio" method="post">
<%
	String r = request.getParameter("domanda");
	int id = Integer.parseInt(r);
	ControlGestioneBando crt = ControlGestioneBando.getIstance();
	DomandaIscrizione domanda = crt.getDomandaIscrizioneById(id);
	boolean genitore_richiedente_non_presente=domanda.getGenitoreSolo()|| domanda.getGenitoreVedovo()|| 
			domanda.getGenitoreNubile()||domanda.getGenitoreSeparato()||domanda.getFiglioNonRiconosciuto();
%>
<input type="hidden" value="<%= r %>" name="domanda" />
<div align="left">
<filedset><legend><h2>Valuta Domanda Iscrizione</h2></legend>
<table>
<thead><td><h4>Domanda Iscrizione</h4></td><td><h4>Informazioni sui Genitori</h4></td></thead><tbody>
<tr><td>
<b>Nome: </b> <%= domanda.getBambino().getNome() %>
<br /><b>Cognome: </b> <%= domanda.getBambino().getCognome() %>
<br /><b>Codice Fiscale: </b> <%= domanda.getBambino().getCodiceFiscale() %>
<br /><b>Bambino con disabilità: </b> <% if(domanda.getBambinoDisabile()) out.print("Si"); else out.print("No"); %>
<br /><b>Genitore con disabilità: </b> <% if(domanda.getGenitoreInvalido()) out.print("Si"); else out.print("No"); %>
<br /><b>Genitore solo: </b> <% if(domanda.getGenitoreSolo()) out.print("Si"); else out.print("No"); %>
<br /><b>Genitore vedovo: </b> <% if(domanda.getGenitoreVedovo()) out.print("Si"); else out.print("No"); %>
<br /><b>Genitore nubile: </b> <% if(domanda.getGenitoreNubile()) out.print("Si"); else out.print("No"); %>
<br /><b>Genitore separato: </b> <% if(domanda.getGenitoreSeparato()) out.print("Si"); else out.print("No"); %>
<br /><b>Figlio non riconosciuto: </b> <% if(domanda.getFiglioNonRiconosciuto()) out.print("Si"); else out.print("No"); %>
<br /><b>Affido esclusivo: </b> <% if(domanda.getAffidoEsclusivo()) out.print("Si"); else out.print("No"); %>
<br /><b>Altri componenti familiari soggetti a disabilità: </b> <% if(domanda.getAltriComponentiDisabili()) out.print("Si"); else out.print("No"); %>
<br /><b>ISEE: </b> <% out.print(domanda.getIsee()); %>
<br/><br/>
</td>
<td valign="top">
<b>Nome Genitore richiedente: </b> <%= domanda.getGenitore().getNome() %>
<br /><b>Cognome Genitore richiedente: </b> <%= domanda.getGenitore().getCognome() %>
<br /><b>Categoria Genitore richiedente: </b> <%= domanda.getGenitore().getTipo() %>
<br /><b>Status lavorativo richiedente: </b> <%
String status="";
int int_stat=domanda.getGenitore().getStatusLavorativo(); 
switch(int_stat)
{
	case 1:
		status=AtsiloConstants.STATUS_LAVORATIVO_1;
		break;
	case 2:
		status=AtsiloConstants.STATUS_LAVORATIVO_2;
		break;
	case 3:
		status=AtsiloConstants.STATUS_LAVORATIVO_3;
		break;
	case 4:
		status=AtsiloConstants.STATUS_LAVORATIVO_4;
		break;
	case 5:
		status=AtsiloConstants.STATUS_LAVORATIVO_5;
		break;
	case 6:
		status=AtsiloConstants.STATUS_LAVORATIVO_6;
		break;
	case 7:
		status=AtsiloConstants.STATUS_LAVORATIVO_7;
		break;
	case 8:
		status=AtsiloConstants.STATUS_LAVORATIVO_8;
		break;
	case 9:
		status=AtsiloConstants.STATUS_LAVORATIVO_9;
		break;
	case 10:
		status=AtsiloConstants.STATUS_LAVORATIVO_10;
		break;
	case 11:
		status=AtsiloConstants.STATUS_LAVORATIVO_11;
		break;
	case 12:
		status=AtsiloConstants.STATUS_LAVORATIVO_12;
		break;
	default: status = "Non specificato";
	break;
}
out.print(status);
%>
<br /><b>Anno scadenza contratto del richiedente: </b> <%= domanda.getGenitore().getScadenzaContratto() %>
<br><br>
<%
if(!genitore_richiedente_non_presente && domanda.getGenitoreNonRichiedente()!=null)
{
%>
<b>Nome Genitore non richiedente: </b> <%= domanda.getGenitoreNonRichiedente().getNome() %>
<br /><b>Cognome Genitore non richiedente: </b> <%= domanda.getGenitoreNonRichiedente().getCognome() %>
<br /><b>Condizione Lavorativa Genitore non richiedente: </b> <%= domanda.getGenitoreNonRichiedente().getCondizioneLavorativa() %>
<br /><b>Tipo contratto Genitore non richiedente: </b> <%= domanda.getGenitoreNonRichiedente().getTipoContratto() %>
<br /><b>Sede di lavoro Genitore non richiedente: </b> <%= domanda.getGenitoreNonRichiedente().getDipendentePresso() %>

<%
}
%>
</td>
</tr>
</tbody></table>
</filedset>
<input id="inpv" type="button" value="Valuta" name="valuta" onclick="valutaIscrizione()" />
<input id="inpe" type="button" value="Escludi" name="escludi" onclick="escludiIscrizione()" />
</div>
<div id="val" style="display: none;">
Valutazione : <input type="text" name="punteggio" onkeypress="return isNumberKey(event)"/>
<br /><input type="submit" value="Invia Punteggio" name="invia" />
</div>
<div id="esc" style="display: none;">
Motivo Esclusione : <input type="textbox" name="motivo" />
<br /><input type="submit" value="Invia Motivazione" name="invia" />
</div>
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
								<td><table width="598" cellspacing="0" cellpadding="0"
										border="0">
									</table></td>
							</tr>
							<tr>
								<td><img border="0" alt="" height="20" width="1"
									src="atsilo_files/clearpixel.gif" /></td>
							</tr>
						</tbody>
					</table></td>
			</tr>

		</tbody>
	</table></td>
<td class="fasciadxvariabile"></td>
</tr>
<%@
include file="atsilo_files/footer.jsp"%>






</body>
</html>