import 'package:intl/intl.dart';

class NicDecoder {
  static Map<String, dynamic> decode(String nic) {
    bool isOld = nic.length == 10, isNew = nic.length == 12;
    if (!isOld && !isNew) return {'error': 'Invalid NIC format'};

    String year = isOld ? '19${nic.substring(0, 2)}' : nic.substring(0, 4);
    int dayOfYear = int.parse(nic.substring(isOld ? 2 : 4, isOld ? 5 : 7));

    String gender = dayOfYear > 500 ? 'Female' : 'Male';
    int actualDay = dayOfYear > 500 ? dayOfYear - 500 : dayOfYear;

    DateTime birthDate = _getDateFromDayOfYear(int.parse(year), actualDay);
    int age = DateTime.now().year - birthDate.year;

    return {
      'format': isOld ? 'Old NIC' : 'New NIC',
      'year': year,
      'birthDate': DateFormat('yyyy-MM-dd').format(birthDate),
      'weekday': DateFormat('EEEE').format(birthDate),
      'age': age,
      'gender': gender
    };
  }

  static DateTime _getDateFromDayOfYear(int year, int dayOfYear) {
    return DateTime(year, 1, 1).add(Duration(days: dayOfYear - 1));
  }
}
