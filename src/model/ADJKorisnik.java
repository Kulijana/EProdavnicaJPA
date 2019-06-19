package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJKorisnik database table.
 * 
 */
@Entity
@NamedQuery(name="ADJKorisnik.findAll", query="SELECT a FROM ADJKorisnik a")
public class ADJKorisnik implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idKorisnik;

	private String brojTelefona;

	private String imePrezime;

	private String password;

	private double stanjeRacuna;

	private String username;

	//bi-directional many-to-one association to ADJIzlog
	@OneToMany(mappedBy="adjkorisnik")
	private List<ADJIzlog> adjizlogs;

	//bi-directional many-to-many association to ADJUloga
	@ManyToMany(mappedBy="adjkorisniks")
	private List<ADJUloga> adjulogas;

	//bi-directional many-to-one association to ADJTransakcija
	@OneToMany(mappedBy="adjkorisnik")
	private List<ADJTransakcija> adjtransakcijas;

	public ADJKorisnik() {
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

	public List<ADJIzlog> getAdjizlogs() {
		return this.adjizlogs;
	}

	public void setAdjizlogs(List<ADJIzlog> adjizlogs) {
		this.adjizlogs = adjizlogs;
	}

	public ADJIzlog addAdjizlog(ADJIzlog adjizlog) {
		getAdjizlogs().add(adjizlog);
		adjizlog.setAdjkorisnik(this);

		return adjizlog;
	}

	public ADJIzlog removeAdjizlog(ADJIzlog adjizlog) {
		getAdjizlogs().remove(adjizlog);
		adjizlog.setAdjkorisnik(null);

		return adjizlog;
	}

	public List<ADJUloga> getAdjulogas() {
		return this.adjulogas;
	}

	public void setAdjulogas(List<ADJUloga> adjulogas) {
		this.adjulogas = adjulogas;
	}

	public List<ADJTransakcija> getAdjtransakcijas() {
		return this.adjtransakcijas;
	}

	public void setAdjtransakcijas(List<ADJTransakcija> adjtransakcijas) {
		this.adjtransakcijas = adjtransakcijas;
	}

	public ADJTransakcija addAdjtransakcija(ADJTransakcija adjtransakcija) {
		getAdjtransakcijas().add(adjtransakcija);
		adjtransakcija.setAdjkorisnik(this);

		return adjtransakcija;
	}

	public ADJTransakcija removeAdjtransakcija(ADJTransakcija adjtransakcija) {
		getAdjtransakcijas().remove(adjtransakcija);
		adjtransakcija.setAdjkorisnik(null);

		return adjtransakcija;
	}

}