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
	  	ControlIscrizione controlIscrizione=ControlIscrizione.getIstance();
	  	
			%>
			 <%
	 //setta campi form una volta selezionato il nome del bambino
	  String cfb=null;
	  String stato="";
	 if (request.getParameter("select_bambini")!=null )
	  cfb=(String)request.getParameter("select_bambini");
	 if (cfb!=null && ! cfb.equals("null")){ 
		 
		 if (controlIscrizione.getDomandaIscrizione(cfb).getStatoDomanda()!=null )
			 stato=controlIscrizione.getDomandaIscrizione(cfb).getStatoDomanda();
	 }
	 %>
  <!--Script sottomette  form select bambino--> 
  <script>
  function submitForm(){
  document.forms[0].submit();
  }
  </script> 
 
<table cellspacing="10" cellpadding="0" border="0" width="100%">

  <tbody>
  
    <tr>
      <td><table border="0">
      <form >
        <tbody>
        
      	    <tr>
    <td colspan="4"><label for="altrifisglinido_1">Selezionare il figlio per il quale si vogliono informazioni sullo stato dell'iscrizione</label><br></td>
      
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
            <td ><p>&nbsp;</p>
              <p>Stato iscrizione : <%out.print(stato);%></p></td>
            
            </tr>
          </tbody>
            </form>
        </table>
       </td>
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