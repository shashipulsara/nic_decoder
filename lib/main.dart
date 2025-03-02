import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'controllers/theme_controller.dart';
import 'database/storage_service.dart';
import 'models/nic_model.dart';
import 'views/input_screen.dart';
import 'views/result_screen.dart';
import 'package:google_fonts/google_fonts.dart' as gf;

/// The entry point of the application. It initializes Hive, registers adapters,
/// and sets up necessary services before running the app.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive and Storage Service
  await Hive.initFlutter();
  Hive.registerAdapter(NicModelAdapter());
  await StorageService.init();

  // Initialize Theme Controller
  Get.put(ThemeController());

  runApp(const MyApp());
}

/// This widget represents the root of the application. It manages the overall
/// theme (light or dark) and routes for the application, using GetX for
/// navigation and state management.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return Obx(() => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Advanced NIC Decoder',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
            useMaterial3: true,
            textTheme: gf.GoogleFonts.poppinsTextTheme(Typography().black),
            // App-wide text style
          ),
          darkTheme: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blueGrey,
              brightness: Brightness.dark,
            ),
            textTheme: gf.GoogleFonts.poppinsTextTheme(Typography().white),
          ),
          themeMode: themeController.isDarkMode.value
              ? ThemeMode.dark
              : ThemeMode.light,
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => InputScreen()),
            GetPage(name: '/result', page: () => ResultScreen()),
            
          ],
        ));
  }
}
