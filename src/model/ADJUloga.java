package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJUloga database table.
 * 
 */
@Entity
@NamedQuery(name="ADJUloga.findAll", query="SELECT a FROM ADJUloga a")
public class ADJUloga implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUloga;

	private String ime;

	//bi-directional many-to-many association to ADJKorisnik
	@ManyToMany
	@JoinTable(
		name="ADJKorisnikUloga"
		, joinColumns={
			@JoinColumn(name="ADJUloga_idUloga")
			}
		, inverseJoinColumns={
			@JoinColumn(name="ADJKorisnik_idKorisnik")
			}
		)
	private List<ADJKorisnik> adjkorisniks;

	public ADJUloga() {
	}

	public int getIdUloga() {
		return this.idUloga;
	}

	public void setIdUloga(int idUloga) {
		this.idUloga = idUloga;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public List<ADJKorisnik> getAdjkorisniks() {
		return this.adjkorisniks;
	}

	public void setAdjkorisniks(List<ADJKorisnik> adjkorisniks) {
		this.adjkorisniks = adjkorisniks;
	}

}