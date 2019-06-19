package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJIzlog database table.
 * 
 */
@Entity
@NamedQuery(name="ADJIzlog.findAll", query="SELECT a FROM ADJIzlog a")
public class ADJIzlog implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idIzlog;

	private String naziv;

	//bi-directional many-to-one association to ADJKorisnik
	@ManyToOne
	@JoinColumn(name="ADJKorisnik_idKorisnik")
	private ADJKorisnik adjkorisnik;

	//bi-directional many-to-one association to ADJProizvod
	@OneToMany(mappedBy="adjizlog")
	private List<ADJProizvod> adjproizvods;

	//bi-directional many-to-one association to ADJTransakcija
	@OneToMany(mappedBy="adjizlog")
	private List<ADJTransakcija> adjtransakcijas;

	public ADJIzlog() {
	}

	public int getIdIzlog() {
		return this.idIzlog;
	}

	public void setIdIzlog(int idIzlog) {
		this.idIzlog = idIzlog;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public ADJKorisnik getAdjkorisnik() {
		return this.adjkorisnik;
	}

	public void setAdjkorisnik(ADJKorisnik adjkorisnik) {
		this.adjkorisnik = adjkorisnik;
	}

	public List<ADJProizvod> getAdjproizvods() {
		return this.adjproizvods;
	}

	public void setAdjproizvods(List<ADJProizvod> adjproizvods) {
		this.adjproizvods = adjproizvods;
	}

	public ADJProizvod addAdjproizvod(ADJProizvod adjproizvod) {
		getAdjproizvods().add(adjproizvod);
		adjproizvod.setAdjizlog(this);

		return adjproizvod;
	}

	public ADJProizvod removeAdjproizvod(ADJProizvod adjproizvod) {
		getAdjproizvods().remove(adjproizvod);
		adjproizvod.setAdjizlog(null);

		return adjproizvod;
	}

	public List<ADJTransakcija> getAdjtransakcijas() {
		return this.adjtransakcijas;
	}

	public void setAdjtransakcijas(List<ADJTransakcija> adjtransakcijas) {
		this.adjtransakcijas = adjtransakcijas;
	}

	public ADJTransakcija addAdjtransakcija(ADJTransakcija adjtransakcija) {
		getAdjtransakcijas().add(adjtransakcija);
		adjtransakcija.setAdjizlog(this);

		return adjtransakcija;
	}

	public ADJTransakcija removeAdjtransakcija(ADJTransakcija adjtransakcija) {
		getAdjtransakcijas().remove(adjtransakcija);
		adjtransakcija.setAdjizlog(null);

		return adjtransakcija;
	}

}