import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

class ProjectsEndpoint extends Endpoint {
  Future<int> createProject(Session session, Projects project) async {
    // Sanitize inputs
    project.cliente = project.cliente.trim();
    project.nombre = project.nombre.trim();
    project.rucBeneficiario = project.rucBeneficiario?.trim();

    print('Checking for duplicate project:');
    print('Cliente: "${project.cliente}"');
    print('Nombre: "${project.nombre}"');
    print('RUC: "${project.rucBeneficiario}"');

    // Check for duplicates (case-insensitive)
    final existingProject = await Projects.db.findFirstRow(
      session,
      where: (t) =>
          t.cliente.ilike(project.cliente) &
          t.nombre.ilike(project.nombre) &
          (project.rucBeneficiario == null
              ? t.rucBeneficiario.equals(null)
              : t.rucBeneficiario.equals(project.rucBeneficiario)),
    );

    if (existingProject != null) {
      print('Duplicate found: ID ${existingProject.id}');
      throw ProjectException(message: 'Este proyecto ya existe en la Base de Datos');
    } else {
      print('No duplicate found.');
    }

    // Enforce server-side creation date
    project.fechaCreacion = DateTime.now();
    // Enforce default status
    project.isClosed = false;

    final insertedProject = await Projects.db.insertRow(session, project);
    return insertedProject.id!;
  }
}
