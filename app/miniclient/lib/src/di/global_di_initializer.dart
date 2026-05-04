import 'package:api_client/api_client.dart';
import 'package:api_client_interceptors/api_client_interceptors.dart';
import 'package:configuration/configuration.dart';
import 'package:di/di.dart';
import 'package:miniclient/src/di/di_initializer.dart';
import 'package:monitoring/monitoring.dart';
import 'package:navigation/navigation.dart';
import 'package:preferences/preferences.dart';
import 'package:presenter/presenter.dart';
import 'package:state_management/state_management.dart';

final initializer = DIInitializer.combined([
  ..._utilityInitializers,
  ..._coreInitializers,
  ..._appInitializers,
]);

List<DIInitializer> _appInitializers = [
  ConfigurationDIInitializer(),
  NavigationDIInitializer(),
  MiniclientDIInitializer(),
];
List<DIInitializer> _utilityInitializers = [
  MonitoringDIInitializer(),
  PreferencesDIInitializer(),
  StateManagementDIInitializer(),
];
List<DIInitializer> _coreInitializers = [
  ApiClientDIInitializer(),
  InterceptorsDIInitializer(),
  PresenterDIInitializer(),
];
