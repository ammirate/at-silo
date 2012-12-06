package atsilo.entity;

import java.util.List;
import java.sql.Date;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: Account.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Cesarano, 14/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 6/12/2012
 *-----------------------------------------------------------------
 */

public class Retta {
    
    
   
   
    private String id;
    private String descrizioneTassa;
    private String descrizioneRata;
    private Date data;
    private float importoDovuto;
    private float importoPagato;
    private String nome;
    
    
    /**
     * La variabile extra è nulla c'è bisogno di una lettura della classe Extra
     */
    private List<Extra> extra;
    
    /**
     * La variabile genitore è nulla c'è bisogno di una lettura della classe Genitore
     */
    private Genitore genitore;

    /**
     * Costruttore vuoto
     */
    public Retta(){}
    
    /**
     * @param importoDovuto il paramentro è fissato
     * @param id il paramentro è fissato
     * @param extra è settato dopo la lettura 
     * @param genitore è settato dopo la lettura 
     * @param importoPagato il parametro è fissato
     * @param descrizioneTassa il parametro è fissato
     * @param descrizioneRata il parametro è fissato
     * @param data il parametro è fissato
     * @param nome il parametro è fissato
     */
    public Retta(float importoDovuto, String id, List<Extra> extra, Genitore genitore,
            float importoPagato, String descrizioneTassa, String descrizioneRata, 
            Date data, String nome) {
        super();
        this.importoDovuto = importoDovuto;
        this.id = id;
        this.extra = extra;
        this.genitore = genitore;
        this.importoPagato = importoPagato;
        this.descrizioneTassa = descrizioneTassa;
        this.descrizioneRata = descrizioneRata;
        this.data = data;
        this.nome = nome;
    }

    /**
     * Metodo che prende il campo Id
     * @param id il parametro inserito
     */
    public void setId(String id){
        this.id=id;
        }
    
    /**
     * Metodo che prende il campo id
     * @return id il parametro inserito
     */
    public String getId(){
        return this.id;
        }
    
    /**
     * Metodo che prende il valore importoDovuto
     * @param importoDovuto il parametro inserito
     */
    public void setImportoDovuto(float importoDovuto){
        this.importoDovuto=importoDovuto;
        }
    
    /**
     * Metodo che prende il valore importoDovuto
     * @return importoDovuto il parametro inserito
     */
    public float getImportoDovuto(){
        return this.importoDovuto;
        }

    /**
     * Metodo che prende il valore importoPagato
     * @param importoPagato il parametro inserito
     */
    public void setImportoPagato(float importoPagato){
        this.importoPagato=importoPagato;
        }
    
    /**
     * Metodo che prende il valore importoPagato
     * @return importoPagato il parametro inserito
     */
    public float getImportoPagato(){
        return this.importoPagato;
        }
    
    /**
     * Metodo che prende il valore descrizioneTassa
     * @param descrizioneTassa il parametro inserito
     */
    public void setDescrizioneTassa(String descrizioneTassa){
        this.descrizioneTassa=descrizioneTassa;
        }
    
    /**
     * Metodo che prende il valore descrizioneTassa
     * @return descrizioneTassa il parametro inserito
     */
    public String getDescrizioneTassa(){
        return this.descrizioneTassa;
        }
    
    /**
     * Metodo che prende il valore descrizioneRata
     * @param descrizioneRata il parametro inserito
     */
    public void setDescrizioneRata(String descrizioneRata){
        this.descrizioneRata=descrizioneRata;
        }
    
    /**
     * Metodo che prende il valore descrizioneRata
     * @return descrizioneRata il parametro inserito
     */
    public String getDescrizioneRata(){
        return this.descrizioneRata;
        }
    
    /**
     * Metodo che prende il valore nome
     * @param nome il parametro inserito
     */
    public void setNome(String nome){
        this.nome=nome;
        }
    
    /**
     * Metodo che prende il valore nome
     * @return nome il parametro inserito
     */
    public String getNome(){
        return this.nome;
        }
    
    
    /**
     * Metodo che prende il valore data
     * @param data il parametro inserito
     */
    public void setData(Date data){
        this.data=data;
        }
    
    /**
     * Metodo che prende il valore data
     * @return data il parametro inserito
     */
    public Date getData(){
        return this.data;
        }
    
    
    /**
     * Metodo che setta il parametro letto dalla classe Extra
     * @param extra è settato dopo la lettura
     */
    public void setExtra(List<Extra> extra) {
        this.extra = extra;
    }

    /**
     * Metodo che prende il parametro letto dalla classe Extra
     * @return extra preso dalla lettura
     */
    public List<Extra> getExtra() {
        return extra;
    }

    /**
     * Metodo che setta il parametro letto dalla classe Genitore
     * @param genitore è settato dopo la lettura
     */
    public void setGenitore(Genitore genitore) {
        this.genitore = genitore;
    }

    /**
     * Metodo che prende il parametro letto dalla classe genitore
     * @return genitore preso dalla lettura
     */
    public Genitore getGenitore() {
        return genitore;
    }
}
