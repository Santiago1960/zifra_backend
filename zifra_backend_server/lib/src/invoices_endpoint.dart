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

  Future<String> saveInvoices(Session session, List<Invoices> invoices) async {
    List<String> duplicateMessages = [];

    for (var invoice in invoices) {
      final existing = await Invoices.db.findFirstRow(
        session,
        where: (t) => t.claveAcceso.equals(invoice.claveAcceso),
        include: Invoices.include(project: Projects.include()),
      );

      if (existing != null) {
        final projectName = existing.project?.nombre ?? 'Desconocido';
        // CAMBIO: Usamos nombreComercial en lugar de razonSocial
        final clientName = existing.nombreComercial; 
        
        duplicateMessages.add('${existing.secuencial} $clientName Proyecto $projectName');
      }
    }

    if (duplicateMessages.isNotEmpty) {
       // CAMBIO: Usamos /// como separador
       return 'DUPLICATES_FOUND:${duplicateMessages.join("///")}';
    }

    await session.db.transaction((transaction) async {
      // ... (el resto del código de guardado sigue igual) ...
      for (var invoice in invoices) {
        final insertedInvoice = await Invoices.db.insertRow(session, invoice, transaction: transaction);
        
        if (invoice.detalles != null) {
          for (var d in invoice.detalles!) d.invoiceId = insertedInvoice.id!;
          await InvoiceDetail.db.insert(session, invoice.detalles!, transaction: transaction);
        }
        if (invoice.pagos != null) {
          for (var p in invoice.pagos!) p.invoiceId = insertedInvoice.id!;
          await Pago.db.insert(session, invoice.pagos!, transaction: transaction);
        }
        if (invoice.infoAdicional != null) {
          for (var i in invoice.infoAdicional!) i.invoiceId = insertedInvoice.id!;
          await InvoiceInfoAdicional.db.insert(session, invoice.infoAdicional!, transaction: transaction);
        }
      }
      return true;
    });

    return 'OK';
  }
}
