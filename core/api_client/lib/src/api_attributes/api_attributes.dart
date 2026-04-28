import 'package:api_client/src/api_attributes/api_attributes_keys.dart';
import 'package:retrofit/retrofit.dart';

class _ApiAttributes extends Extra {
  const _ApiAttributes(Map<String, Object> data) : super(data);
}

const authenticatedApiRequest = _ApiAttributes(<String, Object>{
  ApiAttributesKeys.appendApiKey: true,
});
