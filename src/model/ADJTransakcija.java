package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the ADJTransakcija database table.
 * 
 */
@Entity
@NamedQuery(name="ADJTransakcija.findAll", query="SELECT a FROM ADJTransakcija a")
public class ADJTransakcija implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idTransakcija;

	private double kolicina;

	//bi-directional many-to-one association to ADJProizvod
	@ManyToOne
	@JoinColumn(name="ADJProizvod_idProizvod")
	private ADJProizvod adjproizvod;

	//bi-directional many-to-one association to ADJKorisnik
	@ManyToOne
	@JoinColumn(name="ADJKorisnik_idKorisnik")
	private ADJKorisnik adjkorisnik;

	//bi-directional many-to-one association to ADJIzlog
	@ManyToOne
	@JoinColumn(name="ADJIzlog_idIzlog")
	private ADJIzlog adjizlog;

	public ADJTransakcija() {
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

	public ADJProizvod getAdjproizvod() {
		return this.adjproizvod;
	}

	public void setAdjproizvod(ADJProizvod adjproizvod) {
		this.adjproizvod = adjproizvod;
	}

	public ADJKorisnik getAdjkorisnik() {
		return this.adjkorisnik;
	}

	public void setAdjkorisnik(ADJKorisnik adjkorisnik) {
		this.adjkorisnik = adjkorisnik;
	}

	public ADJIzlog getAdjizlog() {
		return this.adjizlog;
	}

	public void setAdjizlog(ADJIzlog adjizlog) {
		this.adjizlog = adjizlog;
	}

}