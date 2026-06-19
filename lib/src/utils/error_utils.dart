part of '../../msal_js.dart';

/// Calls the given [function] and automatically converts MSAL errors to exceptions
/// that are thrown from it.
T _callJsMethod<T>(T Function() function) {
  try {
    return function();
  } on interop.JsError catch (ex) {
    throw convertJsError(ex);
  }
}

/// Converts and awaits the given MSAL JS [promise].
///
/// Automatically converts MSAL errors to exceptions that are thrown from it.
Future<T> _convertMsalPromise<T>(JSAny? promise) async {
  try {
    return await (promise as JSPromise<JSAny?>).toDart as T;
  } on interop.JsError catch (ex) {
    throw convertJsError(ex);
  }
}
