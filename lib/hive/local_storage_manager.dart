// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:developer';

mixin LocalStorageManager {
  static const String boxName = 'tokens';
  static Box _box = Hive.box('tokens');

  /// Check box is open
  Future<void> init() async {
    if (!checkBoxIsOpen()) {
      _box = await Hive.openBox(boxName);
    } else {
      await Hive.openBox(boxName).then((value) => log('$boxName is now open'));
    }
  }

  bool checkBoxIsOpen() {
    if (_box.isOpen) return true;
    return false;
  }

  Future<bool> closeBox(Box box) async {
    await _box.close();
    //checking box is really closed
    return !checkBoxIsOpen();
  }

  Future<void> putItem(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<void> deleteItem(String key) async {
    await _box.delete(key);
  }

  Future<dynamic> getItem(String key) async {
    return await _box.get(key);
  }

  Future<void> clearAllBox() async {
    await _box.clear();
  }

  Future<int?> addItem(dynamic item) async {
    return await _box.add(item);
  }

  bool checkAdapterIsRegistered(int typeId) => Hive.isAdapterRegistered(typeId);
}
