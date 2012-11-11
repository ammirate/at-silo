REM sostituire Nome Cognome con i propri nome e cognome
SET USER_NAME=Nome Cognome
REM sostituire email con la propria email (lasciare le parentesi angolate)
SET USER_EMAIL=email

eclipse -vmargs -Duser.name="%USER_NAME% <%USER_EMAIL%>"
