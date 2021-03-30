package pojo;

import java.util.HashSet;
import java.util.Set;

public class Orase  implements java.io.Serializable {


	private Integer idoras;
	private String nume;	
	private Set teatre = new HashSet(0);

	public Orase() {
	}

	public Orase(String nume) {
		this.nume = nume;		
		this.teatre = teatre;
	}

	public Integer getIdoras() {
		return this.idoras;
	}

	public void setIdoras(Integer idoras) {
		this.idoras = idoras;
	}
	public String getNume() {
		return this.nume;
	}

	public void setNume(String nume) {
		this.nume = nume;

	}
	public Set getTeatre() {
		return this.teatre;
	}

	public void setTeatre(Set teatre) {
		this.teatre = teatre;
	}
}




