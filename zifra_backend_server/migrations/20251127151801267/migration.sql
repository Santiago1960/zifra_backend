BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "invoice_detail" DROP CONSTRAINT "invoice_detail_fk_1";
ALTER TABLE "invoice_detail" DROP COLUMN "_invoicesDetallesInvoicesId";

--
-- MIGRATION VERSION FOR zifra_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('zifra_backend', '20251127151801267', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251127151801267', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
