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
include file="atsilo_files/sidebar_top_genitore.jsp"
 %>
<%@ page import="atsilo.application.*,atsilo.entity.*"
 %>
 <%
 	ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
   	DomandaIscrizione domandaIscrizione= cdt.getDomandaIscrizione(username, null);
   	Float isee_temp=domandaIscrizione.getIsee();
   	String isee=isee_temp.toString();
 %>
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
<input name="chiamante" type="hidden" id="chiamante" value="situazione_reddituale">
  <table width="100%" border="0" cellspacing="0">

  <tr>
  	<td colspan="3">&nbsp;</td>
   
   
  </tr>
  
  
  <tr>
    <td colspan="3"> il cui indicatore ISEE &egrave; pari a Euro </td>
    <td>
      <input name="isee" type="text" id="isee" value="<%=isee%>" maxlength="10" readonly="readonly" /></td>
  </tr>

  <tr>
  	<td colspan="3">&nbsp;</td>
    <td colspan="1" >&nbsp;</td>
   
  </tr>


    <tr>
    <td colspan="2">&nbsp;</td>
    <td colspan="2"></td>
  </tr>
   <tr>
     <td></td>
       	 	<td><input type="submit" name="bottone_submit" id="bottone_submit" value="Modifica" onClick="return settaAttributi(this)"/>
                <input type="reset" name="reset" value="Annulla" />
            </td>
          </tr>
</table>
 
</form>

</td><!--Chiudi content -->


<%@
include file="atsilo_files/footer.jsp"
 %>



</body>
</html>