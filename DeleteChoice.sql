CREATE OR REPLACE PROCEDURE DeleteChoice
(
    IN OptionID INT
)
LANGUAGE plpgsql
AS $$
    BEGIN
        DELETE FROM Choice *
        WHERE OptionID = OptionID;

        IF NOT FOUND THEN
        RAISE EXCEPTION "Choice not founc"
        END IF;

        EXCEPTION
            WHEN foreign_key_violation THEN
                RAISE EXCEPTION "OptionID invalid";
    END;
$$;