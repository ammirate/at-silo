<%@page isErrorPage="true" %>
      <html>
        <head><title>Error Page.</title></head>
      <body bgcolor="blue">
                <font size="16" color="white">Your page generated
 an error:"<br/>
                Exception:<br/></font>
                <%= exception.toString() %>
        </body>
</html>