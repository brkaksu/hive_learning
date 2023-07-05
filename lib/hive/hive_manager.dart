// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

class HiveHelper {
  static Future<void> createBox(String boxName) async {
    await Hive.openBox(boxName);
  }

  static bool checkBoxIsOpen(Box box) {
    if (box.isOpen) return true;
    return false;
  }

  static Future<bool> closeBox(Box box) async {
    await box.close();
    if (box.isOpen) return false;
    return true;
  }

  static Future<void> putItem(Box box, String key, dynamic value) async {
    await box.put(key, value);
  }

  static Future<void> deleteItem(Box box, String key) async {
    await box.delete(key);
  }
}
