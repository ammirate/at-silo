package atsilo.entity;

import java.sql.Date;

public class Tirocinante {
    
    private String nome;
        private String cognome;
        private String codiceFiscale;
        private String telefono;
        private String e_mail;
        private Date dataNascita;
        private String comuneNascita;
        private String comuneResidenza;
        private int oreTotali;
        private int oreLavoro;
        
        public Tirocinante(){}

            public String getNome() {
                    return nome;
            }

            public void setNome(String nome) {
                    this.nome = nome;
            }

            public String getCognome() {
                    return cognome;
            }

            public void setCognome(String cognome) {
                    this.cognome = cognome;
            }

            public String getCodiceFiscale() {
                    return codiceFiscale;
            }

            public void setCodiceFiscale(String codiceFiscale) {
                    this.codiceFiscale = codiceFiscale;
            }

            public String getTelefono() {
                    return telefono;
            }

            public void setTelefono(String telefono) {
                    this.telefono = telefono;
            }

            public String getE_mail() {
                    return e_mail;
            }

            public void setE_mail(String e_mail) {
                    this.e_mail = e_mail;
            }

            public Date getDataNascita() {
                    return dataNascita;
            }

            public void setDataNascita(Date dataNascita) {
                    this.dataNascita = dataNascita;
            }

            public String getComuneNascita() {
                    return comuneNascita;
            }

            public void setComuneNascita(String comuneNascita) {
                    this.comuneNascita = comuneNascita;
            }

            public String getComuneResidenza() {
                    return comuneResidenza;
            }

            public void setComuneResidenza(String comuneResidenza) {
                    this.comuneResidenza = comuneResidenza;
            }

            public int getOreTotali() {
                    return oreTotali;
            }

            public void setOreTotali(int oreTotali) {
                    this.oreTotali = oreTotali;
            }

            public int getOreLavoro() {
                    return oreLavoro;
            }

            public void setOreLavoro(int oreLavoro) {
                    this.oreLavoro = oreLavoro;
            }
}
