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
include file="atsilo_files/sidebar_top_iscrizione.jsp"
 %>
 <%@ page
		import="java.util.*,atsilo.application.*,atsilo.entity.*"%>
 <% // setto select bambino
		ControlDatiPersonali cdt= ControlDatiPersonali.getIstance();
	   	Utente utente=cdt.getValoriUtente(username);
	  	Genitore genitore_richiedente=cdt.getDatiGenitore(utente.getCodiceFiscale());//genitore richiedente
	  	List<Bambino> figli= new ArrayList<Bambino>();
	  	figli= cdt.getFigli(genitore_richiedente.getCodiceFiscale()); //lista dei figli 
			%>
			 <%
	 //setta campi form una volta selezionato il nome del bambino
	  String cfb=null;
	 if (request.getParameter("select_bambini")!=null )
	  cfb=(String)request.getParameter("select_bambini");
	 %>
 <%
 	if ((request.getParameter("successo")) != null) {
 		if (request.getParameter("successo").equals("ok")) {
 			out.print("<script type=text/javascript>alert('Pre iscrizione effettuata con successo')</script>");
 		} else {
 			String mess=request.getParameter("errore");
 			out.print("<script type=text/javascript>alert('"+mess+"')</script>");
 		}
 	}
 %>
 <form name="presenta_domanda_bando" action="http://localhost:8080/Atsilo/ServletIscrizioneBambino" method="post" onSubmit="return confirm('Presentando la domanda ora non potrai pi&ugrave; modificare i tuoi dati.Sei sicuro di volerla presentare? ');">
 <input name="chiamante" type="hidden" id="chiamante"
			value="pre_iscrizione">
<table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
  
    <tr>
      <td><table border="0">
        <tbody>
        
      	    <tr>
    <td colspan="4"><label for="altrifisglinido_1">Selezionare il figlio per il quale si vuole inviare la domanda di iscrizione</label>
      <br></td>
      
  </tr>
  <tr>
  <td colspan="2"><% if(figli.size()>0)
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
            <td >Si ricorda che per presentare la domanda di iscrizione &egrave; necessario aver compilato tutti i campi relativi a Dati Account e Dati Bambino ed &egrave; obbligatorio l'invio della stessa entro i termini indicati dal bando.</td>
            
            </tr>
            <tr>
              <td>&nbsp;</td></tr>
                <!-- Se tutti i dati sono stati compilati correttamente e non &egrave; scaduto il bando, il tasto PRESENTA DOMANDA ISCRIZIONE sarà abilitato, altrimenti sarà disabled-->
             <tr>
            <td >
            <%
            	if(ControlGestioneBando.getIstance().bandoAperto())
            	{
            		out.print("<input type='submit' value='Invio Domanda Iscrizione'>");
            	}
            	else
            	{
            		out.print("<em>Bando non aperto</em>");

            	}
            %>
            	
           </td>
            
            </tr>
          </tbody>
        </table>
         </form></td>
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