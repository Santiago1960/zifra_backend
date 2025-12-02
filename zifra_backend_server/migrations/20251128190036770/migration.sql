BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "invoice_info_adicional" (
    "id" bigserial PRIMARY KEY,
    "clave" text NOT NULL,
    "valor" text NOT NULL,
    "invoiceId" bigint NOT NULL
);

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
    "categoria" text NOT NULL,
    "estaSeleccionada" boolean NOT NULL,
    "certificada" boolean NOT NULL,
    "projectId" bigint NOT NULL,
    "_projectsInvoicesProjectsId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "invoices_clave_acceso_idx" ON "invoices" USING btree ("claveAcceso");

--
-- ACTION CREATE TABLE
--
CREATE TABLE "pago" (
    "id" bigserial PRIMARY KEY,
    "formaPago" text NOT NULL,
    "total" double precision NOT NULL,
    "plazo" double precision NOT NULL,
    "unidadTiempo" text NOT NULL,
    "invoiceId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "invoice_info_adicional"
    ADD CONSTRAINT "invoice_info_adicional_fk_0"
    FOREIGN KEY("invoiceId")
    REFERENCES "invoices"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "invoices"
    ADD CONSTRAINT "invoices_fk_0"
    FOREIGN KEY("projectId")
    REFERENCES "projects"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "invoices"
    ADD CONSTRAINT "invoices_fk_1"
    FOREIGN KEY("_projectsInvoicesProjectsId")
    REFERENCES "projects"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "pago"
    ADD CONSTRAINT "pago_fk_0"
    FOREIGN KEY("invoiceId")
    REFERENCES "invoices"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR zifra_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('zifra_backend', '20251128190036770', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251128190036770', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
