BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "category" DROP COLUMN "projectId";
ALTER TABLE "category" ADD COLUMN "isDeleted" boolean NOT NULL DEFAULT false;
ALTER TABLE "category" ADD COLUMN "deletedAt" timestamp without time zone;

--
-- MIGRATION VERSION FOR zifra_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('zifra_backend', '20251216182226649', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251216182226649', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
