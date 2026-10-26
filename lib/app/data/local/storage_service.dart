import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();

  static const String _tokenKey = 'auth_token';
  static const String _isFirstTimeKey = 'is_first_time';
  static const String _regStepKey = 'registration_step'; // 1, 2, 3 বা 0 (Complete)

  Future<void> saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }

  String? getToken() {
    return _box.read<String>(_tokenKey);
  }

  Future<void> removeToken() async {
    await _box.remove(_tokenKey);
  }

  // ── First Time Check (Welcome Screen) ──
  Future<void> setFirstTimeDone() async {
    await _box.write(_isFirstTimeKey, false);
  }

  bool isFirstTime() {
    return _box.read<bool>(_isFirstTimeKey) ?? true; // বাই-ডিফল্ট true থাকবে
  }

  // ── Registration Step Tracking ──
  Future<void> saveRegistrationStep(int step) async {
    await _box.write(_regStepKey, step);
  }

  int getRegistrationStep() {
    return _box.read<int>(_regStepKey) ?? 0; // 0 মানে কোনো রেজিস্ট্রেশন শুরু হয়নি
  }

  Future<void> clearStorage() async {
    await _box.erase();
  }
}