BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "invoices" DROP CONSTRAINT "invoices_fk_2";
ALTER TABLE "invoices" DROP CONSTRAINT "invoices_fk_0";
ALTER TABLE "invoices" DROP CONSTRAINT "invoices_fk_1";
ALTER TABLE "invoices" DROP COLUMN "categoryId";
ALTER TABLE "invoices" ADD COLUMN "categoriaId" bigint;
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
-- MIGRATION VERSION FOR zifra_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('zifra_backend', '20251222182250641', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251222182250641', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
