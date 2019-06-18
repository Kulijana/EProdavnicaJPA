package model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the ADJProizvod database table.
 * 
 */
@Entity
@Table(name="ADJProizvod")
@NamedQuery(name="Proizvod.findAll", query="SELECT p FROM Proizvod p")
public class Proizvod implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int idProizvod;

	private double cena;

	private String naziv;

	//bi-directional many-to-one association to Izlog
	@ManyToOne
	@JoinColumn(name="ADJIzlog_idIzlog")
	private Izlog izlog;

	//bi-directional many-to-one association to Proizvodjac
	@ManyToOne
	@JoinColumn(name="ADJProizvodjac_idProizvodjac")
	private Proizvodjac proizvodjac;

	//bi-directional many-to-one association to Transakcija
	@OneToMany(mappedBy="adjproizvod")
	private List<Transakcija> transakcijas;

	public Proizvod() {
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

	public Izlog getIzlog() {
		return this.izlog;
	}

	public void setIzlog(Izlog izlog) {
		this.izlog = izlog;
	}

	public Proizvodjac getProizvodjac() {
		return this.proizvodjac;
	}

	public void setProizvodjac(Proizvodjac proizvodjac) {
		this.proizvodjac = proizvodjac;
	}

	public List<Transakcija> getTransakcijas() {
		return this.transakcijas;
	}

	public void setTransakcijas(List<Transakcija> transakcijas) {
		this.transakcijas = transakcijas;
	}

	public Transakcija addAdjtransakcija(Transakcija adjtransakcija) {
		getTransakcijas().add(adjtransakcija);
		adjtransakcija.setProizvod(this);

		return adjtransakcija;
	}

	public Transakcija removeAdjtransakcija(Transakcija adjtransakcija) {
		getTransakcijas().remove(adjtransakcija);
		adjtransakcija.setProizvod(null);

		return adjtransakcija;
	}

}