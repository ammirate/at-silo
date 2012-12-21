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
<form>
  <table width="80%" border="0" cellspacing="0">
    <tr>
    <td colspan="4">Benvenuto!</td>
    </tr>
    <tr>
    <td>
    Per iscrivere tuo figlio, inserisci un nuovo bambino dalla sezione <b>Dati Iscrizione Bambino</b>.
    <br>
    <br>
    Successivamente compila la situazione familiare associata alla domanda di iscrizione del bambino, cliccando su <b>Dati Iscrizione Bambino -> Situazione familiare</b>
    <br>
    <br>
    Successivamente, compila i tuoi dati personali, e quelli del tuo coniuge (se presente) dalla sezione <b>Dati personali</b>.
    <br>
    <br>
    Potrai controllare in ogni momento lo stato dell'iscrizione di un tuo bambino cliccando su <b>Effettua iscrizione</b>.
    <br>
    <br>
    Una volta compilato, potrai presentare la domanda di pre-iscrizione cliccando su <b>Effettua Iscrizione -> Presenta pre-iscrizione</b>.
    <br>
    <br>
    Una volta che il bando si sar&agrave; concluso e ti verrà assegnato un punteggio, potrai presentare la domanda di iscrizione vera e propria cliccando su <b>Effettua Iscrizione -> Presenta Domanda Iscrizione Completa</b>.
    <br><br>
    Per concludere la tua iscrizione dovrai consegnare dei certificati cartacei all'asilo.
    <br>
    <br>
    <% 
    	String path = ControlGestioneBando.getIstance().getBando().getPath();
    	String pathprint = "<a href='"+request.getContextPath()+"/"+path+"' target='_blank'>questo indirizzo</a>.";
    	if(path!=null && path!="")
    	{
    		out.append("Se vuoi consultare il regolamento del bando, visita ")
    		.append(pathprint);
    	}
    %>  
    </td>
      </tr>
  </tr>
  <tr>
  <td colspan="2">&nbsp;</td>
     <td>&nbsp;</td>
  </tr>



</table>
 
</form>

</td><!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"
 %>