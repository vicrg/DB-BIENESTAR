/*Buscar el folio obtenido desde el mapa*/
SELECT sp.* FROM survey_person AS sp
INNER JOIN survey AS s ON  s.id = sp.survey_id
INNER JOIN survey_user_folio AS suf ON suf."id" = s.survey_user_folio_id
WHERE suf.folio = '' --sustituirFolio - la condicion se puede alterar por le numero de folios o rangos. 