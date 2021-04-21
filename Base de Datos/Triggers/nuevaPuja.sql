
CREATE TRIGGER nuevaPuja
    BEFORE INSERT
    ON public."Pujas"
    FOR EACH STATEMENT
    EXECUTE PROCEDURE public.trigger_actualizar_pujas();