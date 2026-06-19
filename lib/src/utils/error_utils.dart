part of '../../msal_js.dart';

/// Calls the given [function] and automatically converts MSAL errors to exceptions
/// that are thrown from it.
T _callJsMethod<T>(T Function() function) {
  try {
    return function();
  } catch (ex) {
    if (ex is JSObject && ex.isA<interop.JsError>()) {
      throw convertJsError(ex as interop.JsError);
    }
    rethrow;
  }
}

/// Converts and awaits the given MSAL JS [promise].
///
/// Automatically converts MSAL errors to exceptions that are thrown from it.
Future<T> _convertMsalPromise<T>(JSAny? promise) async {
  // Yield to the JS event loop before awaiting the Promise.
  // Under dart2wasm, the WASM runtime can starve JS timers (e.g. MSAL's
  // popup monitor setInterval) if we don't explicitly give JS a chance to run.
  await Future<void>.delayed(Duration.zero);
  try {
    final result = await (promise as JSPromise<JSAny?>).toDart;
    return result as T;
  } catch (ex) {
    if (ex is JSObject && ex.isA<interop.JsError>()) {
      throw convertJsError(ex as interop.JsError);
    }
    rethrow;
  }
}
