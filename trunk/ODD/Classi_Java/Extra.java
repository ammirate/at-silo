package atsilo;

import java.sql.Date;

public class Extra {
	
	private float importo;
	private String descrizione;
	private String id;
	private Date dataInizio;
	private Date dataFine;
	
	public Extra(){}

	/**
	 * @return the importo
	 */
	public float getImporto() {
		return importo;
	}

	/**
	 * @param importo the importo to set
	 */
	public void setImporto(float importo) {
		this.importo = importo;
	}

	/**
	 * @return the descrizione
	 */
	public String getDescrizione() {
		return descrizione;
	}

	/**
	 * @param descrizione the descrizione to set
	 */
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the dataInizio
	 */
	public Date getDataInizio() {
		return dataInizio;
	}

	/**
	 * @param dataInizio the dataInizio to set
	 */
	public void setDataInizio(Date dataInizio) {
		this.dataInizio = dataInizio;
	}

	/**
	 * @return the dataFine
	 */
	public Date getDataFine() {
		return dataFine;
	}

	/**
	 * @param dataFine the dataFine to set
	 */
	public void setDataFine(Date dataFine) {
		this.dataFine = dataFine;
	}
	
	

}
