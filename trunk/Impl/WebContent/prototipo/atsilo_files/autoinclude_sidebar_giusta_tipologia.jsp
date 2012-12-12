 
<!--A seconda del tipo di personale che accede al sistema sarà inclusa la sidebar relativa ad esso. Questa opzione serve perché alcune pagine sono condivise da più utenti e quindi, a seconda dell'utente. devono includere una sidebar-->

<% if ( tipologia.equals("impiegato_asilo") ) { %>
  <%@include file="sidebar_impiegato.jsp"%>
  
<% } else if ( tipologia.equals("impiegato_bando")) { %>
   <%@include file="sidebar_impiegato_bando.jsp"%>
   
<% } else if ( tipologia.equals("direttore")) { %>
   <%@include file="sidebar_direttore.jsp"%>

<% } else if ( tipologia.equals("responsabile_questionario")) { %>
   <%@include file="sidebar_delegato_rettore.jsp"%>

<% } else if ( tipologia.equals("delegato_scfm")) { %>
   <%@include file="sidebar_scienzeformazione.jsp"%>

<% } else if ( tipologia.equals("educatore")) { %>
   <%@include file="sidebar.jsp"%>

<% } else if ( tipologia.equals("psicopedagogo")) { %>
   <%@include file="sidebar_ped.jsp"%>

<% } else if ( tipologia.equals("genitore")) { %>
   <%@include file="sidebar_genitore.jsp"%>
   <% } %>