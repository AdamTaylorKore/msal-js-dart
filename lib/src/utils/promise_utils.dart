part of '../../msal_js.dart';

typedef _FutureToPromiseValueHelper<T> = dynamic Function(T value);

/// Converts the given Dart [future] to a JavaScript promise.
interop.Promise _futureToPromise<T>(Future<T> future,
    {_FutureToPromiseValueHelper<T>? resolveHelper,
    _FutureToPromiseValueHelper<dynamic>? rejectHelper}) {
  return interop.Promise(((JSAny? resolve, JSAny? reject) {
    final resolveFn = resolve as JSFunction;
    final rejectFn = reject as JSFunction;
    future.then(
        (value) => resolveFn.callAsFunction(
            null,
            resolveHelper == null
                ? jsEncode(value as dynamic)
                : resolveHelper(value)),
        onError: (error) => rejectFn.callAsFunction(
            null,
            rejectHelper == null ? jsEncode(error) : rejectHelper(error)));
  }).toJS);
}
