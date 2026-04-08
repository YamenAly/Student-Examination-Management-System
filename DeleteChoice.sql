CREATE OR REPLACE PROCEDURE DeleteChoice
(
    IN OptionID INT
)
LANGUAGE plpgsql
AS $BODY$
    BEGIN
        DELETE FROM Choice *
        WHERE OptionID = OptionID
    END
$BODY$;