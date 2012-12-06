<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function login() 
	{
	    // blocco per FireFox, Safari, ...
	    url="http://127.0.0.1/forum/ucp.php?mode=login";
	    params="username=admin&password=alfi1991&redirect=http://127.0.0.1:8887/forum/ucp.php?mode=login";
		
	    if (window.XMLHttpRequest) {
	        req = new XMLHttpRequest();
	        req.onreadystatechange = processReqChange;
	        req.open("POST", url);
	        req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	        req.setRequestHeader("Content-length", params.length);
	        req.setRequestHeader("Connection", "close");
	        req.send(params);
	        alert(params);
	    } else if (window.ActiveXObject) {
	        req = new ActiveXObject("Microsoft.XMLHTTP");
	        if (req) {
	            req.onreadystatechange = processReqChange;
	            req.open("POST", url, true);
	            req.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	            req.setRequestHeader("Content-length", params.length);
	            req.setRequestHeader("Connection", "close");
	            req.send(params);
	        }
	    }
	}
function processReqChange() 
{
    // solo se la richiesta e' stata completata
    alert(req.status);
    if (req.readyState == 4) {
    	alert("tutto ok fin qui");
    if (req.status == 200) {
        	alert("tutto ok fin qui");
       response  = req.responseXML.documentElement;
      result    = response.getElementsByTagName('result')[0].firstChild.data;
      message   = document.getElementById('loginCheckFailed');
      if (result == '1')
        message.className = 'error';
      else
        message.className = 'hidden';
      } else {
            alert("C'e' stato un problema accedendo ai dati XML:\n" + 
                   req.statusText);
        }
    }
}

</script>
<title>Login</title>
</head>
<body>
bla<br>
<div id="ciao"></div>
<form action='' method="POST">
	<input type=text name=username>
	<input type=text name=password>
	<input type=submit onclick="login();" value=Login>
</form>
</body>
</html>