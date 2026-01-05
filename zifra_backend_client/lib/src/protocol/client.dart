/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:zifra_backend_client/src/protocol/category.dart' as _i3;
import 'package:zifra_backend_client/src/protocol/greeting.dart' as _i4;
import 'package:zifra_backend_client/src/protocol/invoices.dart' as _i5;
import 'package:zifra_backend_client/src/protocol/projects.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointCategory extends _i1.EndpointRef {
  EndpointCategory(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'category';

  /// Obtiene todas las categorías activas de un usuario específico.
  /// Como no hay auth, el cliente debe enviar el userId.
  _i2.Future<List<_i3.Category>> getCategories(int userId) =>
      caller.callServerEndpoint<List<_i3.Category>>(
        'category',
        'getCategories',
        {'userId': userId},
      );

  /// Crea una nueva categoría.
  _i2.Future<void> addCategory(_i3.Category category) =>
      caller.callServerEndpoint<void>(
        'category',
        'addCategory',
        {'category': category},
      );

  /// Actualiza una categoría existente.
  _i2.Future<void> updateCategory(_i3.Category category) =>
      caller.callServerEndpoint<void>(
        'category',
        'updateCategory',
        {'category': category},
      );

  /// Elimina (soft delete) una categoría por su ID.
  _i2.Future<void> deleteCategory(int id) => caller.callServerEndpoint<void>(
        'category',
        'deleteCategory',
        {'id': id},
      );
}

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i4.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i4.Greeting>(
        'greeting',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointInvoices extends _i1.EndpointRef {
  EndpointInvoices(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'invoices';

  _i2.Future<List<_i5.Invoices>> getOpenProjectInvoices(
          String rucBeneficiario) =>
      caller.callServerEndpoint<List<_i5.Invoices>>(
        'invoices',
        'getOpenProjectInvoices',
        {'rucBeneficiario': rucBeneficiario},
      );

  _i2.Future<String> saveInvoices(List<_i5.Invoices> invoices) =>
      caller.callServerEndpoint<String>(
        'invoices',
        'saveInvoices',
        {'invoices': invoices},
      );

  _i2.Future<List<_i5.Invoices>> getProjectInvoices(int projectId) =>
      caller.callServerEndpoint<List<_i5.Invoices>>(
        'invoices',
        'getProjectInvoices',
        {'projectId': projectId},
      );

  _i2.Future<String> createProjectWithInvoices(
    _i6.Projects project,
    List<_i5.Invoices> invoices,
  ) =>
      caller.callServerEndpoint<String>(
        'invoices',
        'createProjectWithInvoices',
        {
          'project': project,
          'invoices': invoices,
        },
      );

  _i2.Future<_i5.Invoices?> updateInvoiceCategory(
    String claveAcceso,
    int? categoryId,
  ) =>
      caller.callServerEndpoint<_i5.Invoices?>(
        'invoices',
        'updateInvoiceCategory',
        {
          'claveAcceso': claveAcceso,
          'categoryId': categoryId,
        },
      );
}

/// {@category Endpoint}
class EndpointProjects extends _i1.EndpointRef {
  EndpointProjects(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'projects';

  _i2.Future<int> createProject(_i6.Projects project) =>
      caller.callServerEndpoint<int>(
        'projects',
        'createProject',
        {'project': project},
      );

  _i2.Future<List<_i6.Projects>> getOpenProjects() =>
      caller.callServerEndpoint<List<_i6.Projects>>(
        'projects',
        'getOpenProjects',
        {},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    category = EndpointCategory(this);
    greeting = EndpointGreeting(this);
    invoices = EndpointInvoices(this);
    projects = EndpointProjects(this);
  }

  late final EndpointCategory category;

  late final EndpointGreeting greeting;

  late final EndpointInvoices invoices;

  late final EndpointProjects projects;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'category': category,
        'greeting': greeting,
        'invoices': invoices,
        'projects': projects,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
