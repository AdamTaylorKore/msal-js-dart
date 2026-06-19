part of '../msal_js.dart';

/// Client network interface to send backend requests.
abstract class INetworkModule {
  /// Interface function for async network "GET" requests.
  ///
  /// Based on the Fetch standard: https://fetch.spec.whatwg.org/
  Future<NetworkResponse> sendGetRequestAsync(String url,
      [NetworkRequestOptions? options, num? cancellationToken]);

  /// Interface function for async network "POST" requests.
  ///
  /// Based on the Fetch standard: https://fetch.spec.whatwg.org/
  Future<NetworkResponse> sendPostRequestAsync(String url,
      [NetworkRequestOptions? options]);
}

/// Jsify's the network [module] so MSAL can call its methods.
JSAny _allowNetworkModuleInterop(INetworkModule module) {
  return <String, Object>{
    'sendGetRequestAsync': ((JSAny? url,
            [JSAny? options,
            JSAny? cancellationToken]) {
      return _futureToPromise(
          module.sendGetRequestAsync(
              (url as JSString).toDart,
              options == null
                  ? null
                  : NetworkRequestOptions._fromJsOjbect(
                      options as interop.NetworkRequestOptions),
              (cancellationToken as JSNumber?)?.toDartDouble),
          resolveHelper: (NetworkResponse value) => value._jsObject);
    }).toJS,
    'sendPostRequestAsync': ((JSAny? url,
            [JSAny? options]) {
      return _futureToPromise(
          module.sendPostRequestAsync(
              (url as JSString).toDart,
              options == null
                  ? null
                  : NetworkRequestOptions._fromJsOjbect(
                      options as interop.NetworkRequestOptions)),
          resolveHelper: (NetworkResponse value) => value._jsObject);
    }).toJS,
  }.jsify()!;
}
