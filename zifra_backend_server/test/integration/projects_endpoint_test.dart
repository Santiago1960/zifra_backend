import 'package:test/test.dart';
import 'package:zifra_backend_server/src/generated/protocol.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Projects endpoint', (sessionBuilder, endpoints) {
    var session = sessionBuilder.build();

    test(
      'when calling `createProject` then returns a valid ID and project is saved',
      () async {
        // 1. Setup Data
        final project = Projects(
          cliente: 'Cliente Test',
          nombre: 'Proyecto Test',
          fechaCreacion: DateTime.now(), // This will be overwritten by the endpoint
          isClosed: true, // This should be overwritten by the endpoint
          rucBeneficiario: '1234567890001',
        );

        // 2. Call Endpoint
        final projectId = await endpoints.projects.createProject(
          sessionBuilder,
          project,
        );

        // 3. Verify Results
        expect(projectId, isNotNull);
        expect(projectId, isPositive);

        // Verify it exists in DB
        final savedProject = await Projects.db.findById(session, projectId);
        expect(savedProject, isNotNull);
        expect(savedProject!.nombre, equals('Proyecto Test'));
        expect(savedProject.isClosed, isFalse); // Should be forced to false
      },
    );

    test(
      'when calling `createProject` with existing project details then throws exception',
      () async {
        // 1. Setup Data - Create initial project
        final project = Projects(
          cliente: 'Cliente Duplicado',
          nombre: 'Proyecto Duplicado',
          fechaCreacion: DateTime.now(),
          isClosed: false,
          rucBeneficiario: '9999999990001',
        );

        await endpoints.projects.createProject(sessionBuilder, project);

        // 2. Call Endpoint again with same details
        expect(
          () async => await endpoints.projects.createProject(
            sessionBuilder,
            project,
          ),
          throwsA(isA<Exception>()),
        );
      },
    );

    test(
      'when calling `createProject` with similar project details (case/whitespace) then throws exception',
      () async {
        // 1. Setup Data - Create initial project
        final project1 = Projects(
          cliente: 'Cliente Similar',
          nombre: 'Proyecto Similar',
          fechaCreacion: DateTime.now(),
          isClosed: false,
          rucBeneficiario: '8888888880001',
        );

        await endpoints.projects.createProject(sessionBuilder, project1);

        // 2. Call Endpoint again with similar details (different case/whitespace)
        final project2 = Projects(
          cliente: 'CLIENTE SIMILAR ', // Uppercase and trailing space
          nombre: 'proyecto similar', // Lowercase
          fechaCreacion: DateTime.now(),
          isClosed: false,
          rucBeneficiario: '8888888880001',
        );

        expect(
          () async => await endpoints.projects.createProject(
            sessionBuilder,
            project2,
          ),
          throwsA(isA<Exception>()),
        );
      },
    );
  });
}
