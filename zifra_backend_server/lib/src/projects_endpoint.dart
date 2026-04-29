import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

class ProjectsEndpoint extends Endpoint {
  Future<int> createProject(Session session, Projects project) async {
    // Sanitize inputs
    project.cliente = project.cliente.trim();
    project.nombre = project.nombre.trim();
    project.rucBeneficiario = project.rucBeneficiario?.trim();

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

  Future<List<Projects>> getOpenProjects(Session session, {String? rucBeneficiario}) async {
    return await Projects.db.find(
      session,
      where: (t) => t.isClosed.equals(false) & (rucBeneficiario == null ? t.rucBeneficiario.equals(null) : t.rucBeneficiario.equals(rucBeneficiario)),
    );
  }

  Future<void> deleteProject(Session session, int projectId) async {
    final project = await Projects.db.findById(session, projectId);
    if (project == null) throw ProjectException(message: 'Proyecto no encontrado');
    if (project.isClosed) throw ProjectException(message: 'No se puede eliminar un proyecto cerrado');

    // Obtener todas las facturas para borrar sus hijos en cascada
    final invoices = await Invoices.db.find(
      session,
      where: (t) => t.projectId.equals(projectId),
    );

    // Borrar hijos de cada factura, luego facturas, luego proyecto
    for (final invoice in invoices) {
      await InvoiceDetail.db.deleteWhere(session, where: (t) => t.invoiceId.equals(invoice.id!));
      await Pago.db.deleteWhere(session, where: (t) => t.invoiceId.equals(invoice.id!));
      await InvoiceInfoAdicional.db.deleteWhere(session, where: (t) => t.invoiceId.equals(invoice.id!));
    }
    await Invoices.db.deleteWhere(session, where: (t) => t.projectId.equals(projectId));
    await Projects.db.deleteRow(session, project);
  }

  Future<void> closeProject(Session session, int projectId) async {
    final project = await Projects.db.findById(session, projectId);
    if (project == null) throw ProjectException(message: 'Proyecto no encontrado');
    if (project.isClosed) throw ProjectException(message: 'El proyecto ya está cerrado');

    // Eliminar las facturas no seleccionadas y sus dependencias
    final unselectedInvoices = await Invoices.db.find(
      session,
      where: (t) => t.projectId.equals(projectId) & t.estaSeleccionada.equals(false),
    );

    for (final invoice in unselectedInvoices) {
      await InvoiceDetail.db.deleteWhere(session, where: (t) => t.invoiceId.equals(invoice.id!));
      await Pago.db.deleteWhere(session, where: (t) => t.invoiceId.equals(invoice.id!));
      await InvoiceInfoAdicional.db.deleteWhere(session, where: (t) => t.invoiceId.equals(invoice.id!));
    }

    if (unselectedInvoices.isNotEmpty) {
       final unselectedIds = unselectedInvoices.map((e) => e.id!).toList();
       await Invoices.db.deleteWhere(session, where: (t) => t.id.inSet(unselectedIds.toSet()));
    }

    await Projects.db.updateRow(session, project..isClosed = true);
  }

  Future<List<Projects>> getClosedProjects(Session session, {String? rucBeneficiario}) async {
    return await Projects.db.find(
      session,
      where: (t) => t.isClosed.equals(true) & (rucBeneficiario == null ? t.rucBeneficiario.equals(null) : t.rucBeneficiario.equals(rucBeneficiario)),
    );
  }
}
