import 'package:hive/hive.dart';

part 'nic_model.g.dart'; // This is required for Hive to generate adapter code.

@HiveType(typeId: 1)
class NicModel extends HiveObject {
  @HiveField(0)
  late String nicNumber;

  @HiveField(1)
  late String format;

  @HiveField(2)
  late String birthDate;

  @HiveField(3)
  late String weekday;

  @HiveField(4)
  late int age;

  @HiveField(5)
  late String gender;

  NicModel({
    required this.nicNumber,
    required this.format,
    required this.birthDate,
    required this.weekday,
    required this.age,
    required this.gender,
  });

  factory NicModel.fromJson(Map<String, dynamic> json) {
    return NicModel(
      nicNumber: json['nicNumber'],
      format: json['format'],
      birthDate: json['birthDate'],
      weekday: json['weekday'],
      age: json['age'],
      gender: json['gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nicNumber': nicNumber,
      'format': format,
      'birthDate': birthDate,
      'weekday': weekday,
      'age': age,
      'gender': gender,
    };
  }
}
