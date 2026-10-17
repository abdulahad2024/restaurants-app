import 'package:get_storage/get_storage.dart';

class StorageService {
  final _box = GetStorage();

  // Key-গুলো কনস্ট্যান্ট হিসেবে রাখা প্রোডাকশন লেভেলের স্ট্যান্ডার্ড
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  // টোকেন সেভ করার মেথড
  Future<void> saveToken(String token) async {
    await _box.write(_tokenKey, token);
  }

  // টোকেন রিড বা গেট করার মেথড
  String? getToken() {
    return _box.read<String>(_tokenKey);
  }

  // টোকেন রিমুভ বা ডিলিট করার মেথড (লগআউটের সময় লাগবে)
  Future<void> removeToken() async {
    await _box.remove(_tokenKey);
  }

  // পুরো বক্স ক্লিয়ার করার জন্য
  Future<void> clearStorage() async {
    await _box.erase();
  }
}