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
import 'package:zifra_backend_client/src/protocol/greeting.dart' as _i3;
import 'package:zifra_backend_client/src/protocol/invoices.dart' as _i4;
import 'package:zifra_backend_client/src/protocol/projects.dart' as _i5;
import 'protocol.dart' as _i6;

/// This is an example endpoint that returns a greeting message through
/// its [hello] method.
/// {@category Endpoint}
class EndpointGreeting extends _i1.EndpointRef {
  EndpointGreeting(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'greeting';

  /// Returns a personalized greeting message: "Hello {name}".
  _i2.Future<_i3.Greeting> hello(String name) =>
      caller.callServerEndpoint<_i3.Greeting>(
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

  _i2.Future<List<_i4.Invoices>> getOpenProjectInvoices(
          String rucBeneficiario) =>
      caller.callServerEndpoint<List<_i4.Invoices>>(
        'invoices',
        'getOpenProjectInvoices',
        {'rucBeneficiario': rucBeneficiario},
      );

  _i2.Future<String> saveInvoices(List<_i4.Invoices> invoices) =>
      caller.callServerEndpoint<String>(
        'invoices',
        'saveInvoices',
        {'invoices': invoices},
      );

  _i2.Future<List<_i4.Invoices>> getProjectInvoices(int projectId) =>
      caller.callServerEndpoint<List<_i4.Invoices>>(
        'invoices',
        'getProjectInvoices',
        {'projectId': projectId},
      );

  _i2.Future<String> createProjectWithInvoices(
    _i5.Projects project,
    List<_i4.Invoices> invoices,
  ) =>
      caller.callServerEndpoint<String>(
        'invoices',
        'createProjectWithInvoices',
        {
          'project': project,
          'invoices': invoices,
        },
      );
}

/// {@category Endpoint}
class EndpointProjects extends _i1.EndpointRef {
  EndpointProjects(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'projects';

  _i2.Future<int> createProject(_i5.Projects project) =>
      caller.callServerEndpoint<int>(
        'projects',
        'createProject',
        {'project': project},
      );

  _i2.Future<List<_i5.Projects>> getOpenProjects() =>
      caller.callServerEndpoint<List<_i5.Projects>>(
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
          _i6.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    greeting = EndpointGreeting(this);
    invoices = EndpointInvoices(this);
    projects = EndpointProjects(this);
  }

  late final EndpointGreeting greeting;

  late final EndpointInvoices invoices;

  late final EndpointProjects projects;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'greeting': greeting,
        'invoices': invoices,
        'projects': projects,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
