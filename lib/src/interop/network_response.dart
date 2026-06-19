part of 'interop.dart';

@JS()
extension type NetworkResponse._(JSObject _) implements JSObject {
  external NetworkResponse();
  external JSAny? get headers;
  external set headers(JSAny? headers);

  external JSAny? get body;
  external set body(JSAny? body);

  external num get status;
  external set status(num status);
}
