-- Table: public.VariablesSistema

-- DROP TABLE public."VariablesSistema";

CREATE TABLE public."VariablesSistema"
(
    "porcentajeMejora" smallint,
    "incrementoMinimo" real
)

TABLESPACE pg_default;

ALTER TABLE public."VariablesSistema"
    OWNER to postgres;