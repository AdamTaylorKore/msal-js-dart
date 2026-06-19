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
