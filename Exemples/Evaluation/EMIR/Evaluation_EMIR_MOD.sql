create or replace procedure "EMIR".Resultat_MOD
  (
    _matricule Matricule,
    _activite SigleCours,
    _te TypeEval,
    _trimestre Trimestre,
    _note Note
  )
begin atomic
   update resultat
   set note = _note
   where matricule = _matricule
     and activite = _activite
     and te = _te
     and trimestre = _trimestre;
end;

/*TEST*/call "EMIR".Resultat_MOD ('15113150', 'IFT187', 'TP', '20133', 85) ;
