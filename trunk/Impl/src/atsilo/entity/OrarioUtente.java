package atsilo.entity;

/*
 *-----------------------------------------------------------------
 * This file is licensed under GPL 3.0:
 * http://www.gnu.org/licenses/gpl-3.0.html
 *-----------------------------------------------------------------
 * FILE: OrarioUtente.java
 *-----------------------------------------------------------------
 * PROGETTO: Atsilo
 *-----------------------------------------------------------------
 * OWNER
 * Antonio Barba, 13/11/2012 (non responsabile)
 * REVISION
 * Andrea Micco, 6/12/2012
 * Mariella Ferrara, 7/12/2012
 *-----------------------------------------------------------------
 */

public class OrarioUtente {
    
    private int  id;
    private String oraInizio;
    private String oraFine;
    private String descrizione;
    private String nome;
    private float prezzo;
    private String dataInizio;
    private String dataFine;
    
    /**
     * Costruttore vuoto
     */
    public OrarioUtente() {
    }

    /**
     * @param id il paramentro è fissato
     * @param oraInizio il paramentro è fissato
     * @param oraFine il paramentro è fissato
     * @param descrizione il paramentro è fissato
     * @param nome il parametro è fissato
     * @param prezzo il parametro è fissato
     * @param dataInizio il parametro è fissato
     * @param dataFine il parametro è fissato
     */
    public OrarioUtente(int id, String oraInizio, String oraFine,
            String descrizione, String nome, float prezzo, String dataInizio, String dataFine) {
        super();
        this.id = id;
        this.oraInizio = oraInizio;
        this.oraFine = oraFine;
        this.descrizione = descrizione;
        this.nome = nome;
        this.prezzo = prezzo;
        this.dataInizio=dataInizio;
        this.dataFine=dataFine;
    }


    /**
     * Metodo che setta il parametro id
     * @param id il parametro fissato
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     * Metodo che prende il parametro Id
     * @return id il parametro inserito
     */
    public int getId() {
        return id;
    }

    /**
     * Metodo che setta il parametro oraInizio
     * @param oraInizio il parametro fissato
     */
    public void setOraInizio(String oraInizio) {
        this.oraInizio = oraInizio;
    }

    /**
     * Metodo che prende il parametro oraInizio
     * @return oraInizio il parametro inserito
     */
    public String getOraInizio() {
        return oraInizio;
    }

    /**
     * Metodo che setta il parametro oraFine
     * @param oraFine il parametro fissato
     */
    public void setOraFine(String oraFine) {
        this.oraFine = oraFine;
    }

    /**
     * Metodo che prende il parametro orario fine
     * @return oraFine il parametro inserito
     */
    public String getOraFine() {
        return oraFine;
    }

    /**
     * Metodo che setta il parametro descrizione
     * @param descrizione il parametro fissato
     */
    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }
    
    /**
     * Metodo che prende il parametro descrizione
     * @return descrizone il parametro inserito
     */
    public String getDescrizione() {
        return descrizione;
    }
    
    /**
    * Metodo che setta il parametro nome
    * @param nome il parametro fissato
    */
   public void setNome(String nome) {
       this.nome = nome;
   }
   
   /**
    * Metodo che prende il parametro nome
    * @return nome il parametro inserito
    */
   public String getNome() {
       return nome;
   }
   
   /**
   *  Metodo che setta il parametro prezzo
   * @param prezzo il parametro fissato
   */
  public void setPrezzo(float prezzo) {
      this.prezzo = prezzo;
  }
  
  /**
   * Metodo che prende il parametro prezzo
   * @return prezzo il parametro inserito
   */
  public float getPrezzo() {
      return prezzo;
  }
  
  
  /**
   *  Metodo che setta il parametro dataInizio
   * @param dataInizio il parametro fissato
   */
  public void setDataInizio(String dataInizio) {
      this.dataInizio = dataInizio;
  }
  
  /**
   * Metodo che prende il parametro dataFine
   * @return dataFine il parametro inserito
   */
  public String getdataFine() {
      return dataFine;
  }
  
  
  
  
  
  
}
