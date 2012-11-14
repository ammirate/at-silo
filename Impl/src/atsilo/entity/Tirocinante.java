package atsilo.entity;

public class Tirocinante extends Utente{
    
    //nome,cognome,codice_fiscale,telefono,email,d
    //ata_di_nascita,comune_di_nascita,indirizzo residenza,titolo_di_studi,
    //ore_totali,ore_lavoro,PERSONALE_ASILO
    
    private int oreTotali;
    private int oreLavoro;
    private PersonaleAsilo personaleAsilo;
    
    public Tirocinante(){
    }


    public void setOreTotali(int oreTotali) {
        this.oreTotali = oreTotali;
    }

    public int getOreTotali() {
        return oreTotali;
    }

    public void setOreLavoro(int oreLavoro) {
        this.oreLavoro = oreLavoro;
    }

    public int getOreLavoro() {
        return oreLavoro;
    }

    public void setPersonaleAsilo(PersonaleAsilo personaleAsilo) {
        this.personaleAsilo = personaleAsilo;
    }

    public PersonaleAsilo getPersonaleAsilo() {
        return personaleAsilo;
    }
}
