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
include file="atsilo_files/sidebar.jsp"
 %>
<br>
<img width="209" border="0" alt="" height="1" src="atsilo_images/clearpixel.gif"></td><td class="content" valign="top" bgcolor="#ffffff">
<table width="100%">
<tbody><tr>
<td>
<div class="titolopagina">Benvenuto XXX</div>
</td><td class="fasciadxvariabile"></td>
</tr>
</tbody></table>

<table cellspacing="10" cellpadding="0" border="0" width="100%">
<tbody><tr>
<td class="tplHeader">
<div>
					<form action='' method=POST >
				<div id=datachooser2 onclick="allargaDiv('datachooser1')" onmouseover="stringiDiv('datachooser1')" style=" left: 80%; position: absolute; height: 50px; ">
				Data Fine: 	<input type=text name=dataOu onclick="Calendar.show(this, '%d/%m/%Y', true)" onfocus="Calendar.show(this, '%d/%m/%Y', true)" onblur="Calendar.hide()" />
				</div>
				<div id=datachooser1  onclick="allargaDiv('datachooser1')" onmouseover="stringiDiv('datachooser1')" style=" height: 50px; width: 100px;">
				Data Inizio: <input type=text name=dataIn onclick="Calendar.show(this, '%d/%m/%Y', true)" onfocus="Calendar.show(this, '%d/%m/%Y', true)" onblur="Calendar.hide()" />
				</div>

				<br>
				<br>
				<p align=center><input type=submit value="Genera Report"></p>
				<br><br>
			</form>				
		</div>

<p><strong><br />
</strong></p>
<p>&nbsp;</p></td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td class="tplTitolo"><b></b></td>
</tr>
</tbody></table>
</td>
</tr>
<tr>
<td>
<table cellspacing="0" cellpadding="0" border="0">
<tbody><tr>
<td>
<table width="598" cellspacing="0" cellpadding="0" border="0"></table>
</td>
</tr>
<tr>
<td><img border="0" alt="" height="20" width="1" src="atsilo_files/clearpixel.gif"></td>
</tr>
</tbody></table>
</td>
</tr>
<tr>
<td class="tplHeader"></td>
</tr>
</tbody></table>
</td><td class="fasciadxvariabile"></td>
</tr>
<tr>
<td class="bottom" width="209">&nbsp;2012 © Unisa</td><td align="right" class="bottom"></td>
</tr>
</tbody></table>


</body>
</html>