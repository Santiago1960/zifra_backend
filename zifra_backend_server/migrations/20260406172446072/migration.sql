BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "category" ADD COLUMN "reference" text;

--
-- MIGRATION VERSION FOR zifra_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('zifra_backend', '20260406172446072', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260406172446072', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
