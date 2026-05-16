import 'package:checks/checks.dart';
import 'package:prelude/prelude.dart';
import 'package:test/test.dart';

void main() {
  group('FailureException', () {
    test('wraps non-Exception in Exception', () {
      final f = FailureException('raw string');

      check(f.inner).isA<Exception>();
    });

    test('keeps existing Exception as inner', () {
      const original = FormatException('bad');

      final f = FailureException(original);

      check(f.inner).identicalTo(original);
    });

    test('captures current stack trace when none provided', () {
      final f = FailureException(Exception('x'));

      check(f.stackTrace).isNotNull();
    });

    test('stores provided stack trace', () {
      final trace = StackTrace.current;

      final f = FailureException(Exception('x'), trace);

      check(f.stackTrace).identicalTo(trace);
    });

    test('empty() produces empty stack trace', () {
      final f = FailureException.empty();

      check(f.stackTrace).equals(StackTrace.empty);
    });
  });

  group('success / failure constructors', () {
    test('success creates Success', () {
      final r = success<int, String>(1);

      check(r).isA<Success<int, String>>();
    });

    test('failure creates Failure', () {
      final r = failure<int, String>('err');

      check(r).isA<Failure<int, String>>();
    });
  });

  group('fold', () {
    test('calls ifSuccess for Success', () {
      final r = success<int, String>(42);

      final out = r.fold((s) => 'ok:$s', (f) => 'fail:$f');

      check(out).equals('ok:42');
    });

    test('calls ifFailure for Failure', () {
      final r = failure<int, String>('err');

      final out = r.fold((s) => 'ok:$s', (f) => 'fail:$f');

      check(out).equals('fail:err');
    });
  });

  group('isSuccess / isFailure', () {
    test('Success.isSuccess is true', () {
      check(success<int, String>(1).isSuccess()).isTrue();
    });

    test('Success.isFailure is false', () {
      check(success<int, String>(1).isFailure()).isFalse();
    });

    test('Failure.isFailure is true', () {
      check(failure<int, String>('e').isFailure()).isTrue();
    });

    test('Failure.isSuccess is false', () {
      check(failure<int, String>('e').isSuccess()).isFalse();
    });
  });

  group('swap', () {
    test('Success swaps to Failure carrying the original value', () {
      final r = success<int, String>(1).swap();

      check(r).isA<Failure<String, int>>();
      check((r as Failure).value).equals(1);
    });

    test('Failure swaps to Success carrying the original value', () {
      final r = failure<int, String>('e').swap();

      check(r).isA<Success<String, int>>();
      check((r as Success).value).equals('e');
    });
  });

  group('map', () {
    test('transforms Success value', () {
      final r = success<int, String>(2);

      final mapped = r.map((n) => n * 3);

      check(mapped).isA<Success<int, String>>();
      check((mapped as Success).value).equals(6);
    });

    test('passes Failure through unchanged', () {
      final r = failure<int, String>('err');

      final mapped = r.map((n) => n * 3);

      check(mapped).isA<Failure<int, String>>();
      check((mapped as Failure).value).equals('err');
    });
  });

  group('mapFailure', () {
    test('transforms Failure value', () {
      final r = failure<int, String>('err');

      final mapped = r.mapFailure((f) => f.length);

      check(mapped).isA<Failure<int, int>>();
      check((mapped as Failure).value).equals(3);
    });

    test('passes Success through unchanged', () {
      final r = success<int, String>(5);

      final mapped = r.mapFailure((f) => f.length);

      check(mapped).isA<Success<int, int>>();
      check((mapped as Success).value).equals(5);
    });
  });

  group('forEach', () {
    test('calls callback for Success', () {
      var called = false;
      final r = success<int, String>(7);

      r.forEach((_) => called = true);

      check(called).isTrue();
    });

    test('no-op for Failure', () {
      var called = false;
      final r = failure<int, String>('e');

      r.forEach((_) => called = true);

      check(called).isFalse();
    });
  });

  group('getOrElse', () {
    test('returns value for Success', () {
      final r = success<int, String>(9);

      check(r.getOrElse(() => -1)).equals(9);
    });

    test('returns fallback for Failure', () {
      final r = failure<int, String>('e');

      check(r.getOrElse(() => -1)).equals(-1);
    });
  });

  group('getOrNull', () {
    test('returns value for Success', () {
      final r = success<int, String>(3);

      check(r.getOrNull()).isNotNull().equals(3);
    });

    test('returns null for Failure', () {
      final r = failure<int, String>('e');

      check(r.getOrNull()).isNull();
    });
  });

  group('Result.fromAction', () {
    test('wraps returned value in Success', () {
      final r = Result.fromAction(() => 42);

      check(r).isA<Success<int, FailureException>>();
      check((r as Success).value).equals(42);
    });

    test('wraps thrown exception in Failure', () {
      final r = Result.fromAction<int>(() => throw Exception('boom'));

      check(r).isA<Failure<int, FailureException>>();
    });

    test('passes FailureException through without double-wrapping', () {
      final original = FailureException.empty();

      final r = Result.fromAction<int>(() => throw original);

      check((r as Failure).value).identicalTo(original);
    });
  });

  group('Result.fromAsync', () {
    test('wraps returned value in Success', () async {
      final r = await Result.fromAsync(() async => 42);

      check(r).isA<Success<int, FailureException>>();
      check((r as Success).value).equals(42);
    });

    test('wraps thrown exception in Failure', () async {
      final r = await Result.fromAsync<int>(() async => throw Exception('boom'));

      check(r).isA<Failure<int, FailureException>>();
    });

    test('passes FailureException through without double-wrapping', () async {
      final original = FailureException.empty();

      final r = await Result.fromAsync<int>(() async => throw original);

      check((r as Failure).value).identicalTo(original);
    });
  });

  group('Result.doSync', () {
    test('returns Success when all gets succeed', () {
      final r = Result.doSync((get) {
        final a = get(success<int, FailureException>(2));
        final b = get(success<int, FailureException>(3));
        return a + b;
      });

      check(r).isA<Success<int, FailureException>>();
      check((r as Success).value).equals(5);
    });

    test('short-circuits on first Failure', () {
      var secondCalled = false;

      final r = Result.doSync((get) {
        get(failure<int, FailureException>(FailureException.empty()));
        secondCalled = true;
        return 0;
      });

      check(r).isA<Failure<int, FailureException>>();
      check(secondCalled).isFalse();
    });
  });

  group('Result.doAsync', () {
    test('returns Success when all gets succeed', () async {
      final r = await Result.doAsync((get) async {
        final a = await get(Future.value(success<int, FailureException>(4)));
        final b = await get(Future.value(success<int, FailureException>(5)));
        return a + b;
      });

      check(r).isA<Success<int, FailureException>>();
      check((r as Success).value).equals(9);
    });

    test('short-circuits on first Failure', () async {
      var secondCalled = false;

      final r = await Result.doAsync((get) async {
        await get(
          Future.value(
            failure<int, FailureException>(FailureException.empty()),
          ),
        );
        secondCalled = true;
        return 0;
      });

      check(r).isA<Failure<int, FailureException>>();
      check(secondCalled).isFalse();
    });
  });

  group('Result.fromPeriodic', () {
    test('stops after first yield when stopWhen returns true immediately', () async {
      final results = await Result.fromPeriodic<int>(
        () async => 1,
        interval: (_) => Duration.zero,
        stopWhen: (_, _) => true,
      ).toList();

      check(results).length.equals(1);
      check(results.first).isA<Success<int, FailureException>>();
      check((results.first as Success).value).equals(1);
    });

    test('yields multiple results before stopping', () async {
      var count = 0;

      final results = await Result.fromPeriodic<int>(
        () async => ++count,
        interval: (_) => Duration.zero,
        stopWhen: (_, i) => i == 2,
      ).toList();

      check(results).length.equals(3);
      check(results.map((r) => (r as Success).value).toList())
          .deepEquals([1, 2, 3]);
    });

    test('includes Failure results in the stream', () async {
      final results = await Result.fromPeriodic<int>(
        () async => throw Exception('boom'),
        interval: (_) => Duration.zero,
        stopWhen: (_, i) => i == 1,
      ).toList();

      check(results).length.equals(2);
      check(results.every((r) => r.isFailure())).isTrue();
    });

    test('passes iteration index to stopWhen and interval', () async {
      final stopWhenIterations = <int>[];
      final intervalIterations = <int>[];

      await Result.fromPeriodic<int>(
        () async => 0,
        interval: (i) {
          intervalIterations.add(i);
          return Duration.zero;
        },
        stopWhen: (_, i) {
          stopWhenIterations.add(i);
          return i == 2;
        },
      ).toList();

      check(stopWhenIterations).deepEquals([0, 1, 2]);
      check(intervalIterations).deepEquals([0, 1]);
    });
  });

  group('Result.doPeriodic', () {
    test('yields Success results for successful gets', () async {
      var count = 0;

      final results = await Result.doPeriodic<int>(
        (get) async => await get(Future.value(success<int, FailureException>(++count))),
        interval: (_) => Duration.zero,
        stopWhen: (_, i) => i == 1,
      ).toList();

      check(results).length.equals(2);
      check((results.first as Success).value).equals(1);
      check((results.last as Success).value).equals(2);
    });

    test('short-circuits inner get on Failure and yields Failure', () async {
      var afterGetCalled = false;

      final results = await Result.doPeriodic<int>(
        (get) async {
          await get(
            Future.value(failure<int, FailureException>(FailureException.empty())),
          );
          afterGetCalled = true;
          return 0;
        },
        interval: (_) => Duration.zero,
        stopWhen: (_, _) => true,
      ).toList();

      check(results.single).isA<Failure<int, FailureException>>();
      check(afterGetCalled).isFalse();
    });
  });

  group('equality', () {
    test('Success equals Success with same value', () {
      final a = success<int, String>(1);
      final b = success<int, String>(1);

      check(a).equals(b);
    });

    test('Success not equal to Success with different value', () {
      final a = success<int, String>(1);
      final b = success<int, String>(2);

      check(a).not((s) => s.equals(b));
    });

    test('Failure equals Failure with same value', () {
      final a = failure<int, String>('e');
      final b = failure<int, String>('e');

      check(a).equals(b);
    });

    test('Success not equal to Failure with same wrapped value', () {
      final a = success<int, int>(1);
      final b = failure<int, int>(1);

      check(a).not((s) => s.equals(b));
    });
  });

  group('hashCode', () {
    test('equal Successes have same hashCode', () {
      final a = success<int, String>(1);
      final b = success<int, String>(1);

      check(a.hashCode).equals(b.hashCode);
    });

    test('equal Failures have same hashCode', () {
      final a = failure<int, String>('e');
      final b = failure<int, String>('e');

      check(a.hashCode).equals(b.hashCode);
    });
  });
}
