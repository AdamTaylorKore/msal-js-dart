part of 'interop.dart';

@JS('PublicClientApplication')
extension type PublicClientApplication._(JSObject _) implements JSObject {
  external PublicClientApplication(Configuration configuration);

  external JSAny? acquireTokenPopup(PopupRequest request);
  external JSAny? acquireTokenRedirect(RedirectRequest request);
  external JSAny? acquireTokenSilent(SilentRequest request);
  external String? addEventCallback(JSFunction callback);
  external void removeEventCallback(String callbackId);
  external AccountInfo? getAccountByHomeId(String homeAccountId);
  external AccountInfo? getAccountByLocalId(String localId);
  external AccountInfo? getAccountByUsername(String userName);
  external JSArray getAllAccounts();
  external JSAny? handleRedirectPromise([String? hash]);
  external JSAny? loginPopup([PopupRequest? request]);
  external JSAny? loginRedirect([RedirectRequest? request]);
  external JSAny? logoutRedirect([EndSessionRequest? logoutRequest]);
  external JSAny? logoutPopup([EndSessionPopupRequest? logoutRequest]);
  external JSAny? ssoSilent(SsoSilentRequest request);
  external Logger getLogger();
  external void setLogger(Logger logger);
  external void setActiveAccount(AccountInfo? account);
  external AccountInfo? getActiveAccount();
  external void setNavigationClient(JSAny? navigationClient);
}
