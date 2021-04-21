-- Trigger: nuevapuja

-- DROP TRIGGER nuevapuja ON public."Pujas";

CREATE TRIGGER nuevapuja
    AFTER INSERT
    ON public."Pujas"
    FOR EACH STATEMENT
    EXECUTE PROCEDURE public.trigger_actualizar_pujas();