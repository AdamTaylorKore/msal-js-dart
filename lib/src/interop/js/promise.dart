import 'dart:js_interop';

typedef PromiseExecutorFunc = void Function(JSAny? value);
typedef PromiseExecutor = void Function(
    JSFunction resolve, JSFunction reject);

@JS('Promise')
extension type Promise._(JSObject _) implements JSObject {
  external Promise(JSFunction executor);
}
