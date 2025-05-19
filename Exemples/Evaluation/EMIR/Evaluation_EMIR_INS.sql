create or replace procedure "EMIR".Resultat_INS
  (
    _matricule Matricule,
    _activite SigleCours,
    _te TypeEval,
    _trimestre Trimestre,
    _note Note
  )
begin atomic
  insert into Resultat
    ( matricule,  activite,  te,  trimestre,  note)
  values
    (_matricule, _activite, _te, _trimestre, _note);
end
;

/*TEST*/call "EMIR".Resultat_MOD ('15113150', 'IFT187', 'PR', '20133', 75) ;
