//*If you want to create a new box, add the new box name and string value. You can manage names with this extension.

enum StorageName { localStorage }

extension BoxNameExtension on StorageName {
  String get toName {
    switch (this) {
      case StorageName.localStorage:
        return 'localStorage';
      default:
        return '';
    }
  }
}
