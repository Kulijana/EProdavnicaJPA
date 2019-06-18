package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJIzlog database table.
 * 
 */
@Entity
@Table(name="ADJIzlog")
@NamedQuery(name="Izlog.findAll", query="SELECT i FROM Izlog i")
public class Izlog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idIzlog;

	//bi-directional many-to-one association to Korisnik
	@ManyToOne
	@JoinColumn(name="ADJKorisnik_idKorisnik")
	private Korisnik korisnik;

	//bi-directional many-to-one association to Proizvod
	@OneToMany(mappedBy="adjizlog")
	private List<Proizvod> proizvods;

	//bi-directional many-to-one association to Transakcija
	@OneToMany(mappedBy="adjizlog")
	private List<Transakcija> transakcijas;

	public Izlog() {
	}

	public int getIdIzlog() {
		return this.idIzlog;
	}

	public void setIdIzlog(int idIzlog) {
		this.idIzlog = idIzlog;
	}

	public Korisnik getKorisnik() {
		return this.korisnik;
	}

	public void setKorisnik(Korisnik korisnik) {
		this.korisnik = korisnik;
	}

	public List<Proizvod> getProizvods() {
		return this.proizvods;
	}

	public void setProizvods(List<Proizvod> proizvods) {
		this.proizvods = proizvods;
	}

	public Proizvod addAdjproizvod(Proizvod adjproizvod) {
		getProizvods().add(adjproizvod);
		adjproizvod.setIzlog(this);

		return adjproizvod;
	}

	public Proizvod removeAdjproizvod(Proizvod adjproizvod) {
		getProizvods().remove(adjproizvod);
		adjproizvod.setIzlog(null);

		return adjproizvod;
	}

	public List<Transakcija> getTransakcijas() {
		return this.transakcijas;
	}

	public void setTransakcijas(List<Transakcija> transakcijas) {
		this.transakcijas = transakcijas;
	}

	public Transakcija addAdjtransakcija(Transakcija adjtransakcija) {
		getTransakcijas().add(adjtransakcija);
		adjtransakcija.setIzlog(this);

		return adjtransakcija;
	}

	public Transakcija removeAdjtransakcija(Transakcija adjtransakcija) {
		getTransakcijas().remove(adjtransakcija);
		adjtransakcija.setIzlog(null);

		return adjtransakcija;
	}

}