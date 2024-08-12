import 'package:api2/models/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:api2/Recipes/recipes_screen.dart'; // Ana ekranınızı dahil edin

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await HiveService.instance.init(); // Hive'ı başlat
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipesHomeScreen(), // Ana ekranınızı belirtin
    );
  }
}
