import 'package:serverpod/serverpod.dart';
import 'generated/protocol.dart';

class InvoicesEndpoint extends Endpoint {

  Future<List<Invoices>> getOpenProjectInvoices(
    Session session,
    String rucBeneficiario,
  ) async {
    
    // 1. Buscar proyectos abiertos para el RUC dado
    final openProjects = await Projects.db.find(
      session,
      where: (t) =>
          t.rucBeneficiario.equals(rucBeneficiario) & t.isClosed.equals(false),
    );

    if (openProjects.isEmpty) {
      return [];
    }

    // 2. Obtener los IDs de los proyectos encontrados
    final projectIds = openProjects.map((p) => p.id).whereType<int>().toList();

    if (projectIds.isEmpty) {
      return [];
    }

    // 3. Buscar todas las facturas asociadas a esos proyectos
    final invoices = await Invoices.db.find(
      session,
      where: (t) => t.projectId.inSet(projectIds.toSet()),
      include: Invoices.include(
        detalles: InvoiceDetail.includeList(),
      ),
    );

    return invoices;
  }
}
