part of '../../msal_js.dart';

typedef _FutureToPromiseValueHelper<T> = dynamic Function(T value);

/// Converts the given Dart [future] to a JavaScript promise.
interop.Promise _futureToPromise<T>(Future<T> future,
    {_FutureToPromiseValueHelper<T>? resolveHelper,
    _FutureToPromiseValueHelper<dynamic>? rejectHelper}) {
  return interop.Promise(((JSFunction resolve, JSFunction reject) {
    future.then(
        (value) => resolve.callAsFunction(
            null,
            resolveHelper == null
                ? jsEncode(value as dynamic)
                : resolveHelper(value)),
        onError: (error) => reject.callAsFunction(
            null,
            rejectHelper == null ? jsEncode(error) : rejectHelper(error)));
  }).toJS);
}
