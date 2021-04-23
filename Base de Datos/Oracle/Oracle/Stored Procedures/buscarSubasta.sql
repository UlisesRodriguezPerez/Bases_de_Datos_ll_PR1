

CREATE OR REPLACE FUNCTION buscarsubasta( pidsubasta integer ) RETURN integer AS
    idNumero INTEGER;
    
    BEGIN
        SELECT S."IdSubasta" into idNumero
        FROM "Subasta" S
        WHERE pidSubasta = pidsubasta;
    END;
/
    --LANGUAGE 'sql'
    --COST 100
    --VOLATILE PARALLEL UNSAFE
/*AS $BODY$
SELECT 
		IdSubasta
		
FROM 
	Subasta
WHERE
	pidsubasta = "IdSubasta"
$BODY$;
*/

