import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';

class NicInputField extends StatelessWidget {
  NicInputField({super.key});
  final NicController controller = Get.find<NicController>();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        controller.nicNumber.value = value;
      },
      decoration: const InputDecoration(
        labelText: 'NIC Number',
        border: OutlineInputBorder(),
      ),
    );
  }
}
