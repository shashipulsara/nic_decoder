import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import 'package:google_fonts/google_fonts.dart' as gf;

/// A screen that displays the decoded NIC details, including the
/// birth year, date of birth, gender, weekday, age, and format.
/// It also handles error messages if decoding fails.
class ResultScreen extends StatelessWidget {
  // NicController is fetched using GetX dependency injection
  final NicController controller = Get.find<NicController>();

  // Add the key parameter to the constructor and pass it to the superclass
  ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve NIC data from the controller
    var data = controller.nicData;

    return Scaffold(
      appBar: AppBar(
        title: Text('Decoded NIC Details', style: gf.GoogleFonts.poppins()),
        backgroundColor: const Color.fromARGB(255, 27, 219, 75),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        // If there's an error in data, display error message; otherwise, show NIC details
        child: data.containsKey('error')
            ? _buildErrorMessage(data['error'])
            : _buildNicDetails(data),
      ),
    );
  }

  /// Builds a widget to display an error message if decoding fails
  ///
  /// The error message will be displayed in red text in the center of the screen.
  Widget _buildErrorMessage(String error) {
    return Center(
      child: Text(
        error,
        style: TextStyle(color: Colors.red, fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Builds a widget to display the decoded NIC details
  ///
  /// It shows the format, birth year, date of birth, weekday, age, and gender.
  Widget _buildNicDetails(Map<String, dynamic> data) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem('Format:', data['format']),
          _buildDetailItem('Birth Year:', data['year']),
          _buildDetailItem('Date of Birth:', data['birthDate']),
          _buildDetailItem('Weekday:', data['weekday']),
          _buildDetailItem('Age:', data['age']),
          _buildDetailItem('Gender:', data['gender']),
          SizedBox(height: 30),

          // Animated button to go back to the Input Screen
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                Get.back(); // Navigate back to the previous screen (input screen)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 7, 99, 50), // Replaced `primary` with `backgroundColor`
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'Back',
                style: gf.GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Helper widget to build an individual detail item
  ///
  /// Displays a label followed by a value (e.g., 'Birth Year: 1985').
  /// If no value is provided, it defaults to 'N/A'.
  Widget _buildDetailItem(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$label ${value ?? 'N/A'}',
        style:
            gf.GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}
