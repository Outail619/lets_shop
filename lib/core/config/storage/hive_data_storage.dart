// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

class HiveDataStorage {
  Future<List<Box>> openBoxes() => Future.wait(
        [
          Hive.openBox(_credentialBox),
          openPrefsBox(),
        ],
      );

  Future<Box> openPrefsBox() => Hive.openBox(_preferencesBox);

  /// Add new Data
  Future<void> addData({required String name, dynamic object}) async {
    (await Hive.openBox(name)).add(object);
  }

  /// Show Data
  Future<dynamic> getData({required String name, required String key}) async {
    return ((await Hive.openBox(name)).get(key) ?? -1);
  }

  /// Update Data
  Future<void> updateData({
    required String name,
    required String key,
    required dynamic value,
  }) async {
    (await Hive.openBox(name)).put(key, value);
  }

  /// Delete Data
  Future<void> deleteData() async {
    await Hive.box(_credentialBox).clear();
    await Hive.box(_preferencesBox).delete(_applicationKey);
  }

  Future<Stream<BoxEvent>> listenToData({required String boxName}) async {
    return (await Hive.openBox(boxName)).watch();
  }

  Future storeTokens({required UserTokens tokens}) {
    return Hive.box(_credentialBox).put(_tokensKey, tokens.toJson());
  }

  UserTokens? getTokens() {
    final tokensData = Hive.box(_credentialBox).get(_tokensKey);
    if (tokensData is Map) {
      return UserTokens.fromMap(
        Map<String, dynamic>.from(tokensData),
      );
    }
    return null;
  }

  bool isUserConnected() => Hive.box(_credentialBox).get(userPrefsKey) is Map;

  Future<void> saveLanguage(String languageCode) =>
      Hive.box(_preferencesBox).put(
        _languageKey,
        languageCode,
      );

  String? getLanguage() => Hive.box(_preferencesBox).get(_languageKey);

  Future<void> addPreferences({
    required Map<String, dynamic> preferences,
  }) async {
    await Hive.box(_preferencesBox).put(
      _applicationKey,
      preferences,
    );
  }

  static const _tokensKey = "TOKENS";
  static const _applicationKey = "application";
  static const _languageKey = "language";
  static const userPrefsKey = "user_prefs";
  static const _preferencesBox = "PREFERENCES";
  static const _credentialBox = "CREDENTIALS";
}

class UserTokens {
  final String accessToken;
  final String refreshToken;

  UserTokens({
    required this.accessToken,
    required this.refreshToken,
  });

  UserTokens copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return UserTokens(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }

  factory UserTokens.fromMap(Map<String, dynamic> map) {
    return UserTokens(
      accessToken: map['accessToken'] as String,
      refreshToken: map['refreshToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTokens.fromJson(String source) =>
      UserTokens.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UserTokens(accessToken: $accessToken, refreshToken: $refreshToken)';

  @override
  bool operator ==(covariant UserTokens other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.refreshToken == refreshToken;
  }

  @override
  int get hashCode => accessToken.hashCode ^ refreshToken.hashCode;
}
