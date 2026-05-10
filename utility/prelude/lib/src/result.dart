import 'dart:async';

import 'package:meta/meta.dart';
import 'package:prelude/src/exception.dart';

typedef SyncGetter<T> = T Function();
typedef AsyncGetter<T> = Future<T> Function();
typedef GetterCallback<T> =
    T Function(T1 Function<T1>(Result<T1, FailureException>));
typedef AsyncGetterCallback<T> =
    Future<T> Function(
      FutureOr<T1> Function<T1>(FutureOr<Result<T1, FailureException>>),
    );

@immutable
sealed class Result<S, F> {
  const Result._();

  B fold<B>(B Function(S s) ifSuccess, B Function(F f) ifFailure);

  bool isSuccess() => fold((_) => true, (_) => false);
  bool isFailure() => fold((_) => false, (_) => true);

  Result<F, S> swap() => fold(failure, success);

  Result<S2, F> map<S2>(S2 Function(S s) f) =>
      fold((S s) => success(f(s)), failure);

  Result<S, F2> mapFailure<F2>(F2 Function(F s) f) =>
      fold(success, (F e) => failure(f(e)));

  void forEach(void Function(S) s) => fold(s, (_) {});

  S getOrElse(S Function() f) => fold((s) => s, (_) => f());
  S? getOrNull() => fold((s) => s, (_) => null);

  static Result<T, FailureException> fromAction<T>(SyncGetter<T> f) {
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
    AsyncGetter<T> f,
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
    AsyncGetter<T> f, {
    required Duration Function(int iteration) interval,
    required bool Function(Result<T, FailureException> result, int iteration)
    stopWhen,
  }) async* {
    var i = 0;
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

  static Result<T, FailureException> doSync<T>(GetterCallback<T> f) =>
      Result.fromAction(() => f(_get));

  static Future<Result<T, FailureException>> doAsync<T>(
    AsyncGetterCallback<T> f,
  ) => Result.fromAsync(() => f(_getAsync));

  static Stream<Result<T, FailureException>> doPeriodic<T>(
    AsyncGetterCallback<T> f, {
    required Duration Function(int iteration) interval,
    required bool Function(Result<T, FailureException> result, int iteration)
    stopWhen,
  }) => fromPeriodic<T>(
    () => f(_getAsync),
    interval: interval,
    stopWhen: stopWhen,
  );

  static T _get<T>(Result<T, FailureException> result) =>
      result.fold((s) => s, (f) => throw f);

  static FutureOr<T> _getAsync<T>(
    FutureOr<Result<T, FailureException>> result,
  ) async => _get(await result);
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
