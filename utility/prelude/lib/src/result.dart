import 'dart:async';

import 'package:meta/meta.dart';
import 'package:prelude/src/exception.dart';

typedef _SyncGetter<T> = T Function();
typedef _AsyncGetter<T> = Future<T> Function();
typedef _GetterCallback<T> = T Function(T1 Function<T1>(Result<T1, Object>));
typedef _AsyncGetterCallback<T> =
    Future<T> Function(FutureOr<T1> Function<T1>(FutureOr<Result<T1, Object>>));

@immutable
sealed class Result<S, F> {
  const Result._();

  B fold<B>(B Function(S s) ifSuccess, B Function(F f) ifFailure);

  bool isSuccess() => fold((_) => true, (_) => false);
  bool isFailure() => fold((_) => false, (_) => true);

  Result<F, S> swap() => fold(failure, success);

  Result<S2, F> map<S2>(S2 Function(S s) f) =>
      fold((S s) => success(f(s)), failure);

  void forEach(void Function(S) s) => fold(s, (_) {});

  S getOrElse(S Function() f) => fold((s) => s, (_) => f());
  S? getOrNull() => fold((s) => s, (_) => null);

  static Result<T, FailureException> fromAction<T>(_SyncGetter<T> f) {
    try {
      return success(f());
    } catch (e, stackTrace) {
      if (e is FailureException) {
        return failure(e);
      }
      return failure(FailureException(e, stackTrace));
    }
  }

  static Future<Result<T, FailureException>> fromAsync<T>(
    _AsyncGetter<T> f,
  ) async {
    try {
      return success(await f());
    } catch (e, stackTrace) {
      if (e is FailureException) {
        return failure(e);
      }
      return failure(FailureException(e, stackTrace));
    }
  }

  static Stream<Result<T, FailureException>> fromPeriodic<T>(
    _AsyncGetter<T> f, {
    required Duration Function(int iteration) interval,
    required bool Function(Result<T, FailureException> result, int iteration)
    stopWhen,
  }) async* {
    int i = 0;
    while (true) {
      final result = await Result.fromAsync(f);
      yield result;
      if (stopWhen(result, i)) {
        break;
      }
      await Future.delayed(interval(i));
      i++;
    }
  }

  static Result<T, FailureException> doSync<T>(_GetterCallback<T> f) =>
      Result.fromAction(() => f(_get));

  static Future<Result<T, FailureException>> doAsync<T>(
    _AsyncGetterCallback<T> f,
  ) => Result.fromAsync(() => f(_getAsync));

  static Stream<Result<T, FailureException>> doPeriodic<T>(
    _AsyncGetterCallback<T> f, {
    required Duration Function(int iteration) interval,
    required bool Function(Result<T, FailureException> result, int iteration)
    stopWhen,
  }) => fromPeriodic<T>(
    () => f(_getAsync),
    interval: interval,
    stopWhen: stopWhen,
  );

  static T _get<T>(Result<T, Object> result) =>
      result.fold((s) => s, (f) => throw f);

  static FutureOr<T> _getAsync<T>(FutureOr<Result<T, Object>> result) async =>
      _get(await result);
}

class Failure<S, F> extends Result<S, F> {
  const Failure._(this._f) : super._();

  final F _f;

  F get value => _f;

  @override
  B fold<B>(B Function(S s) ifSuccess, B Function(F f) ifFailure) =>
      ifFailure(_f);

  @override
  bool operator ==(Object other) => other is Failure && other._f == _f;

  @override
  int get hashCode => _f.hashCode;
}

class Success<S, F> extends Result<S, F> {
  const Success._(this._s) : super._();

  final S _s;

  S get value => _s;

  @override
  B fold<B>(B Function(S s) ifSuccess, B Function(F f) ifFailure) =>
      ifSuccess(_s);

  @override
  bool operator ==(Object other) => other is Success && other._s == _s;

  @override
  int get hashCode => _s.hashCode;
}

Result<S, F> failure<S, F>(F f) => Failure._(f);
Result<S, F> success<S, F>(S s) => Success._(s);
