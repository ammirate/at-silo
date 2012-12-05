<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    
    <% 
//distrugge la sessione
HttpSession sessione = request.getSession(); 
sessione.invalidate();
 
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Logout</title>
<!-- Contents -->
	<meta http-equiv="refresh" content="1;url=index.html" />
	<!-- Others -->
	<meta name="Author" content="Angelo G. Scafuro" />
</head>
Disconnessione in corso..

</html>