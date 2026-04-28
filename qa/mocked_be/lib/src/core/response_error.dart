abstract interface class ResponseError {
  Exception getException();
}

class ResponseErrorWithBody implements ResponseError {
  const ResponseErrorWithBody(
    this.statusCode,
    this.errorBody, {
    this.headers = const {},
  });

  final int statusCode;
  final String errorBody;
  final Map<String, String> headers;

  @override
  Exception getException() => Exception(errorBody);
}

class ResponseErrorWithException implements ResponseError {
  const ResponseErrorWithException(this._exception);

  final Exception _exception;

  @override
  Exception getException() => _exception;
}
