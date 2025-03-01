import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key});

  final NicController controller = Get.find<NicController>();

  Widget infoTile(String imagePath, String title, String value) {
    return Card(
      elevation: 4,
      color: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(imagePath, width: 50, height: 50),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F7FA),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: const Color(0xFFE0F7FA),
            border: Border.all(
              color: const Color(0xFF1A237E),
              width: 15,
            ),
          ),
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'National ID Card (NIC) Details',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        infoTile('assets/date_of_birth.png', 'Date of Birth',
                            controller.dateOfBirth.value),
                        infoTile('assets/week_day_name.png', 'Week Day Name',
                            controller.weekDayName.value),
                        infoTile('assets/age.png', 'Age', controller.age.value),
                        infoTile('assets/gender.png', 'Gender',
                            controller.gender.value),
                        infoTile(
                            'assets/voting_eligibility.png',
                            'Voting Eligibility',
                            controller.votingEligibility.value),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
