<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@
	include file="atsilo_files/header.jsp"
%>
<%
	if (request.getParameter("successo") != null && !temp_nome_chiamante.equals("lista_domanda_confermata.jsp"))  { 
		if (request.getParameter("successo").equals("y")) {
			out.print("<script type=text/javascript>alert('Modifica salvata con successo')</script>");
		}
		else
		{
 			if ((request.getParameter("errore")) != null) {
 				out.print("<script type=text/javascript>alert('"+request.getParameter("errore").toString()+"')</script>");
 		 	} else {
			out.print("<script type=text/javascript>alert('Modifica fallita')</script>");
			}
		}
	}
%>

<table width="100%" cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="breadcrumb " align="left"><p> </a></p>
  <p>&nbsp;</p></td>
</tr>
</tbody></table>
<%@
include file="atsilo_files/sidebar_impiegato_bando.jsp"%>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff"><table cellspacing="10" cellpadding="0" border="0" width="100%">
  <tbody>
    <tr>
      <td><table border="0">
        <tbody>
          <tr>
            <td class="tplTitolo">
            <form action="<%=request.getContextPath()%>/ServletBandoCarica" method="post" enctype="multipart/form-data">
        <table class="tabelle_form">
          <tr> 
        	<td colspan="2"><p>Selezionare il pdf del bando da caricare sul sito</p>
        	  <p>&nbsp;</p></td>
       	 	
          </tr>
          <tr> 
        	<td colspan="2"><input name="file" type="file" id="file"   /></td>
       	 	
          </tr>
         
          <tr> 
        	
       	 	<td>&nbsp;</td>
          </tr>
        	<td></td>
       	 	<td><input type="submit" name="carica" value="Carica Bando" />
            </td>
          </tr>
          
         </table>
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
            <td><table width="598" cellspacing="0" cellpadding="0" border="0">
            </table></td>
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