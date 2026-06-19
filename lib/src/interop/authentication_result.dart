part of 'interop.dart';

@JS()
extension type AuthenticationResult._(JSObject _) implements JSObject {
  external String get authority;
  external String get uniqueId;
  external String get tenantId;
  external JSArray get scopes;
  external AccountInfo? get account;
  external String get idToken;
  external JSAny? get idTokenClaims;
  external String get accessToken;
  external bool get fromCache;
  external JSAny? get expiresOn;
  external String get tokenType;
  external JSAny? get extExpiresOn;
  external String? get state;
  external String? get familyId;
  external String? get cloudGraphHostName;
  external String? get msGraphHost;
}
