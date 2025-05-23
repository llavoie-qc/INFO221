-- Étudiant_RU

create table Etudiant_RU_avec_adresse
(
  matricule  Matricule not null,
  nom        Varchar not null,
  adresse    Varchar not null,
  constraint Etudiant_RU_avec_adresse_cc0 primary key (matricule)
)
;

create table Etudiant_RU_sans_adresse
(
  matricule  Matricule not null,
  nom        Varchar not null,
  cause_abs  Varchar not null,
  constraint Etudiant_RU_sans_adresse_cc0 primary key (matricule)
)
;

create view Etudiant_RU as
  select matricule, nom from Etudiant_RU_avec_adresse
  union
  select matricule, nom from Etudiant_RU_sans_adresse
;

/*
create ASSERTION Etudiant_RU_integrite
  check (not exists(
    select matricule from Etudiant_avec_adresse_RU
    intersect
    select matricule from Etudiant_sans_adresse_RU
  )) ;
*/
create function Etudiant_RU_integrite ()
  returns trigger
  language plpgsql as
$$
begin
  if not EXISTS (
    select matricule from Etudiant_RU_avec_adresse
    intersect
    select matricule from Etudiant_RU_sans_adresse )
  then
    return new ;
  else
    raise exception 'Trop de cartes' ;
    return null ;
  end if ;
end
$$ ;

create trigger Etudiant_RU_auto
  after insert or delete or update on Etudiant_RU_avec_adresse
  execute procedure Etudiant_RU_integrite ()
;


--
-- Relations connexes
--

-- Les étudiants dont les attributs facultatifs sont disponibles
-- (avec l’ensemble des attributs, obligatoires et facultatifs)
-- C’est Etudiant_RU_avec_adresse
;

-- Les étudiants dont l’adresse est inconnue.
-- (avec les seuls attributs obligatoires)
-- C’est Etudiant_RU_sans_adresse, avec en prime la cause de l’absence
;

-- Table complète équivalente à Etudiant_NULL_adresse
create view Etudiant_PJ_table_NULL (matricule, nom, adresse) as
  select matricule, nom, matricule from Etudiant_RU_avec_adresse
  union
  select matricule, nom, null as matricule from Etudiant_RU_sans_adresse
;

-- Table complète annotée
-- Potentiellement utile pour l’affichage
create view Etudiant_PJ_table_DM (matricule, nom, adresse) as
  select matricule, nom, matricule from Etudiant_RU_avec_adresse
  union
  select matricule, nom, '<donnée manquante>' as matricule from Etudiant_RU_sans_adresse
;
