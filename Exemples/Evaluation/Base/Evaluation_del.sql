/*
-- =========================================================================== A
-- Composant Evaluation_del.sql
-- -----------------------------------------------------------------------------
Activité : IFT187
Trimestre : 2018-3
Encodage : UTF-8, sans BOM; fin de ligne Unix (LF)
Plateforme : PostgreSQL 9.3 à 10.5
Responsable : Luc.LAVOIE@USherbrooke.ca
Version : 0.1.0a
Statut : en vigueur
-- =========================================================================== A
*/

/*
-- =========================================================================== B
Suppression des tuples des tables du schéma correspondant au modèle d’Evaluation et
consignation des résultats d’évaluation de l’Université de Samarcande (UdeS).
Pour plus d’information, voir Evaluation_cre.sql.

Notes de mise en oeuvre
(a) Les tables elles-mêmes ne sont pas supprimées.
-- =========================================================================== B
*/

DELETE FROM Resultat ;
DELETE FROM Activite ;
DELETE FROM Etudiant ;
DELETE FROM TypeEvaluation ;

  /*
-- =========================================================================== Z
Contributeurs :
  (CK01) Christina.KHNAISSER@USherbrooke.ca,
  (LL01) Luc.LAVOIE@USherbrooke.ca

Adresse, droits d’auteur et copyright :
  Groupe Metis
  Département d’informatique
  Faculté des sciences
  Université de Sherbrooke
  Sherbrooke (Québec)  J1K 2R1
  Canada
  http://info.usherbrooke.ca/llavoie/
  [CC-BY-NC-4.0 (http://creativecommons.org/licenses/by-nc/4.0)]

Tâches projetées :
  Aucune.

Tâches réalisées :
2018-09-01 (LL01) : Suppression
  * DROP DOMAIN SiglecCours, Matricule, TypeEval, Note, Trimestre.
2013-09-03 (LL01) : Suppression
  * DROP TABLE Activite, TypeEvaluation, Etudiant, Resultat.

Références :
[mod] http://info.usherbrooke.ca/llavoie/enseignement/Modules/
-- -----------------------------------------------------------------------------
-- fin de Evaluation_del.sql
-- =========================================================================== Z
*/
