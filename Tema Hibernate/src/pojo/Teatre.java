package pojo;

import java.util.HashSet;
import java.util.Set;

public class Teatre  implements java.io.Serializable {

	private Integer idteatru;
	private Orase orase;
	private String nume;
	private String adresa;
	private Integer capacitate;
	private Set actori = new HashSet(0);

	public Teatre() {
	}

	public Teatre(Orase orase, String nume, String adresa, Integer capacitate, Set actori) {
		this.orase = orase;
		this.nume = nume;
		this.adresa = adresa;
		this.capacitate = capacitate;
		this.actori = actori;
	}

	public Integer getIdteatru() {
		return this.idteatru;
	}

	public void setIdteatru(Integer idteatru) {
		this.idteatru = idteatru;
	}
	
	public Orase getOrase() {
		return this.orase;
	}

	public void setOrase(Orase orase) {
		this.orase = orase;
	}
		
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}
	public Integer getCapacitate() {
		return this.capacitate;
	}

	public void setCapacitate(Integer capacitate) {
		this.capacitate = capacitate;
	}
	public Set getActori() {
		return this.actori;
	}

	public void setActori(Set actori) {
		this.actori = actori;
	}
}




