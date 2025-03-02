import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import 'package:google_fonts/google_fonts.dart' as gf;

class InputScreen extends StatelessWidget {
  // Initialize NicController using GetX dependency injection
  final NicController controller = Get.put(NicController());

  // Pass 'key' to the superclass constructor
  InputScreen({Key? key}) : super(key: key); // <-- Fixed by passing 'key' to the superclass

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NIC Decoder', style: gf.GoogleFonts.poppins()), // Removed `const` to avoid eval error
        backgroundColor: const Color.fromARGB(255, 27, 219, 75),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter your NIC number.',
              style: gf.GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 20),

            // NIC Number Input Field where user enters the NIC
            TextField(
              decoration: InputDecoration(
                labelText: 'NIC Number',
                hintText: 'e.g., 200150402589',
                prefixIcon: Icon(Icons.credit_card),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.blueGrey[50],
              ),
              onChanged: (value) => controller.nicNumber.value = value,
            ),
            SizedBox(height: 20),

            // Error Message Widget, displayed if there is any error in the NIC input
            Obx(() {
              return controller.errorMessage.isNotEmpty
                  ? Text(
                      controller.errorMessage.value,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )
                  : SizedBox.shrink();
            }),

            // Decode Button that triggers the decoding process when pressed
            SizedBox(height: 20),
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: controller.decodeNic, // Triggers NIC decoding function
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 7, 99, 50), // Replaced `primary` with `backgroundColor`
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Decode NIC',
                  style: gf.GoogleFonts.poppins(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Display a loading indicator if the NIC is being processed
            Obx(() {
              return controller.isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink();
            }),
          ],
        ),
      ),
    );
  }
}