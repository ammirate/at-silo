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
    <pre>
    Per iscrivere tuo figlio, inserisci un nuovo bambino dalla sezione <b>Dati Bambino</b>.
    
    Successivamente compila la situazione familiare associata alla 
    domanda di iscrizione del bambino, cliccando su <b>Dati Bambino -> Situazione familiare</b>
    
    Successivamente, compila i tuoi dati personali, 
    e quelli del tuo coniuge (se presente) dalla sezione <b>Dati personali</b>.
    
    Una volta compilato, potrai presentare la domanda 
    di pre-iscrizione cliccando su <b>Iscrizione -> Presenta pre-iscrizione</b>.
    
    Una volta che il bando si sarà concluso e ti verrà assegnato un punteggio, 
    potrai presentare la domanda di iscrizione vera e propria cliccando 
    su <b>Iscrizione -> Presenta Domanda Iscrizione Completa</b>.
    
    Per concludere la tua iscrizione dovrai consegnare dei certificati cartacei all'asilo.
    
   
    <% 
    	String path = ControlGestioneBando.getIstance().getBando().getPath();
    	if(path!=null && path!="")
    	{
    		out.append("Se vuoi consultare il regolamento del bando, visita ")
    		.append("<a href='${pageContext.request.contextPath}/"+path+"' target='_blank'>questo indirizzo</a>.");
    	}
    %>  
    </pre>
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