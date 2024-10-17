--Generación de sahpes con OSGEO
pgsql2shp -f "C:\Users\Lezs_\OneDrive\Documentos\MyWorkSpace\mapas" -h server -p 5432 -u user -P "" "msvc_dash_survey" "SELECT suf.folio AS folio, ST_SetSRID ( ST_Point ( CAST ( s.longitude AS FLOAT ), CAST ( s.latitude AS FLOAT ) ), 4326 ) AS geom FROM survey s LEFT JOIN survey_person sp ON s.survey_user_folio_id = sp.survey_id  LEFT JOIN survey_user_folio AS suf ON suf."id" = s.survey_user_folio_id WHERE s.latitude IS NOT NULL AND s.street IS NOT NULL AND s.longitude IS NOT NULL AND s.latitude <> '' AND s.longitude <> '' GROUP BY suf.folio, s.survey_user_folio_id, s.longitude, s.latitude;"
--Gennerador de archivo dump de datos, relaciones, tablas y estructura
pg_dump -h server -p 5432 -U user -Fc -b -v -f "C:\Users\Lezs_\OneDrive\Documentos\MyWorkSpace\respaldosurvey.dump" database
--Restauración de archivo dump antes generado
pg_restore -h server -p 5432 -U user -d msvc_dash_survey -v C:/Users/Lezs_/OneDrive/Documentos/MyWorkSpace/respaldosurvey.dump