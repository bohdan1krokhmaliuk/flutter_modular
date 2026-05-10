import 'package:api_client/src/api_attributes/api_attributes_keys.dart';
import 'package:retrofit/retrofit.dart';

class _ApiAttributes extends Extra {
  const _ApiAttributes(Map<String, Object> data) : super(data);
}

/// Looks for predefined scenario by [scenarioName], if found - overrides api call
class MockedWithScenario extends TypedExtras {
  const MockedWithScenario(this.scenarioName);

  final String scenarioName;
}

/// Appends authentication to api request
const authenticatedApiRequest = _ApiAttributes(<String, Object>{
  ApiAttributesKeys.appendApiKey: true,
});
