package pojo;

import java.util.Date;

public class Actori  implements java.io.Serializable {

	private Integer idactor;
	private Teatre teatre;	
	private String nume;
	private String prenume;
	private Integer salariu;
	
	public Actori() {
	}

	public Actori(Teatre teatre, String nume, String prenume, Integer salariu) {
		this.teatre = teatre;
		this.nume = nume;
		this.prenume = prenume;
		this.salariu = salariu;
	}

	public Integer getIdactor() {
		return this.idactor;
	}

	public void setIdactor(Integer idactor) {
		this.idactor = idactor;
	}
	public Teatre getTeatre() {
		return this.teatre;
	}

	public void setTeatre(Teatre teatre) {
		this.teatre = teatre;
	}

	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	public String getPrenume() {
		return this.prenume;
	}

	public void setPrenume(String prenume) {
		this.prenume = prenume;
	}
	public int getSalariu() {
		return this.salariu;
	}

	public void setSalariu(int  salariu) {
		this.salariu = salariu;
	}
}




