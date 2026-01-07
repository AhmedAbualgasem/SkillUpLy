import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class PasswordHasher {
  static const int _saltLength = 32;
  static const int _iterations = 120000;

  static String hash(String password) {
    final salt = _generateSalt();
    final hash = _deriveKey(password, salt, _iterations);
    return '${base64UrlEncode(salt)}:${base64UrlEncode(hash)}';
  }

  static bool verify(String password, String storedValue) {
    final parts = storedValue.split(':');
    if (parts.length != 2) return false;
    final salt = base64Url.decode(parts[0]);
    final expectedHash = base64Url.decode(parts[1]);
    final calculated = _deriveKey(password, salt, _iterations);
    return _constantTimeEquals(calculated, expectedHash);
  }

  static List<int> _deriveKey(String password, List<int> salt, int iterations) {
    var hmac = Hmac(sha256, salt);
    var result = hmac.convert(utf8.encode(password)).bytes;
    for (var i = 0; i < iterations; i++) {
      hmac = Hmac(sha256, result);
      result = hmac.convert(utf8.encode(password)).bytes;
    }
    return result;
  }

  static List<int> _generateSalt() {
    final rng = Random.secure();
    return List<int>.generate(_saltLength, (_) => rng.nextInt(256));
  }

  static bool _constantTimeEquals(List<int> a, List<int> b) {
    if (a.length != b.length) return false;
    var diff = 0;
    for (var i = 0; i < a.length; i++) {
      diff |= a[i] ^ b[i];
    }
    return diff == 0;
  }
}
