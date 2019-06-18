package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJKorisnik database table.
 * 
 */
@Entity
@Table(name="ADJKorisnik")
@NamedQuery(name="Korisnik.findAll", query="SELECT k FROM Korisnik k")
public class Korisnik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKorisnik;

	private String brojTelefona;

	private String imePrezime;

	private String password;

	private double stanjeRacuna;

	private String username;

	//bi-directional many-to-one association to Izlog
	@OneToMany(mappedBy="adjkorisnik")
	private List<Izlog> izlogs;

	//bi-directional many-to-one association to Transakcija
	@OneToMany(mappedBy="adjkorisnik")
	private List<Transakcija> transakcijas;

	//bi-directional many-to-many association to Uloga
	@ManyToMany(mappedBy="adjkorisniks")
	private List<Uloga> ulogas;

	public Korisnik() {
	}

	public int getIdKorisnik() {
		return this.idKorisnik;
	}

	public void setIdKorisnik(int idKorisnik) {
		this.idKorisnik = idKorisnik;
	}

	public String getBrojTelefona() {
		return this.brojTelefona;
	}

	public void setBrojTelefona(String brojTelefona) {
		this.brojTelefona = brojTelefona;
	}

	public String getImePrezime() {
		return this.imePrezime;
	}

	public void setImePrezime(String imePrezime) {
		this.imePrezime = imePrezime;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getStanjeRacuna() {
		return this.stanjeRacuna;
	}

	public void setStanjeRacuna(double stanjeRacuna) {
		this.stanjeRacuna = stanjeRacuna;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public List<Izlog> getIzlogs() {
		return this.izlogs;
	}

	public void setIzlogs(List<Izlog> izlogs) {
		this.izlogs = izlogs;
	}

	public Izlog addAdjizlog(Izlog adjizlog) {
		getIzlogs().add(adjizlog);
		adjizlog.setKorisnik(this);

		return adjizlog;
	}

	public Izlog removeAdjizlog(Izlog adjizlog) {
		getIzlogs().remove(adjizlog);
		adjizlog.setKorisnik(null);

		return adjizlog;
	}

	public List<Transakcija> getTransakcijas() {
		return this.transakcijas;
	}

	public void setTransakcijas(List<Transakcija> transakcijas) {
		this.transakcijas = transakcijas;
	}

	public Transakcija addAdjtransakcija(Transakcija adjtransakcija) {
		getTransakcijas().add(adjtransakcija);
		adjtransakcija.setKorisnik(this);

		return adjtransakcija;
	}

	public Transakcija removeAdjtransakcija(Transakcija adjtransakcija) {
		getTransakcijas().remove(adjtransakcija);
		adjtransakcija.setKorisnik(null);

		return adjtransakcija;
	}

	public List<Uloga> getUlogas() {
		return this.ulogas;
	}

	public void setUlogas(List<Uloga> ulogas) {
		this.ulogas = ulogas;
	}

}