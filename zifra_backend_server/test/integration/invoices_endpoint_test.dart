import 'package:test/test.dart';
import 'package:zifra_backend_server/src/generated/protocol.dart';
import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod('Given Invoices endpoint', (sessionBuilder, endpoints) {
    var session = sessionBuilder.build();

    tearDown(() async {
      // Clean up data if needed, though withServerpod usually handles transaction rollback
      // But if we use a separate session for setup, we might need to be careful.
      // Actually, withServerpod rolls back the transaction after each test if configured.
      // We should use the session from sessionBuilder if possible to ensure we are in the same transaction?
      // Wait, sessionBuilder.build() creates a new session.
      // If rollbackDatabase is afterEach (default), it might roll back everything.
    });

    test(
      'when calling `getOpenProjectInvoices` with valid RUC then returns invoices for open projects',
      () async {
        // 1. Setup Data
        final ruc = '1234567890001';
        final otherRuc = '9876543210001';

        // Create an open project for the target RUC
        final openProject = await Projects.db.insertRow(
          session,
          Projects(
            cliente: 'Cliente A',
            nombre: 'Proyecto Abierto',
            fechaCreacion: DateTime.now(),
            isClosed: false,
            rucBeneficiario: ruc,
          ),
        );

        // Create a closed project for the target RUC
        final closedProject = await Projects.db.insertRow(
          session,
          Projects(
            cliente: 'Cliente A',
            nombre: 'Proyecto Cerrado',
            fechaCreacion: DateTime.now(),
            isClosed: true,
            rucBeneficiario: ruc,
          ),
        );

        // Create an open project for another RUC
        final otherProject = await Projects.db.insertRow(
          session,
          Projects(
            cliente: 'Cliente B',
            nombre: 'Otro Proyecto',
            fechaCreacion: DateTime.now(),
            isClosed: false,
            rucBeneficiario: otherRuc,
          ),
        );

        // Create invoices for the open project
        final invoice1 = await Invoices.db.insertRow(
          session,
          Invoices(
            razonSocial: 'Razon Social 1',
            nombreComercial: 'Comercial 1',
            ruc: '1111111111111',
            claveAcceso: '111',
            codDoc: '01',
            estab: '001',
            ptoEmi: '001',
            secuencial: '000000001',
            dirMatriz: 'Dir 1',
            fechaEmision: '2024-01-01',
            dirEstablecimiento: 'Dir 1',
            contribuyenteEspecial: '12345',
            obligadoContabilidad: 'SI',
            tipoIdentificacionComprador: '05',
            razonSocialComprador: 'Comprador 1',
            identificacionComprador: '2222222222',
            totalSinImpuestos: 100.0,
            totalDescuento: 0.0,
            baseImponibleIvaCero: 0.0,
            baseImponibleIva: 100.0,
            valorIVA: 12.0,
            valorDevolucionIva: 0.0,
            propina: 0.0,
            importeTotal: 112.0,
            categoria: 'Categoria A',
            estaSeleccionada: false,
            certificada: false,
            numeroAutorizacion: '1234567890',
            fechaAutorizacion: '2024-01-01',
            projectId: openProject.id!,
          ),
        );

        // Create invoices for the closed project
        await Invoices.db.insertRow(
          session,
          Invoices(
            razonSocial: 'Razon Social 2',
            nombreComercial: 'Comercial 2',
            ruc: '1111111111111',
            claveAcceso: '222',
            codDoc: '01',
            estab: '001',
            ptoEmi: '001',
            secuencial: '000000002',
            dirMatriz: 'Dir 2',
            fechaEmision: '2024-01-01',
            dirEstablecimiento: 'Dir 2',
            contribuyenteEspecial: '12345',
            obligadoContabilidad: 'SI',
            tipoIdentificacionComprador: '05',
            razonSocialComprador: 'Comprador 1',
            identificacionComprador: '2222222222',
            totalSinImpuestos: 200.0,
            totalDescuento: 0.0,
            baseImponibleIvaCero: 0.0,
            baseImponibleIva: 200.0,
            valorIVA: 24.0,
            valorDevolucionIva: 0.0,
            propina: 0.0,
            importeTotal: 224.0,
            categoria: 'Categoria A',
            estaSeleccionada: false,
            certificada: false,
            numeroAutorizacion: '1234567890',
            fechaAutorizacion: '2024-01-01',
            projectId: closedProject.id!,
          ),
        );

        // Create invoice details for the open project invoice
        await InvoiceDetail.db.insertRow(
          session,
          InvoiceDetail(
            codigoPrincipal: 'COD1',
            descripcion: 'Detalle 1',
            cantidad: 1.0,
            precioUnitario: 50.0,
            descuento: 0.0,
            precioTotalSinImpuesto: 50.0,
            invoiceId: invoice1.id!,
          ),
        );

        await InvoiceDetail.db.insertRow(
          session,
          InvoiceDetail(
            codigoPrincipal: 'COD2',
            descripcion: 'Detalle 2',
            cantidad: 1.0,
            precioUnitario: 50.0,
            descuento: 0.0,
            precioTotalSinImpuesto: 50.0,
            invoiceId: invoice1.id!,
          ),
        );

        // 2. Call Endpoint
        final result = await endpoints.invoices.getOpenProjectInvoices(
          sessionBuilder,
          ruc,
        );

        // 3. Verify Results
        expect(result, hasLength(1));
        expect(result.first.id, equals(invoice1.id));
        expect(result.first.detalles, isNotNull);
        expect(result.first.detalles, hasLength(2));
      },
    );

    test(
      'when calling `saveInvoices` with invoices and details then they are saved correctly',
      () async {
        // 1. Setup Data
        // Create a project to link the invoice to
        final project = await Projects.db.insertRow(
          session,
          Projects(
            cliente: 'Cliente Test',
            nombre: 'Proyecto Test',
            fechaCreacion: DateTime.now(),
            isClosed: false,
            rucBeneficiario: '1111111111001',
          ),
        );

        final invoicesToSave = [
          Invoices(
            razonSocial: 'Razon Social Test',
            nombreComercial: 'Comercial Test',
            ruc: '1111111111001',
            claveAcceso: '999999999',
            codDoc: '01',
            estab: '001',
            ptoEmi: '001',
            secuencial: '999999999',
            dirMatriz: 'Dir Test',
            fechaEmision: '2024-01-01',
            dirEstablecimiento: 'Dir Test',
            contribuyenteEspecial: '12345',
            obligadoContabilidad: 'SI',
            tipoIdentificacionComprador: '05',
            razonSocialComprador: 'Comprador Test',
            identificacionComprador: '2222222222',
            totalSinImpuestos: 100.0,
            totalDescuento: 0.0,
            baseImponibleIvaCero: 0.0,
            baseImponibleIva: 100.0,
            valorIVA: 12.0,
            valorDevolucionIva: 0.0,
            propina: 0.0,
            importeTotal: 112.0,
            categoria: 'Categoria Test',
            estaSeleccionada: false,
            certificada: false,
            numeroAutorizacion: '1234567890',
            fechaAutorizacion: '2024-01-01',
            projectId: project.id!,
            detalles: [
              InvoiceDetail(
                codigoPrincipal: 'TEST1',
                descripcion: 'Detalle Test 1',
                cantidad: 1.0,
                precioUnitario: 50.0,
                descuento: 0.0,
                precioTotalSinImpuesto: 50.0,
                invoiceId: 0, // Temporary ID, will be overwritten
              ),
              InvoiceDetail(
                codigoPrincipal: 'TEST2',
                descripcion: 'Detalle Test 2',
                cantidad: 1.0,
                precioUnitario: 50.0,
                descuento: 0.0,
                precioTotalSinImpuesto: 50.0,
                invoiceId: 0, // Temporary ID, will be overwritten
              ),
            ],
            pagos: [
              Pago(
                formaPago: '01',
                total: 112.0,
                plazo: 30.0,
                unidadTiempo: 'DIAS',
                invoiceId: 0, // Temporary ID
              ),
            ],
            infoAdicional: [
              InvoiceInfoAdicional(
                clave: 'Email',
                valor: 'test@test.com',
                invoiceId: 0, // Temporary ID
              ),
            ],
          ),
        ];

        // 2. Call Endpoint
        final result = await endpoints.invoices.saveInvoices(
          sessionBuilder,
          invoicesToSave,
        );

        // 3. Verify Results
        expect(result, isTrue);

        // Verify in DB
        final savedInvoice = await Invoices.db.findFirstRow(
          session,
          where: (t) => t.claveAcceso.equals('999999999'),
          include: Invoices.include(
            detalles: InvoiceDetail.includeList(),
          ),
        );

        expect(savedInvoice, isNotNull);
        expect(savedInvoice!.detalles, hasLength(2));
        expect(savedInvoice.detalles!.first.invoiceId, equals(savedInvoice.id));
      },
    );
  });
}
