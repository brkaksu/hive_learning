class HiveHelper {
  HiveHelper._init();

  static HiveHelper? _instance;

  static HiveHelper get instance {
    _instance ??= HiveHelper._init();
    return _instance!;
  }
}
