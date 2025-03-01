import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import 'result_screen.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});

  final NicController controller = Get.put(NicController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.9,
          decoration: BoxDecoration(
            color: Colors.lightBlue[100],
            border: Border.all(
              color: const Color(0xFF1A237E),
              width: 15,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'National ID card (NIC) Decoder',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBBDEFB),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Enter Your NIC Here',
                        style: TextStyle(
                          color: Color(0xCF2037BA),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1A237E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search,
                              color: Color(0xFFFFFFFF),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                controller: TextEditingController(
                                    text: controller.nicNumber.value),
                                onChanged: (value) {
                                  controller.nicNumber.value = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Enter NIC',
                                  hintStyle:
                                      TextStyle(color: Color(0xFFFFFFFF)),
                                  border: InputBorder.none,
                                ),
                                style:
                                    const TextStyle(color: Color(0xFFFFFFFF)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'NIC Format: 198945789V or 200259763066',
                        style: TextStyle(
                          color: Color(0x89000000),
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          if (controller.nicNumber.value.isNotEmpty) {
                            controller.decodeNic(controller.nicNumber.value);
                            Get.to(() => ResultScreen());
                          } else {
                            Get.snackbar(
                              'Error',
                              'Please enter a NIC number',
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE0E0E0),
                          foregroundColor: const Color(0xFF000000),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'DECODE NIC',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
