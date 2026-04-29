import 'dart:io';
import 'package:serverpod/serverpod.dart';
import 'package:zifra_backend_server/src/generated/protocol.dart';
import 'package:zifra_backend_server/src/generated/endpoints.dart';

void main() async {
  final pod = Serverpod(['--mode', 'development'], Protocol(), Endpoints());

  await pod.start();

  final session = await pod.createSession(enableLogging: true);
  try {
    final count = await Invoices.db.count(
      session,
      where: (t) => t.projectId.equals(81),
    );
    print('DEBUG_COUNT_FOR_PROJECT_81_IS_$count');
    
    // Test open projects the old way
    final openProjects = await Projects.db.find(
      session,
      where: (t) => t.isClosed.equals(false),
    );
    print('DEBUG_OPEN_PROJECTS_${openProjects.map((p) => p.id).toList()}');
    for (var project in openProjects) {
      final invoiceCount = await Invoices.db.count(
        session,
        where: (t) => t.projectId.equals(project.id!),
      );
      print('DEBUG_PROJECT_${project.id}_INVOICE_COUNT_$invoiceCount');
    }

  } catch (e) {
    print('DEBUG: ERROR: $e');
  } finally {
    await session.close();
    exit(0);
  }
}
