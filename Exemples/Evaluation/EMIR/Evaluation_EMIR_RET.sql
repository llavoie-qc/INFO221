create or replace procedure "EMIR".Resultat_RET
  (
    _matricule Matricule,
    _activite SigleCours,
    _te TypeEval,
    _trimestre Trimestre
  )
begin atomic
   delete from Resultat
   where matricule = _matricule
     and activite = _activite
     and te = _te
     and trimestre = _trimestre;
end;

/*TEST*/call "EMIR".Resultat_RET ('15113150', 'IFT187', 'TP', '20133') ;
