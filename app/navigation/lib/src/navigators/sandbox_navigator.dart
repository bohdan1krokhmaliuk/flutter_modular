import 'package:injectable/injectable.dart';
import 'package:navigation/navigation.dart';
import 'package:sandbox/sandbox.dart';

@Injectable(as: SandboxNavigator)
class SandboxNavigatorImplementation implements SandboxNavigator {
  const SandboxNavigatorImplementation(this._router);

  final MiniclientRouter _router;

  @override
  Future<void> openRickAndMorty() => _router.push(CharactersRoute());

  @override
  Future<bool?> openQuestionnaire() =>
      _router.push<bool?>(QuestionnaireRoute());
}
