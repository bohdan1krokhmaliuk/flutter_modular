import 'package:prelude/prelude.dart';

extension FailureExceptionX on FailureException {
  bool get isIncorrect => this.inner.toString().contains('incorrect');
}
