BEGIN;


--
-- MIGRATION VERSION FOR zifra_backend
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('zifra_backend', '20251128151412392', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251128151412392', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
