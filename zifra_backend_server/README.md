# zifra_backend_server

This is the starting point for your Serverpod server.

To run your server, you first need to start Postgres and Redis. It's easiest to do with Docker.

    docker compose up --build --detach

    serverpod create-migration
    dart bin/main.dart --apply-migrations

Then you can start the Serverpod server.

    dart bin/main.dart

When you are finished, you can shut down Serverpod with `Ctrl-C`, then stop Postgres and Redis.

    docker compose stop

# PARA PRUEBA EN FLUTTER

final result = await client.invoices.getOpenProjectInvoices('1234567890001');
