create table ADJKorisnik
(
  idKorisnik   int auto_increment
    primary key,
  imePrezime   varchar(45)  not null,
  brojTelefona varchar(45)  not null,
  username     varchar(45)  not null,
  password     varchar(200) not null,
  stanjeRacuna double       null
);

create table ADJIzlog
(
  idIzlog                int auto_increment
    primary key,
  naziv                  varchar(50) null,
  ADJKorisnik_idKorisnik int         not null,
  constraint fk_ADJIzlog_ADJKorisinik1
    foreign key (ADJKorisnik_idKorisnik) references ADJKorisnik (idKorisnik)
);

create index fk_ADJIzlog_ADJKorisinik1_idx
  on ADJIzlog (ADJKorisnik_idKorisnik);

create table ADJProizvodjac
(
  idProizvodjac int auto_increment
    primary key,
  ime           varchar(45) null,
  adresa        varchar(45) null
);

create table ADJProizvod
(
  idProizvod                   int auto_increment
    primary key,
  naziv                        varchar(45) not null,
  cena                         double      not null,
  ADJProizvodjac_idProizvodjac int         not null,
  ADJIzlog_idIzlog             int         null,
  constraint fk_ADJProizvod_ADJIzlog1
    foreign key (ADJIzlog_idIzlog) references ADJIzlog (idIzlog),
  constraint fk_ADJProizvod_ADJProizvodjac1
    foreign key (ADJProizvodjac_idProizvodjac) references ADJProizvodjac (idProizvodjac)
);

create index fk_ADJProizvod_ADJIzlog1_idx
  on ADJProizvod (ADJIzlog_idIzlog);

create index fk_ADJProizvod_ADJProizvodjac1_idx
  on ADJProizvod (ADJProizvodjac_idProizvodjac);

create table ADJTransakcija
(
  idTransakcija          int auto_increment
    primary key,
  kolicina               double not null,
  ADJProizvod_idProizvod int    not null,
  ADJKorisnik_idKorisnik int    not null,
  ADJIzlog_idIzlog       int    not null,
  constraint fk_ADJTransakcija_ADJIzlog1
    foreign key (ADJIzlog_idIzlog) references ADJIzlog (idIzlog),
  constraint fk_ADJTransakcija_ADJKorisinik1
    foreign key (ADJKorisnik_idKorisnik) references ADJKorisnik (idKorisnik),
  constraint fk_ADJTransakcija_ADJProizvod1
    foreign key (ADJProizvod_idProizvod) references ADJProizvod (idProizvod)
);

create index fk_ADJTransakcija_ADJIzlog1_idx
  on ADJTransakcija (ADJIzlog_idIzlog);

create index fk_ADJTransakcija_ADJKorisinik1_idx
  on ADJTransakcija (ADJKorisnik_idKorisnik);

create index fk_ADJTransakcija_ADJProizvod1_idx
  on ADJTransakcija (ADJProizvod_idProizvod);

create table ADJUloga
(
  idUloga int auto_increment
    primary key,
  ime     varchar(45) null
);

create table ADJKorisnikUloga
(
  ADJKorisnik_idKorisnik int not null,
  ADJUloga_idUloga       int not null,
  primary key (ADJKorisnik_idKorisnik, ADJUloga_idUloga),
  constraint fk_ADJKorisinik_has_ADJUloga_ADJKorisinik1
    foreign key (ADJKorisnik_idKorisnik) references ADJKorisnik (idKorisnik),
  constraint fk_ADJKorisinik_has_ADJUloga_ADJUloga1
    foreign key (ADJUloga_idUloga) references ADJUloga (idUloga)
);

create index fk_ADJKorisinik_has_ADJUloga_ADJKorisinik1_idx
  on ADJKorisnikUloga (ADJKorisnik_idKorisnik);

create index fk_ADJKorisinik_has_ADJUloga_ADJUloga1_idx
  on ADJKorisnikUloga (ADJUloga_idUloga);

create table BGProizvodjac
(
  idProizvodjac int(10) auto_increment
    primary key,
  naziv         varchar(50) null,
  mesto         varchar(50) null
);

create table BgMaterijal
(
  idMaterijal int(10) auto_increment
    primary key,
  ime         varchar(30) null
);

create table DMJelo
(
  IdJela    int         not null
    primary key,
  NazivJela varchar(30) not null,
  CenaJela  int         not null
);

create table DMObrok
(
  IdObrok            int         not null
    primary key,
  VrstaObroka        varchar(30) not null,
  VremePocetkaObroka int         not null,
  VremeKrajaObroka   int         not null
);

create table DMObrok_Jelo
(
  DMObrok_IdObrok int not null,
  DMJelo_IdJela   int not null,
  primary key (DMObrok_IdObrok, DMJelo_IdJela),
  constraint FK_ASS_3
    foreign key (DMObrok_IdObrok) references DMObrok (IdObrok),
  constraint FK_ASS_4
    foreign key (DMJelo_IdJela) references DMJelo (IdJela)
);

create table DMRestoran
(
  IdRestoran           int         not null
    primary key,
  NazivRestorana       varchar(30) not null,
  PocetakRadnogVremena int         not null,
  KrajRadnogVremena    int         not null
);

create table DMRestoran_Obrok
(
  DMRestoran_IdRestoran int not null,
  DMObrok_IdObrok       int not null,
  primary key (DMRestoran_IdRestoran, DMObrok_IdObrok),
  constraint FK_ASS_7
    foreign key (DMRestoran_IdRestoran) references DMRestoran (IdRestoran),
  constraint FK_ASS_8
    foreign key (DMObrok_IdObrok) references DMObrok (IdObrok)
);

create table DMUloga
(
  idUloge    int         not null
    primary key,
  nazivUloge varchar(50) not null
);

create table DMKorisnik
(
  IdKorisnik       int         not null
    primary key,
  ImeKorisnika     varchar(30) not null,
  PrezimeKorisnika varchar(30) not null,
  AdresaKorisnik   varchar(30) not null,
  DMUloga_idUloge  int         not null,
  Sifra            varchar(30) not null,
  Username         varchar(30) not null,
  constraint DMKorisnik_DMUloga_FK
    foreign key (DMUloga_idUloge) references DMUloga (idUloge)
);

create table DMJelo_Korisnik
(
  DMJelo_IdJela         int not null,
  DMKorisnik_IdKorisnik int not null,
  KolicinaJela          int not null,
  primary key (DMJelo_IdJela, DMKorisnik_IdKorisnik),
  constraint FK_ASS_10
    foreign key (DMKorisnik_IdKorisnik) references DMKorisnik (IdKorisnik),
  constraint FK_ASS_9
    foreign key (DMJelo_IdJela) references DMJelo (IdJela)
);

create table DarkoArnautGrad
(
  idGrada     int auto_increment
    primary key,
  imeGrada    varchar(50) not null,
  skracenoIme varchar(50) not null
);

create table DarkoArnautAerodrom
(
  idAerodroma    int auto_increment
    primary key,
  nazivAerodroma varchar(50) not null,
  idGrada        int         not null,
  constraint DarkoArnautGrad_FK
    foreign key (idGrada) references DarkoArnautGrad (idGrada)
);

create table DarkoArnautLet
(
  idLeta       int auto_increment
    primary key,
  kompanija    varchar(50) not null,
  idAerodromaP int         not null,
  idAerodromaD int         not null,
  constraint DarkoArnautAerodrom_FK
    foreign key (idAerodromaD) references DarkoArnautAerodrom (idAerodroma),
  constraint DarkoArnautAerodrom_FKv1
    foreign key (idAerodromaP) references DarkoArnautAerodrom (idAerodroma)
);

create table DarkoArnautUloga
(
  idUloge int         not null
    primary key,
  uloga   varchar(20) not null
);

create table DarkoArnautKorisnik
(
  idKorisnika              int auto_increment
    primary key,
  ime                      varchar(50)  not null,
  prezime                  varchar(50)  not null,
  username                 varchar(50)  not null,
  password                 varchar(200) not null,
  DarkoArnautUloga_idUloge int          null,
  constraint username
    unique (username),
  constraint DarkoArnautUloga_FK
    foreign key (DarkoArnautUloga_idUloge) references DarkoArnautUloga (idUloge)
);

create table DarkoArnautKarta
(
  idKarte               int auto_increment
    primary key,
  cena                  int not null,
  mesto                 int not null,
  DarkoArnautLet_idLeta int not null,
  idKorisnika           int null,
  constraint DarkoArnautKorisnik_FK
    foreign key (idKorisnika) references DarkoArnautKorisnik (idKorisnika),
  constraint DarkoArnautLet_FK
    foreign key (DarkoArnautLet_idLeta) references DarkoArnautLet (idLeta)
);

create table DavorDimitrovRadnik
(
  idr     int auto_increment
    primary key,
  ime     varchar(255) not null,
  prezime varchar(255) not null,
  user    varchar(255) not null,
  pass    varchar(255) not null
);

create table DavorDimitrovStudent
(
  ids     int auto_increment
    primary key,
  ime     varchar(255) not null,
  prezime varchar(255) not null,
  email   varchar(50)  not null,
  adresa  varchar(255) not null,
  user    varchar(255) not null,
  pass    varchar(255) not null
);

create table DavorDimitrovOvera
(
  ido   int auto_increment
    primary key,
  datum date not null,
  ids   int  not null,
  constraint Student_Overa_FK
    foreign key (ids) references DavorDimitrovStudent (ids)
);

create table DavorDimitrovUplata
(
  idu  int auto_increment
    primary key,
  cena double not null,
  ids  int    not null,
  constraint Student_Uplata_FK
    foreign key (ids) references DavorDimitrovStudent (ids)
);

create table DavorDimitrovPostanskaBaza
(
  idp    int auto_increment
    primary key,
  idu    int  not null,
  vremeU date not null,
  constraint Uplata_Posta_FK
    foreign key (idu) references DavorDimitrovUplata (idu)
);

create table DavorDimitrovStudentska
(
  idst int auto_increment
    primary key,
  ido  int null,
  idp  int null,
  idr  int not null,
  constraint Overa_Studentska_FK
    foreign key (ido) references DavorDimitrovOvera (ido),
  constraint Posta_Studentska_FK
    foreign key (idp) references DavorDimitrovPostanskaBaza (idp),
  constraint Radnik_Studentska_FK
    foreign key (idr) references DavorDimitrovRadnik (idr)
);

create table GaborProba
(
  IdProba int unsigned auto_increment
    primary key,
  Proba   varchar(45) null
);

create table GaborTeam
(
  Id_Team    int unsigned auto_increment
    primary key,
  Naziv_Team varchar(45) not null,
  Liga_Team  varchar(45) not null
);

create table GaborIgrac
(
  Id_Igrac       int unsigned auto_increment
    primary key,
  Id_Team        int(11) unsigned not null,
  Ime_Igrac      varchar(45)      null,
  Prezime_Igrac  varchar(45)      null,
  Pozicija_Igrac varchar(45)      null,
  constraint IdTeam
    foreign key (Id_Team) references GaborTeam (Id_Team)
);

create index Id_Team_idx
  on GaborIgrac (Id_Team);

create table GaborTuri
(
  idGaborTuri int         not null
    primary key,
  ime         varchar(45) null
);

create table GaborUloga
(
  IdUloga int unsigned auto_increment
    primary key,
  Uloga   varchar(45) not null
);

create table GaborUser
(
  Id_User       int unsigned auto_increment
    primary key,
  Ime           varchar(45)  null,
  Prezime       varchar(45)  null,
  DatumRodjenja date         null,
  Kredit        int(10)      null,
  IdUserUloga   int unsigned not null,
  password      varchar(45)  not null,
  constraint IdUlogaUser
    foreign key (IdUserUloga) references GaborUloga (IdUloga)
);

create table GaborTiket
(
  Id_Tiket int unsigned auto_increment
    primary key,
  Id_User  int unsigned null,
  Status   varchar(45)  null,
  Cena     int(10)      null,
  Dobitak  int(10)      null,
  constraint Id_User
    foreign key (Id_User) references GaborUser (Id_User)
);

create index Id_User_idx
  on GaborTiket (Id_User);

create index IdUloga_idx
  on GaborUser (IdUserUloga);

create table GaborUtakmica
(
  Id_Utakmica int unsigned auto_increment
    primary key,
  Kvota       int          null,
  Id_Team1    int unsigned not null,
  Id_Team2    int unsigned not null,
  Status      varchar(45)  null,
  constraint Id_Team1
    foreign key (Id_Team1) references GaborTeam (Id_Team),
  constraint Id_Team2
    foreign key (Id_Team2) references GaborTeam (Id_Team)
);

create table GaborTiketUtakmica
(
  Id_TiketUtakmica int unsigned auto_increment
    primary key,
  Id_Utakmica      int unsigned not null,
  Id_Tiket         int unsigned not null,
  constraint Id_Tiket
    foreign key (Id_Tiket) references GaborTiket (Id_Tiket),
  constraint Id_Utakmica
    foreign key (Id_Utakmica) references GaborUtakmica (Id_Utakmica)
);

create index Id_Tiket_idx
  on GaborTiketUtakmica (Id_Tiket);

create index Id_Utakmica_idx
  on GaborTiketUtakmica (Id_Utakmica);

create index Id_Team1_idx
  on GaborUtakmica (Id_Team1);

create index Id_Team2_idx
  on GaborUtakmica (Id_Team2);

create table Glumac
(
  idGlumac int auto_increment
    primary key,
  ime      varchar(45) null,
  prezime  varchar(45) null,
  jmbg     varchar(45) null
);

create table IDJSport
(
  IdSporta    int         not null
    primary key,
  NazivSporta varchar(50) not null
);

create table IDJUloga
(
  idUloge    int         not null
    primary key,
  nazivUloge varchar(50) not null
);

create table IDJKorisnik
(
  IdKorisnika      int         not null
    primary key,
  Username         varchar(15) not null,
  Sifra            varchar(15) not null,
  Adresa           varchar(30) null,
  IDJUloga_idUloge int         not null,
  constraint IDJKorisnik_IDJUloga_FK
    foreign key (IDJUloga_idUloge) references IDJUloga (idUloge)
);

create table IDJTiket
(
  IdTiketa                int not null
    primary key,
  Uplata                  int not null,
  Bonus                   int not null,
  Dobitak                 int null,
  IDJKorisnik_IdKorisnika int null,
  constraint IDJTiket_IDJKorisnik_FK
    foreign key (IDJKorisnik_IdKorisnika) references IDJKorisnik (IdKorisnika)
);

create table IDJUtakmica
(
  IdUtakmice        int         not null
    primary key,
  Domacin           varchar(20) not null,
  Gost              varchar(20) not null,
  IDJSport_IdSporta int         null,
  constraint IDJUtakmica_IDJSport_FK
    foreign key (IDJSport_IdSporta) references IDJSport (IdSporta)
);

create table IDJTip
(
  IdTipa                 int         not null
    primary key,
  NazivTipa              varchar(20) not null,
  Kvota                  double      not null,
  IDJUtakmica_IdUtakmice int         null,
  constraint IDJTip_IDJUtakmica_FK
    foreign key (IDJUtakmica_IdUtakmice) references IDJUtakmica (IdUtakmice)
);

create table IDJOdigrao
(
  IDJTip_IdTipa     int not null,
  IDJTiket_IdTiketa int not null,
  primary key (IDJTip_IdTipa, IDJTiket_IdTiketa),
  constraint FK_ASS_1
    foreign key (IDJTip_IdTipa) references IDJTip (IdTipa),
  constraint FK_ASS_2
    foreign key (IDJTiket_IdTiketa) references IDJTiket (IdTiketa)
);

create table IvStUloga
(
  idUl  int auto_increment
    primary key,
  naziv varchar(45) not null
);

create table IvStKorisnik
(
  idKor    int         not null
    primary key,
  email    varchar(45) not null,
  password varchar(45) not null,
  ime      varchar(45) null,
  prezime  varchar(45) null,
  telefon  varchar(45) null,
  idUl     int         not null,
  constraint fk_idUloga
    foreign key (idUl) references IvStUloga (idUl)
      on update cascade on delete cascade
);

create index fk_IvStKorisnik_IvStUloga1_idx
  on IvStKorisnik (idUl);

create table IvStPacijent
(
  idKor int         not null
    primary key,
  jmbg  varchar(14) null,
  pol   varchar(1)  null,
  constraint fk_idKorPac
    foreign key (idKor) references IvStKorisnik (idKor)
      on update cascade on delete cascade
);

create table IvStDijagnoza
(
  idDij           int          not null
    primary key,
  anamneza        varchar(500) null,
  ostalaOboljenja varchar(500) null,
  nalazi          varchar(500) null,
  dijagnoza       varchar(500) not null,
  terapija        varchar(500) not null,
  idPac           int          not null,
  constraint fk_idPac
    foreign key (idPac) references IvStPacijent (idKor)
      on update cascade on delete cascade
);

create index fk_table5_IvStPacijent1_idx
  on IvStDijagnoza (idPac);

create table IvStZaposleni
(
  idKor int not null
    primary key,
  constraint fk_idKorZap
    foreign key (idKor) references IvStKorisnik (idKor)
      on update cascade on delete cascade
);

create table IvStPoseta
(
  idPos    int auto_increment
    primary key,
  datum    varchar(20)  not null,
  opis     varchar(500) null,
  idKorZap int          not null,
  idKorPac int          not null,
  constraint fk_IvStPoseta_idPac
    foreign key (idKorPac) references IvStPacijent (idKor)
      on update cascade on delete cascade,
  constraint fk_IvStPoseta_idZap
    foreign key (idKorZap) references IvStZaposleni (idKor)
      on update cascade on delete cascade
);

create index fk_IvStPoseta_IvStPacijent1_idx
  on IvStPoseta (idKorPac);

create index fk_IvStPoseta_IvStZaposleni1_idx
  on IvStPoseta (idKorZap);

create table KATEGORIJA
(
  IDKATEGORIJE    int auto_increment
    primary key,
  NAZIVKATEGORIJE varchar(20) null
);

create table CLAN
(
  CLANSKIBROJ    int auto_increment
    primary key,
  IDKATEGORIJE   int         null,
  IME            varchar(50) null,
  PREZIME        varchar(50) null,
  ADRESA         varchar(50) null,
  DATUM_RODJENJA date        null,
  DATUM_UPISA    date        null,
  constraint FK_CLAN_REFERENCE_KATEGORI
    foreign key (IDKATEGORIJE) references KATEGORIJA (IDKATEGORIJE)
);

create table KNJIGA
(
  ID_KNJIGE      int auto_increment
    primary key,
  NASLOV         varchar(50) null,
  AUTOR          varchar(50) null,
  GODINA_IZDANJA varchar(50) null,
  IZDAVAC        varchar(50) null,
  SLIKA          longblob    null
);

create table Korisnik
(
  idkorisnik int auto_increment
    primary key,
  ime        varchar(300) null,
  password   varchar(300) null,
  prezime    varchar(300) null,
  username   varchar(300) null
);

create table MMAdmin
(
  idAdmin  int auto_increment
    primary key,
  username varchar(45) not null,
  password varchar(45) not null
);

create table MMFakultet
(
  idFakultet int auto_increment
    primary key,
  naziv      varchar(45) not null,
  adresa     varchar(45) not null,
  grad       varchar(45) not null
);

create table MMProfesor
(
  idProfesor int auto_increment
    primary key,
  ime        varchar(45) not null,
  prezime    varchar(45) not null,
  idFakultet int         not null,
  slika      blob        null,
  idAdmin    int         not null,
  constraint FK_Profesor_Admin
    foreign key (idAdmin) references MMAdmin (idAdmin),
  constraint FK_Profesor_Fakultet
    foreign key (idFakultet) references MMFakultet (idFakultet)
);

create index FK_Profesor_Admin_idx
  on MMProfesor (idAdmin);

create index FK_Profesor_Fakultet_idx
  on MMProfesor (idFakultet);

create table MMStudent
(
  idStudent  int auto_increment
    primary key,
  ime        varchar(45) not null,
  prezime    varchar(45) not null,
  username   varchar(45) not null,
  password   varchar(45) not null,
  idFakultet int         not null,
  constraint FK_Student_Fakultet
    foreign key (idFakultet) references MMFakultet (idFakultet)
);

create table MMOcena
(
  idOcenaKomentar int auto_increment
    primary key,
  komentar        varchar(999)  null,
  ocena           int           not null,
  idProfesor      int           not null,
  idStudent       int           not null,
  brojLajkova     int default 0 null,
  brojDislajkova  int default 0 null,
  constraint FK_Ocena_Profesor
    foreign key (idProfesor) references MMProfesor (idProfesor),
  constraint FK_Ocena_Student
    foreign key (idStudent) references MMStudent (idStudent)
);

create index FK_Ocena_Profesor_idx
  on MMOcena (idProfesor);

create index FK_Ocena_Student_idx
  on MMOcena (idStudent);

create index FK_Student_Fakultet_idx
  on MMStudent (idFakultet);

create table MMplace
(
  idMMplace int not null
    primary key,
  row       int null,
  number    int null
);

create table MMstadium
(
  idMMstadium int         not null
    primary key,
  name        varchar(45) null,
  capacity    int         null
);

create table MMteams
(
  idMMteams             varchar(45) not null
    primary key,
  home_wins             int         null,
  home_draws            int         null,
  home_lost             int         null,
  home_for              int         null,
  home_against          int         null,
  away_wins             int         null,
  away_draw             int         null,
  away_lost             int         null,
  away_for              int         null,
  away_against          int         null,
  MMstadium_idMMstadium int         null,
  constraint fk_MMteams_MMstadium
    foreign key (MMstadium_idMMstadium) references MMstadium (idMMstadium)
);

create table MMfixtures
(
  idMMfixtures  int         not null
    primary key,
  home_score    int         null,
  away_score    int         null,
  fixtures_date datetime    null,
  home_team     varchar(45) null,
  away_team     varchar(45) null,
  constraint fk_MMfixtures_MMteams1
    foreign key (home_team) references MMteams (idMMteams),
  constraint fk_MMfixtures_MMteams2
    foreign key (away_team) references MMteams (idMMteams)
);

create table MMplayers
(
  idMMplayer        int         not null
    primary key,
  first_name        varchar(45) null,
  last_name         varchar(45) null,
  position          varchar(45) null,
  goals_score       int         null,
  goals_conceded    int         null,
  assists           int         null,
  yellow_card       int         null,
  red_card          int         null,
  minute_played     int         null,
  MMteams_idMMteams varchar(45) null,
  constraint fk_MMplayers_MMteams1
    foreign key (MMteams_idMMteams) references MMteams (idMMteams)
);

create table MMgoals_scored
(
  idMMgoals_scored        int not null
    primary key,
  goal_time               int null,
  assisted_by             int null,
  MMplayers_idMMplayer    int null,
  MMfixtures_idMMfixtures int null,
  constraint fk_MMgoals_scored_MMfixtures1
    foreign key (MMfixtures_idMMfixtures) references MMfixtures (idMMfixtures),
  constraint fk_MMgoals_scored_MMplayers1
    foreign key (MMplayers_idMMplayer) references MMplayers (idMMplayer)
);

create table MMplayer_match
(
  goals_scored            int null,
  assists                 int null,
  mins_played             int null,
  yellow_card             int null,
  red_card                int null,
  MMplayers_idMMplayer    int not null,
  MMfixtures_idMMfixtures int not null,
  primary key (MMplayers_idMMplayer, MMfixtures_idMMfixtures),
  constraint fk_MMplayer_match_MMfixtures1
    foreign key (MMfixtures_idMMfixtures) references MMfixtures (idMMfixtures),
  constraint fk_MMplayer_match_MMplayers1
    foreign key (MMplayers_idMMplayer) references MMplayers (idMMplayer)
);

create table MMvisitor
(
  idMMvisitor int         not null
    primary key,
  first_name  varchar(45) null,
  last_name   varchar(45) null
);

create table MMticket
(
  idMMticket              int         not null
    primary key,
  prices                  double      null,
  date_reservation        datetime    null,
  MMvisitor_idMMvisitor   int         null,
  MMfixtures_idMMfixtures int         null,
  MMplace_idMMplace       int         null,
  type                    varchar(45) null,
  date_payment            datetime    null,
  constraint fk_MMticket_MMfixtures1
    foreign key (MMfixtures_idMMfixtures) references MMfixtures (idMMfixtures),
  constraint fk_MMticket_MMplace1
    foreign key (MMplace_idMMplace) references MMplace (idMMplace),
  constraint fk_MMticket_MMvisitor1
    foreign key (MMvisitor_idMMvisitor) references MMvisitor (idMMvisitor)
);

create table MSKorisnik
(
  idkorisnik int unsigned auto_increment
    primary key,
  ime        varchar(45) not null,
  prezime    varchar(45) not null,
  email      varchar(45) not null,
  sifra      varchar(45) not null
);

create table MSModel
(
  idmodel int unsigned auto_increment
    primary key,
  naziv   varchar(45) not null,
  opis    varchar(45) not null
);

create table MSSto
(
  idsto   int unsigned auto_increment
    primary key,
  naziv   varchar(45)  not null,
  cena    varchar(45)  not null,
  idmodel int unsigned not null,
  constraint FK_MSSto_model
    foreign key (idmodel) references MSModel (idmodel)
);

create table MSRezervacija
(
  idrezervacija   int unsigned auto_increment
    primary key,
  datumZaduzenja  varchar(45)  not null,
  datumRazduzenja varchar(45)  not null,
  idkorisnik      int unsigned not null,
  idsto           int unsigned not null,
  constraint FK_MSRezervacija_korisnik
    foreign key (idkorisnik) references MSKorisnik (idkorisnik),
  constraint FK_MSRezervacija_sto
    foreign key (idsto) references MSSto (idsto)
);

create table MilicaJovicKategorija
(
  IDK             int auto_increment
    primary key,
  nazivKategorije varchar(45) not null
);

create table MilicaJovicKorisnik
(
  idKorisnik    int auto_increment
    primary key,
  korisnickoIme varchar(45)  not null,
  ime           varchar(45)  not null,
  prezime       varchar(45)  not null,
  sifra         varchar(200) not null
);

create table MilicaJovicProizvod
(
  IDP                       int auto_increment
    primary key,
  naziv                     varchar(45) not null,
  cena                      varchar(45) not null,
  opis                      longtext    not null,
  akcija                    varchar(45) null,
  slika                     longblob    null,
  MilicaJovicKategorija_IDK int         not null,
  constraint fk_MilicaJovicProizvod_MilicaJovicKategorija
    foreign key (MilicaJovicKategorija_IDK) references MilicaJovicKategorija (IDK)
);

create table MilicaJovicKupovina
(
  idKupovina                     int auto_increment
    primary key,
  datum                          date not null,
  kolicina                       int  not null,
  MilicaJovicProizvod_IDP        int  not null,
  MilicaJovicKorisnik_idKorisnik int  not null,
  constraint fk_MilicaJovicKupovina_MilicaJovicKorisnik1
    foreign key (MilicaJovicKorisnik_idKorisnik) references MilicaJovicKorisnik (idKorisnik),
  constraint fk_MilicaJovicKupovina_MilicaJovicProizvod1
    foreign key (MilicaJovicProizvod_IDP) references MilicaJovicProizvod (IDP)
);

create table MilicaJovicUloga
(
  idUloga int auto_increment
    primary key,
  naziv   varchar(45) not null
);

create table MilicaJovicUloga_has_MilicaJovicKorisnik
(
  MilicaJovicUloga_idUloga       int not null,
  MilicaJovicKorisnik_idKorisnik int not null,
  primary key (MilicaJovicUloga_idUloga, MilicaJovicKorisnik_idKorisnik),
  constraint fk_MilicaJovicUloga_has_MilicaJovicKorisnik_MilicaJovicKorisn1
    foreign key (MilicaJovicKorisnik_idKorisnik) references MilicaJovicKorisnik (idKorisnik),
  constraint fk_MilicaJovicUloga_has_MilicaJovicKorisnik_MilicaJovicUloga1
    foreign key (MilicaJovicUloga_idUloga) references MilicaJovicUloga (idUloga)
);

create table NVGrupa
(
  idGrupa int auto_increment
    primary key,
  naziv   varchar(20) not null
);

create table NVKoncert
(
  idKoncert int auto_increment
    primary key,
  ime       varchar(45) not null,
  datum     date        null
);

create table NVGrupaAndKoncert
(
  id                int auto_increment
    primary key,
  Grupa_idGrupa     int not null,
  Koncert_idKoncert int not null,
  constraint fk_GrupaAndKoncert_Grupa1
    foreign key (Grupa_idGrupa) references NVGrupa (idGrupa)
      on update cascade on delete cascade,
  constraint fk_GrupaAndKoncert_Koncert1
    foreign key (Koncert_idKoncert) references NVKoncert (idKoncert)
      on update cascade on delete cascade
);

create index fk_GrupaAndKoncert_Grupa1_idx
  on NVGrupaAndKoncert (Grupa_idGrupa);

create index fk_GrupaAndKoncert_Koncert1_idx
  on NVGrupaAndKoncert (Koncert_idKoncert);

create table NVKoreografija
(
  idKoreografija int auto_increment
    primary key,
  naziv          varchar(45) not null
);

create table NVTurneja
(
  idTurneja   int auto_increment
    primary key,
  destinacija varchar(45) not null,
  datum       date        null
);

create table NVGrupaAndTurneja
(
  id                int auto_increment
    primary key,
  Grupa_idGrupa     int not null,
  Turneja_idTurneja int not null,
  constraint fk_GrupaAndTurneja_Grupa1
    foreign key (Grupa_idGrupa) references NVGrupa (idGrupa)
      on update cascade on delete cascade,
  constraint fk_GrupaAndTurneja_Turneja1
    foreign key (Turneja_idTurneja) references NVTurneja (idTurneja)
      on update cascade on delete cascade
);

create index fk_GrupaAndTurneja_Grupa1_idx
  on NVGrupaAndTurneja (Grupa_idGrupa);

create index fk_GrupaAndTurneja_Turneja1_idx
  on NVGrupaAndTurneja (Turneja_idTurneja);

create table NVUser
(
  idUser     int auto_increment
    primary key,
  role       smallint(6) null,
  username   varchar(45) not null,
  password   varchar(90) null,
  email      varchar(45) null,
  first_name varchar(90) null,
  last_name  varchar(90) null
);

create table NVClanarina
(
  idClanarina int auto_increment
    primary key,
  godina      int                                                                                                                        not null,
  mesec       enum ('Januar', 'Februar', 'Mart', 'April', 'Maj', 'Jun', 'Jul', 'Avgust', 'Septembar', 'Oktobar', 'Novembar', 'Decembar') not null,
  placeno     enum ('NO', 'YES') default 'NO'                                                                                            not null,
  User_idUser int                                                                                                                        not null,
  constraint fk_Clanarina_User
    foreign key (User_idUser) references NVUser (idUser)
      on update cascade on delete cascade
);

create index fk_Clanarina_User_idx
  on NVClanarina (User_idUser);

create table NVUserAndGrupa
(
  id            int auto_increment
    primary key,
  User_idUser   int not null,
  Grupa_idGrupa int not null,
  constraint fk_UserAndGrupa_Grupa1
    foreign key (Grupa_idGrupa) references NVGrupa (idGrupa)
      on update cascade on delete cascade,
  constraint fk_UserAndGrupa_User1
    foreign key (User_idUser) references NVUser (idUser)
      on update cascade on delete cascade
);

create index fk_UserAndGrupa_Grupa1_idx
  on NVUserAndGrupa (Grupa_idGrupa);

create index fk_UserAndGrupa_User1_idx
  on NVUserAndGrupa (User_idUser);

create table NVUserAndKoreografija
(
  id                          int auto_increment
    primary key,
  User_idUser                 int not null,
  Koreografija_idKoreografija int not null,
  constraint fk_UserAndKoreografija_Koreografija1
    foreign key (Koreografija_idKoreografija) references NVKoreografija (idKoreografija)
      on update cascade on delete cascade,
  constraint fk_UserAndKoreografija_User1
    foreign key (User_idUser) references NVUser (idUser)
      on update cascade on delete cascade
);

create index fk_UserAndKoreografija_Koreografija1_idx
  on NVUserAndKoreografija (Koreografija_idKoreografija);

create index fk_UserAndKoreografija_User1_idx
  on NVUserAndKoreografija (User_idUser);

create table NVUserAndTurneja
(
  id                  int auto_increment
    primary key,
  NVUser_idUser       int not null,
  NVTurneja_idTurneja int not null,
  constraint fk_table1_NVTurneja1
    foreign key (NVTurneja_idTurneja) references NVTurneja (idTurneja)
      on update cascade on delete cascade,
  constraint fk_table1_NVUser1
    foreign key (NVUser_idUser) references NVUser (idUser)
      on update cascade on delete cascade
);

create index fk_table1_NVTurneja1_idx
  on NVUserAndTurneja (NVTurneja_idTurneja);

create index fk_table1_NVUser1_idx
  on NVUserAndTurneja (NVUser_idUser);

create table Nikola
(
  Column1 int auto_increment
    primary key,
  ime     varchar(100) null
);

create table NikolaZgrada
(
  ulica  varchar(100) not null,
  broj   int          not null,
  idStan int auto_increment
    primary key
);

create table NikolaSoba
(
  idSoba   int auto_increment
    primary key,
  brojSoba int not null,
  brZgrade int null,
  constraint NikolaSoba_FK
    foreign key (brZgrade) references NikolaZgrada (idStan)
);

create table NikolaOsoba
(
  Ime      varchar(100) not null,
  idOsoba  int auto_increment
    primary key,
  prezime  varchar(100) not null,
  brojSoba int          null,
  constraint NikolaOsoba_FK
    foreign key (brojSoba) references NikolaSoba (idSoba)
);

create table NikolaRacun
(
  idRacun  int auto_increment
    primary key,
  cena     int  not null,
  brojSobe int  not null,
  tip      text not null,
  constraint NikolaRacun_FK
    foreign key (brojSobe) references NikolaSoba (idSoba)
);

create table NikoletaKorisnik
(
  idKorisnik       int auto_increment
    primary key,
  ime              varchar(45) not null,
  prezime          varchar(45) not null,
  username         varchar(45) not null,
  email            varchar(45) not null,
  password         varchar(45) not null,
  adminIliKorisnik int         not null,
  slika            blob        null
);

create table NikoletaPredmet
(
  idPredmet     int auto_increment
    primary key,
  nazivPredmeta varchar(100) not null
);

create table NikoletaKurs
(
  idKurs     int auto_increment
    primary key,
  nazivKursa varchar(100) not null,
  opisKursa  varchar(100) not null,
  idPredmet  int          not null,
  constraint FK_NikoletaKurs_1
    foreign key (idPredmet) references NikoletaPredmet (idPredmet)
);

create table NikoletaKomentar
(
  idKomentar   int auto_increment
    primary key,
  opis         varchar(45)  not null,
  idKurs       int          not null,
  idKorisnik   int          not null,
  ocenaKursa   int          not null,
  datumPisanja varchar(100) not null,
  constraint FK_NikoletaKomentar_1
    foreign key (idKurs) references NikoletaKurs (idKurs),
  constraint FK_NikoletaKomentar_2
    foreign key (idKorisnik) references NikoletaKorisnik (idKorisnik)
);

create table NikoletaLekcija
(
  idLekcije    int(10) auto_increment
    primary key,
  nazivLekcije varchar(45) not null,
  opisLekcije  varchar(45) not null,
  idKurs       int(10)     not null,
  constraint FK_NikoletaLekcija_1
    foreign key (idKurs) references NikoletaKurs (idKurs)
);

create table NikoletaTest
(
  idTest     int auto_increment
    primary key,
  opisTesta  varchar(45) not null,
  maxBrPoena int         not null,
  minBrPoena int         not null,
  idLekcije  int         not null,
  constraint FK_NikoletaTest_1
    foreign key (idLekcije) references NikoletaLekcija (idLekcije)
);

create table NikoletaPitanje
(
  idPitanje   int auto_increment
    primary key,
  brPoena     int         not null,
  opisPitanja varchar(45) not null,
  idTest      int         not null,
  constraint FK_NikoletaPitanje_1
    foreign key (idTest) references NikoletaTest (idTest)
);

create table NikoletaOdgovor
(
  idOdgovor int auto_increment
    primary key,
  odgovor   varchar(100) not null,
  idPitanje int          not null,
  constraint NikoletaOdgovor_FK
    foreign key (idPitanje) references NikoletaPitanje (idPitanje)
);

create table PRIMERAK
(
  INV_BROJ  int auto_increment
    primary key,
  ID_KNJIGE int null,
  constraint FK_PRIMERAK_REFERENCE_KNJIGA
    foreign key (ID_KNJIGE) references KNJIGA (ID_KNJIGE)
);

create table Posetilac
(
  idPosetilac int auto_increment
    primary key,
  ime         varchar(45) null,
  prezime     varchar(45) null
);

create table Reziser
(
  idReziser int auto_increment
    primary key,
  ime       varchar(45) null,
  prezime   varchar(45) null
);

create table Role
(
  idRole int auto_increment,
  value  varchar(255) null,
  primary key (idrole, idRole, idRole, idrole)
);

create table SDKategorija
(
  sdKategorijaId    int auto_increment
    primary key,
  sdKategorijaNaziv varchar(45) not null
);

create table SDKorisnik
(
  sdKorisnikId       int auto_increment
    primary key,
  sdKorisnikIme      varchar(45) not null,
  sdKorisnikPrezime  varchar(45) not null,
  sdKorisnikEmail    varchar(45) not null,
  sdKorisnikTelefon  varchar(45) not null,
  sdKorisnikUsername varchar(45) not null,
  sdKorisnikPassword varchar(45) not null,
  sdAdmin            int         not null
);

create table SDRezervacija
(
  sdRezervacijaId                int auto_increment
    primary key,
  sdRezervacijaAdresaPreuzimanja varchar(45) not null,
  sdRezervacijacDatumPreuzimanja date        not null,
  sdRezervacijaAdresaOstavljanja varchar(45) not null,
  sdRezervacijaDatumOstavljanja  date        not null,
  sdKorisnikId                   int         not null,
  sdRezervacijacRacun            int         not null,
  constraint FK_Rezervacija_Korisnik
    foreign key (sdKorisnikId) references SDKorisnik (sdKorisnikId)
);

create index FK_Rezervacija_Korisnik_idx
  on SDRezervacija (sdKorisnikId);

create table SS2816_Dungeon
(
  idDungeon      int auto_increment
    primary key,
  name           varchar(100) null,
  difficulty     int          null,
  timesCompleted int          null
);

create table SS2816_Boss
(
  idBoss      int auto_increment
    primary key,
  name        varchar(100) null,
  timesKilled int          null,
  idDungeon   int          not null,
  constraint fk_SS2816_Boss_SS2816_Dungeon1
    foreign key (idDungeon) references SS2816_Dungeon (idDungeon)
);

create index fk_SS2816_Boss_SS2816_Dungeon1_idx
  on SS2816_Boss (idDungeon);

create table SS2816_Item
(
  idItem    int auto_increment
    primary key,
  name      varchar(100) null,
  gearScore int          null,
  idBoss    int          not null,
  constraint fk_SS2816_Item_SS2816_Boss1
    foreign key (idBoss) references SS2816_Boss (idBoss)
);

create index fk_SS2816_Item_SS2816_Boss1_idx
  on SS2816_Item (idBoss);

create table SS2816_Raid
(
  idRaid       int auto_increment
    primary key,
  BossesKilled int      null,
  raidDate     datetime null,
  arrivedLate  int      null,
  leftEarly    int      null,
  idDungeon    int      not null,
  constraint fk_SS2816_Raid_SS2816_Dungeon1
    foreign key (idDungeon) references SS2816_Dungeon (idDungeon)
);

create index fk_SS2816_Raid_SS2816_Dungeon1_idx
  on SS2816_Raid (idDungeon);

create table SS2816_Rank
(
  idRank int auto_increment
    primary key,
  name   varchar(45) null
);

create table SS2816_Stat
(
  idStat int auto_increment
    primary key,
  name   varchar(45) null,
  amount int         null,
  idItem int         not null,
  constraint fk_SS2816_Stat_SS2816_Item1
    foreign key (idItem) references SS2816_Item (idItem)
);

create index fk_SS2816_Stat_SS2816_Item1_idx
  on SS2816_Stat (idItem);

create table SS2816_User
(
  idUser   int auto_increment
    primary key,
  username varchar(45)  not null,
  password varchar(255) null,
  constraint username_UNIQUE
    unique (username)
);

create table SS2816_Member
(
  idMember    int auto_increment
    primary key,
  nameMember  varchar(45)  not null,
  note        varchar(200) null,
  contactInfo varchar(100) null,
  dkp         int          null,
  arrivedLate int          null,
  leftEarly   int          null,
  idUser      int          null,
  idRank      int          null,
  constraint nameMember_UNIQUE
    unique (nameMember),
  constraint fk_SS2816_Member_SS2816_Rank1
    foreign key (idRank) references SS2816_Rank (idRank),
  constraint fk_SS2816_Member_SS2816_User
    foreign key (idUser) references SS2816_User (idUser)
);

create index fk_SS2816_Member_SS2816_Rank1_idx
  on SS2816_Member (idRank);

create index fk_SS2816_Member_SS2816_User_idx
  on SS2816_Member (idUser);

create table SS2816_Member_Item
(
  SS2816_Member_idMember int not null,
  SS2816_Item_idItem     int not null,
  primary key (SS2816_Member_idMember, SS2816_Item_idItem),
  constraint fk_SS2816_Member_has_SS2816_Item_SS2816_Item1
    foreign key (SS2816_Item_idItem) references SS2816_Item (idItem),
  constraint fk_SS2816_Member_has_SS2816_Item_SS2816_Member1
    foreign key (SS2816_Member_idMember) references SS2816_Member (idMember)
);

create index fk_SS2816_Member_has_SS2816_Item_SS2816_Item1_idx
  on SS2816_Member_Item (SS2816_Item_idItem);

create index fk_SS2816_Member_has_SS2816_Item_SS2816_Member1_idx
  on SS2816_Member_Item (SS2816_Member_idMember);

create table SaraDPreduzece
(
  saraDPreduzeceId      int auto_increment
    primary key,
  saraDPreduzeceNaziv   varchar(45) not null,
  saraDPreduzeceTelefon varchar(45) not null,
  ssraDPreduzeceEmail   varchar(45) not null,
  saraDPreduzeceAdresa  varchar(45) not null
);

create table SDVozilo
(
  sdVoziloId       int auto_increment
    primary key,
  sdVoziloNaziv    varchar(45) not null,
  sdVoziloModel    varchar(45) not null,
  sdVoziloCena     int         not null,
  sdVoziloSlika    blob        null,
  saraDPreduzeceId int         not null,
  sdKategorijaId   int         not null,
  sdVoziloKolicina int         not null,
  constraint FK_Vozilo_Kategorija
    foreign key (sdKategorijaId) references SDKategorija (SDKategorijaId),
  constraint FK_Vozilo_Preduzece
    foreign key (saraDPreduzeceId) references SaraDPreduzece (saraDPreduzeceId)
);

create table SDRezervacijaVozila
(
  sdVoziloId      int not null,
  sdRezervacijaId int not null,
  primary key (sdVoziloId, sdRezervacijaId),
  constraint SDRezervacijaId
    foreign key (sdRezervacijaId) references SDRezervacija (sdRezervacijaId)
      on delete cascade,
  constraint SDVoziloId
    foreign key (sdVoziloId) references SDVozilo (SDVoziloId)
      on delete cascade
);

create index SDRezervacijaId_idx
  on SDRezervacijaVozila (sdRezervacijaId);

create index SDVoziloId_idx
  on SDRezervacijaVozila (sdVoziloId);

create index FK_Vozilo_Kategorija_idx
  on SDVozilo (saraDPreduzeceId);

create table Scena
(
  idScena int auto_increment
    primary key,
  naziv   varchar(45) null
);

create table Mesto
(
  idMesto int auto_increment
    primary key,
  sekcija varchar(45) null,
  red     int         null,
  broj    varchar(45) null,
  idScena int         not null,
  constraint fk_Mesto_Scena1
    foreign key (idScena) references Scena (idScena)
);

create index fk_Mesto_Scena1_idx
  on Mesto (idScena);

create table StefanJovanovicProizvodjac
(
  IDPR   int auto_increment
    primary key,
  Naziv  varchar(100) not null,
  Adresa varchar(100) not null
);

create table StefanJovanovicProizvod
(
  IDP   int auto_increment
    primary key,
  Naziv varchar(50)  not null,
  Cena  int          not null,
  IDPR  int          not null,
  Opis  varchar(255) not null,
  constraint Proizvod_Proizvodjac_FK
    foreign key (IDPR) references StefanJovanovicProizvodjac (IDPR)
);

create table StefanJovanovicRole
(
  naziv   varchar(50) not null,
  idUloga int auto_increment
    primary key
);

create table StefanJovanovicStavka
(
  IDS int auto_increment
    primary key,
  Kol int not null,
  IDP int not null,
  constraint Stavka_Proizvod_FK
    foreign key (IDP) references StefanJovanovicProizvod (IDP)
);

create table StefanJovanovicNarudzba
(
  IDN   int auto_increment
    primary key,
  Datum date not null,
  IDS   int  not null,
  constraint Narudzba_Stavka_FK
    foreign key (IDS) references StefanJovanovicStavka (IDS)
);

create table StefanJovanovicNarucio
(
  IDNAR  int auto_increment
    primary key,
  IDN    int          not null,
  Adresa varchar(255) not null,
  email  varchar(50)  not null,
  constraint FK_StefanJovanovicNarucio_StefanJovanovicNarudzba_IDN
    foreign key (IDN) references StefanJovanovicNarudzba (IDN)
);

create table StefanJovanovicUloga
(
  IDU   int auto_increment
    primary key,
  Naziv varchar(50) not null
);

create table StefanJovanovicKorisnik
(
  IDK     int auto_increment
    primary key,
  Ime     varchar(50)  not null,
  Prezime varchar(50)  not null,
  User    varchar(50)  not null,
  Pass    varchar(500) not null,
  Adresa  varchar(65)  not null,
  Email   varchar(50)  not null,
  IDU     int          not null,
  constraint Korisnik_Uloga_FK
    foreign key (IDU) references StefanJovanovicUloga (IDU)
);

create table StefanJovanovicUser
(
  idKorisnik    int auto_increment
    primary key,
  korisnickoIme varchar(45) not null,
  ime           varchar(45) null,
  prezime       varchar(45) null,
  sifra         text        null
);

create table StefanJovanovicWebShopUserRole
(
  id         int auto_increment
    primary key,
  idKorisnik int not null,
  idUloga    int not null,
  constraint fk_WebSho_UserRole_2
    foreign key (idUloga) references StefanJovanovicRole (idUloga),
  constraint fk_WebShop_UserRole_1
    foreign key (idKorisnik) references StefanJovanovicUser (idKorisnik)
);

create index fk_BIBLIOTEKA_KORISNIKULOGA_1_idx
  on StefanJovanovicWebShopUserRole (idKorisnik);

create index fk_BIBLIOTEKA_KORISNIKULOGA_2_idx
  on StefanJovanovicWebShopUserRole (idUloga);

create table Student
(
  brojIndeksa varchar(255) default '' not null
    primary key,
  ime         varchar(255)            null,
  prezime     varchar(255)            null,
  email       varchar(255)            null,
  slika       longblob                null,
  slikaPut    varchar(1024)           null
);

create table TTFComment
(
  id          int unsigned auto_increment
    primary key,
  userId      int unsigned not null,
  description varchar(255) not null,
  timestamp   int unsigned not null,
  type        int unsigned not null
);

create table TTFDiscussion
(
  id          int unsigned auto_increment
    primary key,
  name        varchar(45)  not null,
  description varchar(45)  not null,
  timestamp   int unsigned not null
);

create table TTFLabel
(
  id             int unsigned auto_increment
    primary key,
  name           varchar(45) not null,
  color          varchar(45) not null,
  isProjectLabel tinyint(1)  not null
);

create table TTFNote
(
  id          int unsigned auto_increment
    primary key,
  name        varchar(45)  not null,
  description varchar(45)  not null,
  timestamp   int unsigned not null
);

create table TTFProject
(
  id           int unsigned auto_increment
    primary key,
  name         varchar(255) not null,
  description  varchar(255) not null,
  label        varchar(45)  not null,
  creationDate varchar(45)  not null,
  isArchived   tinyint(1)   not null
);

create table TTFRole
(
  id    int unsigned auto_increment
    primary key,
  value varchar(45) not null
);

create table TTFTask
(
  id           int unsigned auto_increment
    primary key,
  name         varchar(255) not null,
  description  varchar(255) not null,
  highPriority tinyint(1)   not null,
  projectId    int unsigned not null,
  timeSpent    int unsigned not null,
  label        varchar(45)  not null
);

create table TTFUser
(
  id          int unsigned auto_increment
    primary key,
  name        varchar(50)  not null,
  lastName    varchar(45)  not null,
  role        varchar(45)  not null,
  projects    varchar(45)  not null,
  isArchived  tinyint(1)   not null,
  email       varchar(45)  not null,
  password    varchar(255) not null,
  phoneNumber varchar(45)  not null
);

create table User
(
  id         int auto_increment,
  username   varchar(100) null,
  password   varchar(100) null,
  name       varchar(100) null,
  avatar     varchar(100) null,
  profession varchar(100) null,
  address    varchar(100) null,
  birthday   varchar(100) null,
  gender     varchar(1)   null,
  primary key (id, iduser, id, iduser)
);

create table Post
(
  id      int auto_increment
    primary key,
  time    varchar(100) null,
  content varchar(500) null,
  userId  int          null,
  constraint Post_ibfk_1
    foreign key (userId) references User (id)
);

create index userId
  on Post (userId);

create table Users
(
  idUser   int auto_increment
    primary key,
  username varchar(255) null,
  password text         null,
  name     varchar(255) null
);

create table UserRole
(
  idUserRole int auto_increment
    primary key,
  idRole     int null,
  idUser     int null,
  constraint UserRole_Role_idRole_fk
    foreign key (idRole) references Role (idRole)
      on update cascade on delete cascade,
  constraint UserRole_Users_idUser_fk
    foreign key (idUser) references Users (idUser)
      on update cascade on delete cascade
);

create table VPIzvodjac
(
  idIzvodjaca    int         not null
    primary key,
  nazivIzvodjaca varchar(40) null
);

create table VPKorisnik
(
  idKorisnika      int          not null
    primary key,
  imeKorisnika     varchar(100) null,
  prezimeKorisnika varchar(100) null,
  username         varchar(100) null,
  password         varchar(100) null
);

create table VPKorisnikUloga
(
  uloga_idrole    int not null,
  korisnik_iduser int not null,
  primary key (uloga_idrole, korisnik_iduser)
);

create table VPPloca
(
  idPloce         int         not null
    primary key,
  nazivPloce      varchar(45) null,
  godinaIzdavanja int         null
);

create table VPUloga
(
  idUloge    int          not null
    primary key,
  nazivUloge varchar(100) null
);

create table VPZanr
(
  idZanr     int         not null
    primary key,
  nazivZanra varchar(40) null
);

create table WPAnaliza
(
  IDA   int auto_increment,
  Naziv varchar(255) not null,
  primary key (IDA, IDA, IDA, IDA)
);

create table WPKarton
(
  IDK  int auto_increment
    primary key,
  IDPR int null
);

create table WPLabaratroija
(
  IDL      int auto_increment
    primary key,
  Rezultat varchar(255) not null,
  IDUP     int          not null,
  Datum    date         not null,
  IDA      int          not null,
  constraint FK_WPLabaratroija_WPAnaliza_IDA
    foreign key (IDA) references WPAnaliza (IDA)
);

create table WPPacijent
(
  IDP      int auto_increment
    primary key,
  Ime      varchar(255) not null,
  Prezime  varchar(255) not null,
  Telefon  varchar(255) not null,
  JMBG     varchar(255) not null,
  Adresa   varchar(255) not null,
  IDK      int          not null,
  Username varchar(255) null,
  constraint FK_WPPacijent_WPKarton_IDK
    foreign key (IDK) references WPKarton (IDK)
);

create table WPTermin
(
  IDT         int auto_increment
    primary key,
  Termin      varchar(450) not null,
  Rezervisano bit          not null
);

create table WPUloge
(
  IDU   int auto_increment
    primary key,
  uloga varchar(255) not null
);

create table WPZakazivanje
(
  IDZA  int auto_increment,
  IDZ   int  null,
  IDP   int  not null,
  Datum date not null,
  constraint IDZA
    unique (IDZA)
);

create index FK_WPZakazivanje_WPPacijent_IDP
  on WPZakazivanje (IDP);

create index FK_WPZakazivanje_WPZaposlen_IDZ
  on WPZakazivanje (IDZ);

alter table WPZakazivanje
  add primary key (IDZA);

create table WPZaposlen
(
  IDZ     int auto_increment
    primary key,
  Ime     varchar(255) not null,
  Prezime varchar(255) not null,
  JMBG    varchar(255) not null,
  Adresa  varchar(255) not null,
  Telefon varchar(255) null,
  Struka  varchar(255) null,
  IDU     int          not null,
  constraint FK_WPZaposlen_WPUloge_IDU
    foreign key (IDU) references WPUloge (IDU)
);

create table WPPregled
(
  IDPR      int auto_increment
    primary key,
  IDZ       int          not null,
  IDP       int          not null,
  Dijagnoza varchar(255) not null,
  Datum     datetime     not null,
  IDL       int          null,
  constraint FK_WPPregled_WPLabaratroija_IDL
    foreign key (IDL) references WPLabaratroija (IDL),
  constraint FK_WPPregled_WPPacijent_IDP
    foreign key (IDP) references WPPacijent (IDP),
  constraint FK_WPPregled_WPZaposlen_IDZ
    foreign key (IDZ) references WPZaposlen (IDZ)
);

alter table WPKarton
  add constraint FK_WPKarton_WPPregled_IDPR
    foreign key (IDPR) references WPPregled (IDPR);

create table WPUput
(
  IDUP int auto_increment
    primary key,
  IDPR int          not null,
  Uput varchar(255) not null,
  IDA  int          not null,
  constraint FK_WPUput_WPAnaliza_IDA
    foreign key (IDA) references WPAnaliza (IDA),
  constraint FK_WPUput_WPPregled_IDPR
    foreign key (IDPR) references WPPregled (IDPR)
);

alter table WPLabaratroija
  add constraint FK_WPLabaratroija_WPUput_IDUP
    foreign key (IDUP) references WPUput (IDUP);

create table WPZakazivanjee
(
  IDZA  int auto_increment
    primary key,
  Datum date not null,
  IDP   int  not null,
  IDA   int  null,
  IDZ   int  null,
  IDT   int  not null,
  constraint FK_WPZakazivanjee_IDA
    foreign key (IDA) references WPAnaliza (IDA),
  constraint FK_WPZakazivanjee_IDP
    foreign key (IDP) references WPPacijent (IDP),
  constraint FK_WPZakazivanjee_IDT
    foreign key (IDT) references WPTermin (IDT),
  constraint FK_WPZakazivanjee_IDZ
    foreign key (IDZ) references WPZaposlen (IDZ)
);

create table ZADUZENJE
(
  INV_BROJ        int  null,
  CLANSKIBROJ     int  null,
  ID              int auto_increment
    primary key,
  DATUM_ZADUZENJA date null,
  DATUM_VRACANJA  date null,
  constraint FK_ZADUZENJ_REFERENCE_CLAN
    foreign key (CLANSKIBROJ) references CLAN (CLANSKIBROJ),
  constraint FK_ZADUZENJ_REFERENCE_PRIMERAK
    foreign key (INV_BROJ) references PRIMERAK (INV_BROJ)
);

create table Zanr
(
  idZanr int auto_increment
    primary key,
  naziv  varchar(45) null
);

create table Predstava
(
  idPredstava int auto_increment
    primary key,
  naziv       varchar(45)  null,
  trajanje    int          null,
  opis        varchar(225) null,
  idZanr      int          not null,
  idReziser   int          not null,
  constraint fk_Predstava_Reziser1
    foreign key (idReziser) references Reziser (idReziser),
  constraint fk_Predstava_Zanr
    foreign key (idZanr) references Zanr (idZanr)
);

create table Izvodjenje
(
  idIzvodjenje int auto_increment
    primary key,
  datum        date null,
  idPredstava  int  not null,
  idScena      int  not null,
  constraint fk_Izvodjenje_Predstava1
    foreign key (idPredstava) references Predstava (idPredstava),
  constraint fk_Izvodjenje_Scena1
    foreign key (idScena) references Scena (idScena)
);

create index fk_Izvodjenje_Predstava1_idx
  on Izvodjenje (idPredstava);

create index fk_Izvodjenje_Scena1_idx
  on Izvodjenje (idScena);

create table Karta
(
  idKarta          int auto_increment
    primary key,
  cena             double null,
  idMesto          int    not null,
  datumRezervacije date   null,
  datumPlacanja    date   null,
  idPosetilac      int    not null,
  idIzvodjenje     int    not null,
  constraint fk_Karta_Izvodjenje1
    foreign key (idIzvodjenje) references Izvodjenje (idIzvodjenje),
  constraint fk_Karta_Mesto1
    foreign key (idMesto) references Mesto (idMesto),
  constraint fk_Karta_Posetilac1
    foreign key (idPosetilac) references Posetilac (idPosetilac)
);

create index fk_Karta_Izvodjenje1_idx
  on Karta (idIzvodjenje);

create index fk_Karta_Mesto1_idx
  on Karta (idMesto);

create index fk_Karta_Posetilac1_idx
  on Karta (idPosetilac);

create index fk_Predstava_Reziser1_idx
  on Predstava (idReziser);

create index fk_Predstava_Zanr_idx
  on Predstava (idZanr);

create table Uloga
(
  idUloga     int auto_increment
    primary key,
  naziv       varchar(45) null,
  idGlumac    int         not null,
  idPredstava int         not null,
  constraint fk_Uloga_Glumac1
    foreign key (idGlumac) references Glumac (idGlumac),
  constraint fk_Uloga_Predstava1
    foreign key (idPredstava) references Predstava (idPredstava)
);

create index fk_Uloga_Glumac1_idx
  on Uloga (idGlumac);

create index fk_Uloga_Predstava1_idx
  on Uloga (idPredstava);

create table class
(
  ID_CLASS    int auto_increment
    primary key,
  CLASS_LABEL varchar(10) not null
);

create table owners
(
  id         int(4) unsigned auto_increment
    primary key,
  first_name varchar(30)  null,
  last_name  varchar(30)  null,
  address    varchar(255) null,
  city       varchar(80)  null,
  telephone  varchar(20)  null
);

create index last_name
  on owners (last_name);

create table pg_korisnik
(
  idkorisnik int          not null
    primary key,
  ime        varchar(100) not null,
  prezime    varchar(100) not null,
  jmbg       varchar(13)  not null,
  grad       varchar(100) not null,
  drzava     varchar(100) not null
);

create table pg_racun
(
  brojracuna             varchar(100) not null,
  vrstaracuna            varchar(100) not null,
  valuta                 varchar(3)   not null,
  pg_korisnik_idkorisnik int          not null,
  primary key (brojracuna, pg_korisnik_idkorisnik),
  constraint pg_racun_pg_korisnik_fk
    foreign key (pg_korisnik_idkorisnik) references pg_korisnik (idkorisnik)
);

create table pg_transakcija
(
  idtransakcija          int          not null,
  primalac               varchar(100) not null,
  brojracunaprimalac     varchar(100) not null,
  svrhauplate            varchar(100) not null,
  valuta                 varchar(100) not null,
  iznos                  int          not null,
  datum                  date         null,
  pg_racun_brojracuna    varchar(100) not null,
  pg_korisnik_idkorisnik int          not null,
  primary key (idtransakcija, pg_racun_brojracuna, pg_korisnik_idkorisnik),
  constraint pg_transakcija_pg_racun_fk
    foreign key (pg_racun_brojracuna, pg_korisnik_idkorisnik) references pg_racun (brojracuna, pg_korisnik_idkorisnik)
);

create table pg_uloga
(
  iduloga int          not null
    primary key,
  uloga   varchar(100) not null
);

create table pg_profil
(
  idprofil               int          not null,
  korisnickoime          varchar(100) not null,
  sifra                  varchar(100) not null,
  pg_uloga_iduloga       int          not null,
  pg_korisnik_idkorisnik int          not null,
  primary key (idprofil, pg_uloga_iduloga),
  constraint pg_profil__idx
    unique (pg_korisnik_idkorisnik),
  constraint pg_profil_pg_korisnik_fk
    foreign key (pg_korisnik_idkorisnik) references pg_korisnik (idkorisnik),
  constraint pg_profil_pg_uloga_fk
    foreign key (pg_uloga_iduloga) references pg_uloga (iduloga)
);

create table role
(
  idrole int auto_increment,
  name   varchar(20) not null
)
  charset = latin1;

create table roleBojana
(
  idrole int auto_increment
    primary key,
  name   varchar(20) charset latin1 not null
)
  collate = utf8_bin;

create table specialties
(
  id   int(4) unsigned auto_increment
    primary key,
  name varchar(80) null
);

create index name
  on specialties (name);

create table type
(
  idtype int auto_increment
    primary key,
  name   varchar(25) not null
)
  charset = latin1;

create table typeBojana
(
  idtype int auto_increment
    primary key,
  name   varchar(25) charset latin1 not null
)
  collate = utf8_bin;

create table types
(
  id   int(4) unsigned auto_increment
    primary key,
  name varchar(80) null
);

create table pets
(
  id         int(4) unsigned auto_increment
    primary key,
  name       varchar(30)     null,
  birth_date date            null,
  type_id    int(4) unsigned not null,
  owner_id   int(4) unsigned not null,
  constraint pets_ibfk_1
    foreign key (owner_id) references owners (id),
  constraint pets_ibfk_2
    foreign key (type_id) references types (id)
);

create index name
  on pets (name);

create index owner_id
  on pets (owner_id);

create index type_id
  on pets (type_id);

create index name
  on types (name);

create table user
(
  iduser         int auto_increment,
  firstname      varchar(30)  not null,
  lastname       varchar(30)  not null,
  country        varchar(30)  not null,
  city           varchar(30)  not null,
  phonenumber    varchar(30)  not null,
  email          varchar(70)  not null,
  password       varchar(100) not null,
  profilepicture blob         null,
  enabled        tinyint(1)   null
)
  charset = latin1;

create table project
(
  idproject        int auto_increment
    primary key,
  name             varchar(30)  null,
  shortdescription varchar(200) not null,
  phonenumber      varchar(70)  null,
  email            varchar(70)  null,
  type_idtype      int          null,
  user_iduser      int          null,
  fundingduration  date         null,
  fundinggoal      double       not null,
  coverimage       blob         null,
  story_idstory    int          null,
  approved         tinyint(1)   null,
  companyname      varchar(50)  null,
  currentamount    double       null,
  constraint project__idx
    unique (story_idstory),
  constraint project_type_fk
    foreign key (type_idtype) references type (idtype),
  constraint project_user_fk
    foreign key (user_iduser) references user (iduser)
)
  charset = latin1;

create table reward
(
  idreward              int auto_increment
    primary key,
  title                 varchar(70)  not null,
  project_idproject     int          not null,
  pledgeAmount          int          null,
  estimatedDeliveryDate varchar(30)  null,
  image                 blob         null,
  description           varchar(200) null,
  constraint reward_project_fk
    foreign key (project_idproject) references project (idproject)
)
  charset = latin1;

create table story
(
  idstory             int auto_increment
    primary key,
  detaileddescription varchar(1000) null,
  riskandchallanges   varchar(1000) null,
  project_idproject   int           null,
  video               blob          null,
  constraint story__idx
    unique (project_idproject),
  constraint story_project_fk
    foreign key (project_idproject) references project (idproject)
)
  charset = latin1;

create table image
(
  idimage       int auto_increment
    primary key,
  path          varchar(500) null,
  story_idstory int          null,
  constraint image_story_fk
    foreign key (story_idstory) references story (idstory)
)
  charset = latin1;

alter table project
  add constraint project_story_fk
    foreign key (story_idstory) references story (idstory);

create table `user-role`
(
  role_idrole int not null,
  user_iduser int not null,
  primary key (role_idrole, user_iduser),
  constraint `user-role_Role_FK`
    foreign key (role_idrole) references role (idrole),
  constraint `user-role_User_FK`
    foreign key (user_iduser) references user (iduser)
)
  charset = latin1;

create table userBojana
(
  iduser         int auto_increment
    primary key,
  firstname      varchar(30) charset latin1  not null,
  lastname       varchar(30) charset latin1  not null,
  country        varchar(30) charset latin1  not null,
  city           varchar(30) charset latin1  not null,
  phonenumber    varchar(30) charset latin1  not null,
  email          varchar(70) charset latin1  not null,
  password       varchar(100) charset latin1 not null,
  profilepicture blob                        null,
  enabled        tinyint(1)                  null,
  banned         tinyint(1)                  null
)
  collate = utf8_bin;

create table projectBojana
(
  idproject           int auto_increment
    primary key,
  name                varchar(30) charset latin1  null,
  shortdescription    varchar(200) charset latin1 not null,
  phonenumber         varchar(70) charset latin1  null,
  email               varchar(70) charset latin1  null,
  typeBojana_idtype   int                         null,
  userBojana_iduser   int                         null,
  fundingduration     date                        null,
  fundinggoal         double                      not null,
  coverimage          blob                        null,
  storyBojana_idstory int                         null,
  approved            tinyint(1)                  null,
  companyname         varchar(50) charset latin1  null,
  currentamount       double                      null,
  biography           varchar(400)                null,
  fullname            varchar(60)                 null,
  bankaccount         varchar(60)                 null,
  bankaccountowner    varchar(400)                null,
  facebook            varchar(400)                null,
  instagram           varchar(400)                null,
  twitter             varchar(400)                null,
  linkedin            varchar(400)                null,
  website             varchar(400)                null,
  constraint projectBojana__idx
    unique (storyBojana_idstory),
  constraint projectBojana_typeBojana_fk
    foreign key (typeBojana_idtype) references typeBojana (idtype),
  constraint projectBojana_userBojana_fk
    foreign key (userBojana_iduser) references userBojana (iduser)
)
  collate = utf8_bin;

create table commentBojana
(
  idcomment               int auto_increment
    primary key,
  text                    varchar(100) charset utf8 null,
  commentBojana_idcomment int                       null,
  userBojana_iduser       int                       not null,
  projectBojana_idproject int                       not null,
  constraint fk_commentBojana_commentBojana1
    foreign key (commentBojana_idcomment) references commentBojana (idcomment),
  constraint fk_commentBojana_project1
    foreign key (projectBojana_idproject) references projectBojana (idproject),
  constraint fk_commentBojana_userBojana1
    foreign key (userBojana_iduser) references userBojana (iduser)
)
  collate = utf8_bin;

create index fk_commentBojana_commentBojana1_idx
  on commentBojana (commentBojana_idcomment);

create index fk_commentBojana_projectBojana1_idx
  on commentBojana (projectBojana_idproject);

create index fk_commentBojana_userBojana1_idx
  on commentBojana (userBojana_iduser);

create table donationBojana
(
  iddonation              int auto_increment
    primary key,
  amount                  int null,
  transaction_id          int null,
  projectBojana_idproject int not null,
  userBojana_iduser       int not null,
  constraint fk_donationBojana_projectBojana1
    foreign key (projectBojana_idproject) references projectBojana (idproject),
  constraint fk_donationBojana_userBojana1
    foreign key (userBojana_iduser) references userBojana (iduser)
)
  collate = utf8_bin;

create index fk_donationBojana_projectBojana1_idx
  on donationBojana (projectBojana_idproject);

create index fk_donationBojana_userBojana1_idx
  on donationBojana (userBojana_iduser);

create table rewardBojana
(
  idreward                int auto_increment
    primary key,
  title                   varchar(70) charset latin1  not null,
  projectBojana_idproject int                         not null,
  pledge_amount           int                         null,
  estimated_delivery_date varchar(30) charset latin1  null,
  image                   blob                        null,
  description             varchar(200) charset latin1 null,
  constraint rewardBojana_projectBojana_fk
    foreign key (projectBojana_idproject) references projectBojana (idproject)
)
  collate = utf8_bin;

create table storyBojana
(
  idstory                 int auto_increment
    primary key,
  detaileddescription     varchar(1000) charset latin1 null,
  riskandchallanges       varchar(1000) charset latin1 null,
  projectBojana_idproject int                          null,
  video                   blob                         null,
  constraint storyBojana__idx
    unique (projectBojana_idproject),
  constraint storyBojana_projectBojana_fk
    foreign key (projectBojana_idproject) references projectBojana (idproject)
)
  collate = utf8_bin;

create table imageBojana
(
  idimage             int auto_increment
    primary key,
  path                varchar(500) charset latin1 null,
  storyBojana_idstory int                         null,
  constraint imageBojana_storyBojana_fk
    foreign key (storyBojana_idstory) references storyBojana (idstory)
)
  collate = utf8_bin;

alter table projectBojana
  add constraint projectBojana_storyBojana_fk
    foreign key (storyBojana_idstory) references storyBojana (idstory);

create table `userBojana-roleBojana`
(
  roleBojana_idrole int not null,
  userBojana_iduser int not null,
  primary key (roleBojana_idrole, userBojana_iduser),
  constraint `userBojana-roleBojana_Role_FK`
    foreign key (roleBojana_idrole) references roleBojana (idrole),
  constraint `userBojana-roleBojana_User_FK`
    foreign key (userBojana_iduser) references userBojana (iduser)
)
  collate = utf8_bin;

create index `userBojana-roleBojana_UserBojana_FK`
  on `userBojana-roleBojana` (userBojana_iduser);

create table verification_token
(
  token_id           int auto_increment
    primary key,
  verification_token varchar(45) null,
  created_date       date        null,
  user_iduser        int         not null,
  constraint fk_verification_token_user1
    foreign key (user_iduser) references user (iduser)
);

create index fk_verification_token_user1_idx
  on verification_token (user_iduser);

create table verification_tokenBojana
(
  token_id           int auto_increment
    primary key,
  verification_token varchar(45) charset utf8 null,
  created_date       date                     null,
  userBojana_iduser  int                      not null,
  constraint fk_verification_tokenBojana_userBojana1
    foreign key (userBojana_iduser) references userBojana (iduser)
)
  collate = utf8_bin;

create index fk_verification_tokenBojana_user1_idx
  on verification_tokenBojana (userBojana_iduser);

create table vets
(
  id         int(4) unsigned auto_increment
    primary key,
  first_name varchar(30) null,
  last_name  varchar(30) null
);

create table vet_specialties
(
  vet_id       int(4) unsigned not null,
  specialty_id int(4) unsigned not null,
  constraint vet_id
    unique (vet_id, specialty_id),
  constraint vet_specialties_ibfk_1
    foreign key (vet_id) references vets (id),
  constraint vet_specialties_ibfk_2
    foreign key (specialty_id) references specialties (id)
);

create index specialty_id
  on vet_specialties (specialty_id);

create index last_name
  on vets (last_name);

create table visits
(
  id          int(4) unsigned auto_increment
    primary key,
  pet_id      int(4) unsigned not null,
  visit_date  date            null,
  description varchar(255)    null,
  constraint visits_ibfk_1
    foreign key (pet_id) references pets (id)
);

create index pet_id
  on visits (pet_id);

create table wildfly_user
(
  username varchar(255) default '' not null
    primary key,
  password varchar(255)            null,
  role     varchar(255)            null
);

create table wpAnaliza
(
  IDA         int auto_increment,
  imeAnalize  varchar(50)  not null,
  opisAnalize varchar(500) not null
);

create table wpLabaratorija
(
  IDL      int          not null
    primary key,
  ime      varchar(50)  not null,
  prezime  varchar(50)  not null,
  rezultat varchar(500) not null,
  datum    date         not null,
  IDA      int          not null
);


