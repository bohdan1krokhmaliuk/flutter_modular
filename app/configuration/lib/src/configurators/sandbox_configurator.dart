import 'package:injectable/injectable.dart';
import 'package:sandbox/sandbox.dart';

@Injectable(as: SandboxConfigurator)
class SandboxConfiguratorImplementation implements SandboxConfigurator {
  const SandboxConfiguratorImplementation();
  // [HINT] this is feature configuration implementation - here you need to setup
  // feature functionality availability. You can do that based on various things
  // like user permissions, market, dynamic config or anything else.
  //
  // This package is basically single point which defines what user can see and
  // what not. Also it is quite useful for development purposes, since you can merge
  // part of your code without fear that user will see unfinished changes
  @override
  Future<bool> isRickAndMortyAvailable() async => true;

  @override
  Future<bool> isQuestionnaireAvailable() async => true;
}
