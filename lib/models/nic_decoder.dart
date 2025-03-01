class NicDecoder {
  final String nic;

  NicDecoder(this.nic);

  Map<String, String> decode() {
    bool isNewFormat = nic.length == 12;
    String year = '';
    String dayOfYear = '';
    String gender = '';
    String dateOfBirth = '';
    String weekDayName = '';
    String age = '';
    String votingEligibility = '';

    if (isNewFormat) {
      year = nic.substring(0, 4);
      dayOfYear = nic.substring(4, 7);
    } else {
      year = '19${nic.substring(0, 2)}';
      dayOfYear = nic.substring(2, 5);
    }

    int day = int.parse(dayOfYear);
    if (day > 500) {
      gender = 'Female';
      day -= 500;
    } else {
      gender = 'Male';
    }

    DateTime dob = DateTime(int.parse(year), 1, 1).add(Duration(days: day - 1));
    dateOfBirth =
        '${dob.year}/${dob.month.toString().padLeft(2, '0')}/${dob.day.toString().padLeft(2, '0')}';
    weekDayName = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ][dob.weekday - 1];

    age = (DateTime.now().year - dob.year).toString();

    if (isNewFormat || nic.toUpperCase().endsWith('V')) {
      votingEligibility = 'Yes';
    } else {
      votingEligibility = 'No';
    }

    return {
      'Date of Birth': dateOfBirth,
      'Week Day Name': weekDayName,
      'Age': '$age years',
      'Gender': gender,
      'Voting Eligibility': votingEligibility,
    };
  }
}
