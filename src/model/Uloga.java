package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJUloga database table.
 * 
 */
@Entity
@Table(name="ADJUloga")
@NamedQuery(name="Uloga.findAll", query="SELECT u FROM Uloga u")
public class Uloga implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idUloga;

	private String ime;

	//bi-directional many-to-many association to Korisnik
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
	private List<Korisnik> korisniks;

	public Uloga() {
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

	public List<Korisnik> getKorisniks() {
		return this.korisniks;
	}

	public void setKorisniks(List<Korisnik> korisniks) {
		this.korisniks = korisniks;
	}

}