package atsilo.entity;

import java.sql.Date;

public class Tirocinante extends Utente{
    
    private String nome;
        private int oreTotali;
        private int oreLavoro;
        
        public Tirocinante(){}

           
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
