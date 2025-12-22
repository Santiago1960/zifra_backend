BEGIN;

--
-- Class Category as table category
--
CREATE TABLE "category" (
    "id" bigserial PRIMARY KEY,
    "userId" bigint NOT NULL,
    "name" text NOT NULL,
    "color" text NOT NULL,
    "isDeleted" boolean DEFAULT false,
    "deletedAt" timestamp without time zone
);

--
-- Class InvoiceDetail as table invoice_detail
--
CREATE TABLE "invoice_detail" (
    "id" bigserial PRIMARY KEY,
    "invoiceId" bigint NOT NULL,
    "codigoPrincipal" text NOT NULL,
    "codigoAuxiliar" text,
    "descripcion" text NOT NULL,
    "cantidad" double precision NOT NULL,
    "precioUnitario" double precision NOT NULL,
    "descuento" double precision NOT NULL,
    "precioTotalSinImpuesto" double precision NOT NULL
);

--
-- Class InvoiceInfoAdicional as table invoice_info_adicional
--
CREATE TABLE "invoice_info_adicional" (
    "id" bigserial PRIMARY KEY,
    "clave" text NOT NULL,
    "valor" text NOT NULL,
    "invoiceId" bigint NOT NULL
);

--
-- Class Invoices as table invoices
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
    "categoryId" bigint,
    "projectId" bigint NOT NULL,
    "_projectsInvoicesProjectsId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "invoices_clave_acceso_idx" ON "invoices" USING btree ("claveAcceso");

--
-- Class Pago as table pago
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
-- Class Projects as table projects
--
CREATE TABLE "projects" (
    "id" bigserial PRIMARY KEY,
    "cliente" text NOT NULL,
    "nombre" text NOT NULL,
    "fechaCreacion" timestamp without time zone NOT NULL,
    "isClosed" boolean NOT NULL,
    "rucBeneficiario" text
);

--
-- Class CloudStorageEntry as table serverpod_cloud_storage
--
CREATE TABLE "serverpod_cloud_storage" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "addedTime" timestamp without time zone NOT NULL,
    "expiration" timestamp without time zone,
    "byteData" bytea NOT NULL,
    "verified" boolean NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_path_idx" ON "serverpod_cloud_storage" USING btree ("storageId", "path");
CREATE INDEX "serverpod_cloud_storage_expiration" ON "serverpod_cloud_storage" USING btree ("expiration");

--
-- Class CloudStorageDirectUploadEntry as table serverpod_cloud_storage_direct_upload
--
CREATE TABLE "serverpod_cloud_storage_direct_upload" (
    "id" bigserial PRIMARY KEY,
    "storageId" text NOT NULL,
    "path" text NOT NULL,
    "expiration" timestamp without time zone NOT NULL,
    "authKey" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_cloud_storage_direct_upload_storage_path" ON "serverpod_cloud_storage_direct_upload" USING btree ("storageId", "path");

--
-- Class FutureCallEntry as table serverpod_future_call
--
CREATE TABLE "serverpod_future_call" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "serializedObject" text,
    "serverId" text NOT NULL,
    "identifier" text
);

-- Indexes
CREATE INDEX "serverpod_future_call_time_idx" ON "serverpod_future_call" USING btree ("time");
CREATE INDEX "serverpod_future_call_serverId_idx" ON "serverpod_future_call" USING btree ("serverId");
CREATE INDEX "serverpod_future_call_identifier_idx" ON "serverpod_future_call" USING btree ("identifier");

--
-- Class ServerHealthConnectionInfo as table serverpod_health_connection_info
--
CREATE TABLE "serverpod_health_connection_info" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "active" bigint NOT NULL,
    "closing" bigint NOT NULL,
    "idle" bigint NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_connection_info_timestamp_idx" ON "serverpod_health_connection_info" USING btree ("timestamp", "serverId", "granularity");

--
-- Class ServerHealthMetric as table serverpod_health_metric
--
CREATE TABLE "serverpod_health_metric" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "serverId" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "isHealthy" boolean NOT NULL,
    "value" double precision NOT NULL,
    "granularity" bigint NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_health_metric_timestamp_idx" ON "serverpod_health_metric" USING btree ("timestamp", "serverId", "name", "granularity");

--
-- Class LogEntry as table serverpod_log
--
CREATE TABLE "serverpod_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "reference" text,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "logLevel" bigint NOT NULL,
    "message" text NOT NULL,
    "error" text,
    "stackTrace" text,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_log_sessionLogId_idx" ON "serverpod_log" USING btree ("sessionLogId");

--
-- Class MessageLogEntry as table serverpod_message_log
--
CREATE TABLE "serverpod_message_log" (
    "id" bigserial PRIMARY KEY,
    "sessionLogId" bigint NOT NULL,
    "serverId" text NOT NULL,
    "messageId" bigint NOT NULL,
    "endpoint" text NOT NULL,
    "messageName" text NOT NULL,
    "duration" double precision NOT NULL,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

--
-- Class MethodInfo as table serverpod_method
--
CREATE TABLE "serverpod_method" (
    "id" bigserial PRIMARY KEY,
    "endpoint" text NOT NULL,
    "method" text NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_method_endpoint_method_idx" ON "serverpod_method" USING btree ("endpoint", "method");

--
-- Class DatabaseMigrationVersion as table serverpod_migrations
--
CREATE TABLE "serverpod_migrations" (
    "id" bigserial PRIMARY KEY,
    "module" text NOT NULL,
    "version" text NOT NULL,
    "timestamp" timestamp without time zone
);

-- Indexes
CREATE UNIQUE INDEX "serverpod_migrations_ids" ON "serverpod_migrations" USING btree ("module");

--
-- Class QueryLogEntry as table serverpod_query_log
--
CREATE TABLE "serverpod_query_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "sessionLogId" bigint NOT NULL,
    "messageId" bigint,
    "query" text NOT NULL,
    "duration" double precision NOT NULL,
    "numRows" bigint,
    "error" text,
    "stackTrace" text,
    "slow" boolean NOT NULL,
    "order" bigint NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_query_log_sessionLogId_idx" ON "serverpod_query_log" USING btree ("sessionLogId");

--
-- Class ReadWriteTestEntry as table serverpod_readwrite_test
--
CREATE TABLE "serverpod_readwrite_test" (
    "id" bigserial PRIMARY KEY,
    "number" bigint NOT NULL
);

--
-- Class RuntimeSettings as table serverpod_runtime_settings
--
CREATE TABLE "serverpod_runtime_settings" (
    "id" bigserial PRIMARY KEY,
    "logSettings" json NOT NULL,
    "logSettingsOverrides" json NOT NULL,
    "logServiceCalls" boolean NOT NULL,
    "logMalformedCalls" boolean NOT NULL
);

--
-- Class SessionLogEntry as table serverpod_session_log
--
CREATE TABLE "serverpod_session_log" (
    "id" bigserial PRIMARY KEY,
    "serverId" text NOT NULL,
    "time" timestamp without time zone NOT NULL,
    "module" text,
    "endpoint" text,
    "method" text,
    "duration" double precision,
    "numQueries" bigint,
    "slow" boolean,
    "error" text,
    "stackTrace" text,
    "authenticatedUserId" bigint,
    "isOpen" boolean,
    "touched" timestamp without time zone NOT NULL
);

-- Indexes
CREATE INDEX "serverpod_session_log_serverid_idx" ON "serverpod_session_log" USING btree ("serverId");
CREATE INDEX "serverpod_session_log_touched_idx" ON "serverpod_session_log" USING btree ("touched");
CREATE INDEX "serverpod_session_log_isopen_idx" ON "serverpod_session_log" USING btree ("isOpen");

--
-- Foreign relations for "invoice_detail" table
--
ALTER TABLE ONLY "invoice_detail"
    ADD CONSTRAINT "invoice_detail_fk_0"
    FOREIGN KEY("invoiceId")
    REFERENCES "invoices"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "invoice_info_adicional" table
--
ALTER TABLE ONLY "invoice_info_adicional"
    ADD CONSTRAINT "invoice_info_adicional_fk_0"
    FOREIGN KEY("invoiceId")
    REFERENCES "invoices"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "invoices" table
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
-- Foreign relations for "pago" table
--
ALTER TABLE ONLY "pago"
    ADD CONSTRAINT "pago_fk_0"
    FOREIGN KEY("invoiceId")
    REFERENCES "invoices"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_log" table
--
ALTER TABLE ONLY "serverpod_log"
    ADD CONSTRAINT "serverpod_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_message_log" table
--
ALTER TABLE ONLY "serverpod_message_log"
    ADD CONSTRAINT "serverpod_message_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;

--
-- Foreign relations for "serverpod_query_log" table
--
ALTER TABLE ONLY "serverpod_query_log"
    ADD CONSTRAINT "serverpod_query_log_fk_0"
    FOREIGN KEY("sessionLogId")
    REFERENCES "serverpod_session_log"("id")
    ON DELETE CASCADE
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR zifra_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('zifra_backend', '20251222174114356', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251222174114356', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
