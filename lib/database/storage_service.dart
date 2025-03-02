import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  static late Box _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('nic_data');
  }

  /// Saves the NIC data along with other details like birthDate, gender, and age.
  static void saveNic(Map<String, dynamic> data) {
    _box.add(data);
  }

  /// Retrieves all NIC data from the storage.
  static List getAllNicData() {
    return _box.values.toList();
  }
}
