import 'package:mocked_be/src/core/request_handler.dart';

abstract interface class ScenarioEntry {
  const ScenarioEntry();
}

class Scenario extends ScenarioEntry {
  const Scenario(this.name, this.handlers);

  final String name;
  final List<RequestHandler> handlers;
}

class ScenarioGroup extends ScenarioEntry {
  const ScenarioGroup(this.name, this.entries);

  final String name;
  final List<ScenarioEntry> entries;
}
