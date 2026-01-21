/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../category_endpoint.dart' as _i2;
import '../greeting_endpoint.dart' as _i3;
import '../invoices_endpoint.dart' as _i4;
import '../projects_endpoint.dart' as _i5;
import 'package:zifra_backend_server/src/generated/category.dart' as _i6;
import 'package:zifra_backend_server/src/generated/invoices.dart' as _i7;
import 'package:zifra_backend_server/src/generated/projects.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'category': _i2.CategoryEndpoint()
        ..initialize(
          server,
          'category',
          null,
        ),
      'greeting': _i3.GreetingEndpoint()
        ..initialize(
          server,
          'greeting',
          null,
        ),
      'invoices': _i4.InvoicesEndpoint()
        ..initialize(
          server,
          'invoices',
          null,
        ),
      'projects': _i5.ProjectsEndpoint()
        ..initialize(
          server,
          'projects',
          null,
        ),
    };
    connectors['category'] = _i1.EndpointConnector(
      name: 'category',
      endpoint: endpoints['category']!,
      methodConnectors: {
        'getCategories': _i1.MethodConnector(
          name: 'getCategories',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).getCategories(
            session,
            params['userId'],
          ),
        ),
        'addCategory': _i1.MethodConnector(
          name: 'addCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i6.Category>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).addCategory(
            session,
            params['category'],
          ),
        ),
        'updateCategory': _i1.MethodConnector(
          name: 'updateCategory',
          params: {
            'category': _i1.ParameterDescription(
              name: 'category',
              type: _i1.getType<_i6.Category>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).updateCategory(
            session,
            params['category'],
          ),
        ),
        'deleteCategory': _i1.MethodConnector(
          name: 'deleteCategory',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['category'] as _i2.CategoryEndpoint).deleteCategory(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['greeting'] = _i1.EndpointConnector(
      name: 'greeting',
      endpoint: endpoints['greeting']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['greeting'] as _i3.GreetingEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['invoices'] = _i1.EndpointConnector(
      name: 'invoices',
      endpoint: endpoints['invoices']!,
      methodConnectors: {
        'getOpenProjectInvoices': _i1.MethodConnector(
          name: 'getOpenProjectInvoices',
          params: {
            'rucBeneficiario': _i1.ParameterDescription(
              name: 'rucBeneficiario',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['invoices'] as _i4.InvoicesEndpoint)
                  .getOpenProjectInvoices(
            session,
            params['rucBeneficiario'],
          ),
        ),
        'saveInvoices': _i1.MethodConnector(
          name: 'saveInvoices',
          params: {
            'invoices': _i1.ParameterDescription(
              name: 'invoices',
              type: _i1.getType<List<_i7.Invoices>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['invoices'] as _i4.InvoicesEndpoint).saveInvoices(
            session,
            params['invoices'],
          ),
        ),
        'getProjectInvoices': _i1.MethodConnector(
          name: 'getProjectInvoices',
          params: {
            'projectId': _i1.ParameterDescription(
              name: 'projectId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['invoices'] as _i4.InvoicesEndpoint)
                  .getProjectInvoices(
            session,
            params['projectId'],
          ),
        ),
        'createProjectWithInvoices': _i1.MethodConnector(
          name: 'createProjectWithInvoices',
          params: {
            'project': _i1.ParameterDescription(
              name: 'project',
              type: _i1.getType<_i8.Projects>(),
              nullable: false,
            ),
            'invoices': _i1.ParameterDescription(
              name: 'invoices',
              type: _i1.getType<List<_i7.Invoices>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['invoices'] as _i4.InvoicesEndpoint)
                  .createProjectWithInvoices(
            session,
            params['project'],
            params['invoices'],
          ),
        ),
        'updateInvoiceCategory': _i1.MethodConnector(
          name: 'updateInvoiceCategory',
          params: {
            'claveAcceso': _i1.ParameterDescription(
              name: 'claveAcceso',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['invoices'] as _i4.InvoicesEndpoint)
                  .updateInvoiceCategory(
            session,
            params['claveAcceso'],
            params['categoryId'],
          ),
        ),
        'updateInvoicesCategory': _i1.MethodConnector(
          name: 'updateInvoicesCategory',
          params: {
            'clavesAcceso': _i1.ParameterDescription(
              name: 'clavesAcceso',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'categoryId': _i1.ParameterDescription(
              name: 'categoryId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['invoices'] as _i4.InvoicesEndpoint)
                  .updateInvoicesCategory(
            session,
            params['clavesAcceso'],
            params['categoryId'],
          ),
        ),
      },
    );
    connectors['projects'] = _i1.EndpointConnector(
      name: 'projects',
      endpoint: endpoints['projects']!,
      methodConnectors: {
        'createProject': _i1.MethodConnector(
          name: 'createProject',
          params: {
            'project': _i1.ParameterDescription(
              name: 'project',
              type: _i1.getType<_i8.Projects>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['projects'] as _i5.ProjectsEndpoint).createProject(
            session,
            params['project'],
          ),
        ),
        'getOpenProjects': _i1.MethodConnector(
          name: 'getOpenProjects',
          params: {
            'rucBeneficiario': _i1.ParameterDescription(
              name: 'rucBeneficiario',
              type: _i1.getType<String?>(),
              nullable: true,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['projects'] as _i5.ProjectsEndpoint).getOpenProjects(
            session,
            rucBeneficiario: params['rucBeneficiario'],
          ),
        ),
      },
    );
  }
}
