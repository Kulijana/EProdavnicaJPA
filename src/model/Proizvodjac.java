package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJProizvodjac database table.
 * 
 */
@Entity
@Table(name="ADJProizvodjac")
@NamedQuery(name="Proizvodjac.findAll", query="SELECT p FROM Proizvodjac p")
public class Proizvodjac implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idProizvodjac;

	private String adresa;

	private String ime;

	//bi-directional many-to-one association to Proizvod
	@OneToMany(mappedBy="adjproizvodjac")
	private List<Proizvod> proizvods;

	public Proizvodjac() {
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

	public List<Proizvod> getProizvods() {
		return this.proizvods;
	}

	public void setProizvods(List<Proizvod> proizvods) {
		this.proizvods = proizvods;
	}

	public Proizvod addAdjproizvod(Proizvod adjproizvod) {
		getProizvods().add(adjproizvod);
		adjproizvod.setProizvodjac(this);

		return adjproizvod;
	}

	public Proizvod removeAdjproizvod(Proizvod adjproizvod) {
		getProizvods().remove(adjproizvod);
		adjproizvod.setProizvodjac(null);

		return adjproizvod;
	}

}