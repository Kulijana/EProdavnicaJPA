package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJProizvod database table.
 * 
 */
@Entity
@NamedQuery(name="ADJProizvod.findAll", query="SELECT a FROM ADJProizvod a")
public class ADJProizvod implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idProizvod;

	private double cena;

	private String naziv;

	//bi-directional many-to-one association to ADJProizvodjac
	@ManyToOne
	@JoinColumn(name="ADJProizvodjac_idProizvodjac")
	private ADJProizvodjac adjproizvodjac;

	//bi-directional many-to-one association to ADJIzlog
	@ManyToOne
	@JoinColumn(name="ADJIzlog_idIzlog")
	private ADJIzlog adjizlog;

	//bi-directional many-to-one association to ADJTransakcija
	@OneToMany(mappedBy="adjproizvod")
	private List<ADJTransakcija> adjtransakcijas;

	public ADJProizvod() {
	}

	public int getIdProizvod() {
		return this.idProizvod;
	}

	public void setIdProizvod(int idProizvod) {
		this.idProizvod = idProizvod;
	}

	public double getCena() {
		return this.cena;
	}

	public void setCena(double cena) {
		this.cena = cena;
	}

	public String getNaziv() {
		return this.naziv;
	}

	public void setNaziv(String naziv) {
		this.naziv = naziv;
	}

	public ADJProizvodjac getAdjproizvodjac() {
		return this.adjproizvodjac;
	}

	public void setAdjproizvodjac(ADJProizvodjac adjproizvodjac) {
		this.adjproizvodjac = adjproizvodjac;
	}

	public ADJIzlog getAdjizlog() {
		return this.adjizlog;
	}

	public void setAdjizlog(ADJIzlog adjizlog) {
		this.adjizlog = adjizlog;
	}

	public List<ADJTransakcija> getAdjtransakcijas() {
		return this.adjtransakcijas;
	}

	public void setAdjtransakcijas(List<ADJTransakcija> adjtransakcijas) {
		this.adjtransakcijas = adjtransakcijas;
	}

	public ADJTransakcija addAdjtransakcija(ADJTransakcija adjtransakcija) {
		getAdjtransakcijas().add(adjtransakcija);
		adjtransakcija.setAdjproizvod(this);

		return adjtransakcija;
	}

	public ADJTransakcija removeAdjtransakcija(ADJTransakcija adjtransakcija) {
		getAdjtransakcijas().remove(adjtransakcija);
		adjtransakcija.setAdjproizvod(null);

		return adjtransakcija;
	}

}