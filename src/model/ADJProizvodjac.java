package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJProizvodjac database table.
 * 
 */
@Entity
@NamedQuery(name="ADJProizvodjac.findAll", query="SELECT a FROM ADJProizvodjac a")
public class ADJProizvodjac implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idProizvodjac;

	private String adresa;

	private String ime;

	//bi-directional many-to-one association to ADJProizvod
	@OneToMany(mappedBy="adjproizvodjac")
	private List<ADJProizvod> adjproizvods;

	public ADJProizvodjac() {
	}

	public int getIdProizvodjac() {
		return this.idProizvodjac;
	}

	public void setIdProizvodjac(int idProizvodjac) {
		this.idProizvodjac = idProizvodjac;
	}

	public String getAdresa() {
		return this.adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}

	public String getIme() {
		return this.ime;
	}

	public void setIme(String ime) {
		this.ime = ime;
	}

	public List<ADJProizvod> getAdjproizvods() {
		return this.adjproizvods;
	}

	public void setAdjproizvods(List<ADJProizvod> adjproizvods) {
		this.adjproizvods = adjproizvods;
	}

	public ADJProizvod addAdjproizvod(ADJProizvod adjproizvod) {
		getAdjproizvods().add(adjproizvod);
		adjproizvod.setAdjproizvodjac(this);

		return adjproizvod;
	}

	public ADJProizvod removeAdjproizvod(ADJProizvod adjproizvod) {
		getAdjproizvods().remove(adjproizvod);
		adjproizvod.setAdjproizvodjac(null);

		return adjproizvod;
	}

}