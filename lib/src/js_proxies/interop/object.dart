import 'dart:js_interop';

@JS('Object')
extension type Object._(JSObject _) implements JSObject {
  external static JSArray keys(JSObject object);
}
