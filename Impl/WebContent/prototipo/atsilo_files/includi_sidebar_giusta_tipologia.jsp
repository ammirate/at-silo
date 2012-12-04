 
<!--A seconda del tipo di personale che accede al sistema sarà inclusa la sidebar relativa ad esso. Questa opzione serve perché alcune pagine sono condivise da più utenti e quindi, a seconda dell'utente. devono includere una sidebar-->

<% if ( tipologia.equals("impiegato_asilo") ) { %>
  <%@include file="../sidebar_impiegato.jsp"%>
<% } else if ( tipologia.equals("impiegato_bando")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_residenti_fisciano.jsp"%>
<% } else if ( tipologia.equals("direttore")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_residenti_fisciano.jsp"%>
<% } else if ( tipologia.equals("delegato_rettore")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_residenti_fisciano.jsp"%>
<% } else if ( tipologia.equals("delegato_scfm")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_residenti_fisciano.jsp"%>
<% } else if ( tipologia.equals("educatore")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_residenti_fisciano.jsp"%>
<% } else if ( tipologia.equals("psicopedagogo")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_residenti_fisciano.jsp"%>
<% } else if ( tipologia.equals("genitore")) { %>
   <%@include file="atsilo_files/dati_genitore_richiedente_altro.jsp"%>
   <% } %>