import 'dart:convert';
import 'package:rider/app/app.logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final log = getLogger('Local Storage Service');
  static SharedPreferences? _preferences;

  ///
  /// List of const keys
  ///
  static const String onboardingKey = 'isOnBoarded';
  static const String notificationsCountKey = 'notificationsCount';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String localKey = 'local';

  ///
  static const String paymentIntentIdKey = 'paymentIntentId';
  static const String transactionId = 'transactionId';
  //
  static const String paymentIntent = 'paymentIntent';
  static const String transaction = 'transaction';

  ///
  /// Setters and getters
  ///
  bool get onBoarding => _getFromDisk(onboardingKey) ?? false;
  set setOnBoarded(bool board) => _saveToDisk(onboardingKey, board);

  ///notification count
  int get setNotificationsCount => _getFromDisk(notificationsCountKey) ?? 0;
  set setNotificationsCount(int count) =>
      _saveToDisk(notificationsCountKey, count);

  ///access token
  dynamic get accessToken => _getFromDisk(accessTokenKey);
  set accessToken(token) => _saveToDisk(accessTokenKey, token);

  /// locale
  dynamic get getLocale => _getFromDisk(localKey);
  set setLocale(String locale) => _saveToDisk(localKey, locale);

  ///payment intent id
  dynamic get getPaymentIntentId => _getFromDisk(paymentIntentIdKey);
  set setPaymentIntentId(String? id) => _saveToDisk(paymentIntentIdKey, id);

  ///transaction  id
  dynamic get getTransactionId => _getFromDisk(transactionId);
  set setTransactionId(String? id) => _saveToDisk(transactionId, id);

  ///payment intent
  dynamic get getPaymentIntent => _getFromDisk(paymentIntent);
  set setPaymentIntent(dynamic payment) => _saveToDisk(paymentIntent, payment);

  ///transaction
  dynamic get getTransaction => _getFromDisk(transaction);
  set setTransaction(dynamic trans) => _saveToDisk(transaction, trans);

  ///refresh token
  dynamic get refreshToken => _getFromDisk(refreshTokenKey);

  ///
  ///initializing instance
  ///
  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  dynamic _getFromDisk(String key) {
    if (_preferences != null) {
      var value = _preferences?.get(key);
      log.d('@_getFromDisk. key: $key value: $value');
      return value;
    }
    return null;
  }

  void _saveToDisk<T>(String key, T? content) {
    log.d('@_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences?.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }
    if (content is Map<String, dynamic>) {
      _preferences?.setString(key, json.encode(content));
    }

    if (content == null) {
      _preferences?.remove(key);
    }
  }
}
