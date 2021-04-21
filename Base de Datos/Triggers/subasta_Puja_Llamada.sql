-- Trigger: crearpuja

-- DROP TRIGGER crearpuja ON public."Subasta";

CREATE TRIGGER crearpuja
    AFTER INSERT
    ON public."Subasta"
    FOR EACH STATEMENT
    EXECUTE PROCEDURE public.trigger_subastas_pujas();