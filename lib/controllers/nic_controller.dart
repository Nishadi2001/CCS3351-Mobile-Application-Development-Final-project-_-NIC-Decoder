import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NicController extends GetxController {
  var nicNumber = ''.obs;
  var dateOfBirth = ''.obs;
  var weekDayName = ''.obs;
  var age = ''.obs;
  var gender = ''.obs;
  var votingEligibility = ''.obs;

  void updateNic(String value) {
    nicNumber.value = value;
  }

  void decodeNic(String nic) {
    try {
      String year = '';
      int dayOfYear = 0;

      if (nic.length == 10 && (nic.endsWith('V') || nic.endsWith('X'))) {
        year = '19${nic.substring(0, 2)}';
        dayOfYear = int.parse(nic.substring(2, 5));
      } else if (nic.length == 12) {
        year = nic.substring(0, 4);
        dayOfYear = int.parse(nic.substring(4, 7));
      } else {
        Get.snackbar('Invalid NIC', 'Please enter a valid NIC number');
        return;
      }

      if (dayOfYear > 500) {
        gender.value = 'Female';
        dayOfYear -= 500;
      } else {
        gender.value = 'Male';
      }

      DateTime dob =
          DateTime(int.parse(year), 1, 1).add(Duration(days: dayOfYear - 1));
      dateOfBirth.value = DateFormat('yyyy / MM / dd').format(dob);
      weekDayName.value = DateFormat('EEEE').format(dob);
      DateTime today = DateTime.now();
      int calculatedAge = today.year - dob.year;
      if (today.month < dob.month ||
          (today.month == dob.month && today.day < dob.day)) {
        calculatedAge--;
      }
      age.value = '$calculatedAge years';

      votingEligibility.value = calculatedAge >= 18 ? 'Yes' : 'No';
    } catch (e) {
      Get.snackbar('Error', 'Failed to decode NIC number');
    }
  }
}
