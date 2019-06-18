package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the ADJTransakcija database table.
 * 
 */
@Entity
@Table(name="ADJTransakcija")
@NamedQuery(name="Transakcija.findAll", query="SELECT t FROM Transakcija t")
public class Transakcija implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTransakcija;

	private double kolicina;

	//bi-directional many-to-one association to Izlog
	@ManyToOne
	@JoinColumn(name="ADJIzlog_idIzlog")
	private Izlog izlog;

	//bi-directional many-to-one association to Korisnik
	@ManyToOne
	@JoinColumn(name="ADJKorisnik_idKorisnik")
	private Korisnik korisnik;

	//bi-directional many-to-one association to Proizvod
	@ManyToOne
	@JoinColumn(name="ADJProizvod_idProizvod")
	private Proizvod proizvod;

	public Transakcija() {
	}

	public int getIdTransakcija() {
		return this.idTransakcija;
	}

	public void setIdTransakcija(int idTransakcija) {
		this.idTransakcija = idTransakcija;
	}

	public double getKolicina() {
		return this.kolicina;
	}

	public void setKolicina(double kolicina) {
		this.kolicina = kolicina;
	}

	public Izlog getIzlog() {
		return this.izlog;
	}

	public void setIzlog(Izlog izlog) {
		this.izlog = izlog;
	}

	public Korisnik getKorisnik() {
		return this.korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	public Proizvod getProizvod() {
		return this.proizvod;
	}

	public void setProizvod(Proizvod proizvod) {
		this.proizvod = proizvod;
	}

}