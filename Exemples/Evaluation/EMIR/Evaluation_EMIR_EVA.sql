create or replace function "EMIR".Resultat_EVA ()
  returns table
    (
    matricule  Matricule,
    TE         TypeEval,
    activite   SigleCours,
    trimestre  Trimestre,
    note       Note
    )
begin atomic
  select * from Resultat;
end;

/*TEST*/select * from "EMIR".Resultat_EVA () ;

create or replace function "EMIR".Resultat_EVA_note_accumulee
  -- Note accumulée totale d’un étudiant pour une activité et un trimestre donnés
  (_matricule Matricule, _activite SigleCours, _trimestre Trimestre)
  returns Integer
return (
  select sum(note)
  from Resultat
  where matricule = _matricule and activite = _activite and trimestre = _trimestre
  );

/*TEST*/select "EMIR".Resultat_EVA_note_accumulee ('15113150', 'IFT187', '20133');
