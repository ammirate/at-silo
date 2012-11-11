# Sostituire Nome Cognome con i propri nome e cognome
user_name='Nome Cognome'
# sostituire email con la propria email (lasciare le parentesi angolate)
user_email='email'

eclipse -vmargs -Duser.name="$user_name <$user_email>"
