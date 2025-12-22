BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "invoices" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "invoices" (
    "id" bigserial PRIMARY KEY,
    "razonSocial" text NOT NULL,
    "nombreComercial" text NOT NULL,
    "ruc" text NOT NULL,
    "claveAcceso" text NOT NULL,
    "codDoc" text NOT NULL,
    "estab" text NOT NULL,
    "ptoEmi" text NOT NULL,
    "secuencial" text NOT NULL,
    "dirMatriz" text NOT NULL,
    "fechaEmision" text NOT NULL,
    "dirEstablecimiento" text NOT NULL,
    "contribuyenteEspecial" text NOT NULL,
    "obligadoContabilidad" text NOT NULL,
    "tipoIdentificacionComprador" text NOT NULL,
    "razonSocialComprador" text NOT NULL,
    "identificacionComprador" text NOT NULL,
    "totalSinImpuestos" double precision NOT NULL,
    "totalDescuento" double precision NOT NULL,
    "baseImponibleIvaCero" double precision NOT NULL,
    "baseImponibleIva" double precision NOT NULL,
    "valorIVA" double precision NOT NULL,
    "valorDevolucionIva" double precision NOT NULL,
    "propina" double precision NOT NULL,
    "importeTotal" double precision NOT NULL,
    "numeroAutorizacion" text NOT NULL,
    "fechaAutorizacion" text NOT NULL,
    "estaSeleccionada" boolean NOT NULL,
    "certificada" boolean NOT NULL,
    "categoryId" bigint NOT NULL,
    "projectId" bigint NOT NULL,
    "_projectsInvoicesProjectsId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "invoices_clave_acceso_idx" ON "invoices" USING btree ("claveAcceso");

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "invoices"
    ADD CONSTRAINT "invoices_fk_0"
    FOREIGN KEY("categoryId")
    REFERENCES "category"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "invoices"
    ADD CONSTRAINT "invoices_fk_1"
    FOREIGN KEY("projectId")
    REFERENCES "projects"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "invoices"
    ADD CONSTRAINT "invoices_fk_2"
    FOREIGN KEY("_projectsInvoicesProjectsId")
    REFERENCES "projects"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR zifra_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('zifra_backend', '20251222172849479', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251222172849479', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
