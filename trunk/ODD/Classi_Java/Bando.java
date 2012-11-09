package atsilo;

import java.sql.Date;

public class Bando {
	
	private String id;
	private Date dataInizio;
	private Date dafaFine;
	
	public Bando(){}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Date getDataInizio() {
		return dataInizio;
	}

	public void setDataInizio(Date dataInizio) {
		this.dataInizio = dataInizio;
	}

	public Date getDafaFine() {
		return dafaFine;
	}

	public void setDafaFine(Date dafaFine) {
		this.dafaFine = dafaFine;
	}
	
	

}
