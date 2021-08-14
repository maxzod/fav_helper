import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavHelper extends ChangeNotifier {
  static SharedPreferences? _prefs;
  static final _listners = <String, VoidCallback>{};
  FavHelper._();

  static Future<void> boot() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static bool isFav(String key, String id) {
    final items = _prefs!.getStringList(key) ?? <String>[];
    return items.contains(id);
  }

  static Future<void> toggle(String key, String id) async {
    final items = _prefs!.getStringList(key) ?? <String>[];
    final isFav = items.contains(id);
    if (isFav) {
      items.remove(id);
    } else {
      items.add(id);
    }
    await _prefs!.setStringList(key, items);
    if (_listners.keys.contains(key)) {
      _listners[key]!();
    }
  }

  static void listen(String key, VoidCallback callback) {
    _listners[key] = callback;
    callback();
  }
}
