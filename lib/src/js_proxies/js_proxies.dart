import 'dart:collection';
import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'interop/object.dart' as interop;
import 'interop/reflect.dart' as interop;

part 'js_array_list_proxy.dart';
part 'js_object_map_proxy.dart';

/// Decodes the given [value] as a typed Dart [List], proxying it through a [JsArrayListProxy].
List<E>? jsDecodeList<E>(JSArray? value) {
  if (value == null) {
    return null;
  } else {
    return JsArrayListProxy<E>(value);
  }
}

/// Decodes the given [value] into a typed Dart [Map].
///
/// [value] should be a plain Dart [Map] produced by `JSAny.dartify()`.
Map<String, V>? jsDecodeMap<V>(dynamic value) {
  if (value == null) {
    return null;
  } else {
    if (value is Map) {
      return value.cast<String, V>();
    }
    return JsObjectMapProxy<V>(value as JSObject);
  }
}

/// Encodes a Dart [List] into a [JSArray].
JSArray? jsEncodeList(List? value) {
  if (value == null) return null;
  if (value is JsArrayListProxy) return value._jsArray;
  return value.jsify() as JSArray;
}

/// Encodes a Dart [Map] into a [JSAny] (plain JS object).
JSAny? jsEncodeMap(Map? value) {
  if (value == null) return null;
  if (value is JsObjectMapProxy) return value._jsObject as JSAny;
  return value.jsify();
}

/// Encodes the given [value] into a JS friendly value.
///
/// Accepts standard Dart primitives, [JsArrayListProxy], [JsObjectMapProxy],
/// [Map], and [Iterable] values. Other values will be returned unchanged.
dynamic jsEncode(dynamic value) {
  if (value != null) {
    if (value is JsArrayListProxy) {
      value = value._jsArray;
    } else if (value is JsObjectMapProxy) {
      value = value._jsObject;
    } else if (value is Map || value is Iterable) {
      value = value.jsify();
    }
  }

  return value;
}

/// Decodes the given [value] into a native Dart type.
///
/// Accepts JS objects and arrays. Other values will be returned unchanged.
dynamic jsDecode(dynamic value) {
  if (value != null) {
    if (value is JSArray) {
      value = JsArrayListProxy(value);
    } else if (value is JSObject) {
      value = JsObjectMapProxy(value);
    }
  }

  return value;
}
