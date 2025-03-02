import 'package:get/get.dart';
import '../utils/nic_decoder.dart';
import '../database/storage_service.dart';

class NicController extends GetxController {
  var nicNumber = ''.obs;
  var nicData = <String, dynamic>{}.obs; // RxMap<String, dynamic>
  var errorMessage = ''.obs;
  var isLoading = false.obs; // Added isLoading field

  // Decode NIC
  void decodeNic() async {
    try {
      isLoading.value = true; // Set loading to true when decoding starts
      // Assuming NicDecoder.decode returns a Map<String, dynamic>
      var decodedData = NicDecoder.decode(nicNumber.value);

      // Check if decoded data contains error
      if (decodedData.containsKey('error')) {
        nicData.value = decodedData;
        errorMessage.value = decodedData['error']; // Set error message
      } else {
        nicData.value = decodedData; // Update nicData with decoded info
        StorageService.saveNic(
            Map<String, dynamic>.from(nicData)); // Save decoded data
        Get.toNamed('/result'); // Navigate to the result screen
      }
    } catch (e) {
      // Handle any unexpected errors
      errorMessage.value = 'An error occurred while decoding the NIC';
      (e); // You can replace with your own error handling logic
    } finally {
      isLoading.value =
          false; // Set loading to false after the process completes
    }
  }
}
