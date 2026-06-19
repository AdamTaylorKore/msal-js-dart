part of 'js_proxies.dart';

/// Provides a Dart `List` interface for a proxied JavaScript Array.
///
/// Will automatically convert `List`s and `Map`s to JS Arrays and JS Objects
/// respectively and vice versa without copying the underlying JS value (e.g.
/// modifying the "proxied" JS Array/Object will be reflected in JS and vice versa).
class JsArrayListProxy<E> with ListMixin<E> {
  final JSArray _jsArray;

  JsArrayListProxy(this._jsArray);

  @override
  int get length =>
      (_jsArray.getProperty<JSNumber>('length'.toJS)).toDartDouble.toInt();

  @override
  set length(int length) =>
      _jsArray.setProperty('length'.toJS, length.toJS);

  @override
  E operator [](int index) =>
      jsDecode(_jsArray.getProperty<JSAny?>(index.toJS)) as E;

  @override
  void operator []=(int index, E value) =>
      _jsArray.setProperty(index.toJS, jsEncode(value) as JSAny?);
}
