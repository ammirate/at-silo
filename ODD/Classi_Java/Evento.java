package atsilo;

import java.sql.Date;

public class Evento {
	
	private String nome;
	private String descriziona;
	private String classe;
	private Date data;
	
	public Evento(){}

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * @return the descriziona
	 */
	public String getDescriziona() {
		return descriziona;
	}

	/**
	 * @param descriziona the descriziona to set
	 */
	public void setDescriziona(String descriziona) {
		this.descriziona = descriziona;
	}

	/**
	 * @return the classe
	 */
	public String getClasse() {
		return classe;
	}

	/**
	 * @param classe the classe to set
	 */
	public void setClasse(String classe) {
		this.classe = classe;
	}

	/**
	 * @return the data
	 */
	public Date getData() {
		return data;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(Date data) {
		this.data = data;
	}
	
	

}
