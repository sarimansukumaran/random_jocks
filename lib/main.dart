import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_jocks/controller/jock_screen_controller.dart';
import 'package:random_jocks/view/jock_screen/jock_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<JockScreenController>(
            create: (context) => JockScreenController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: JockScreen(),
      ),
    );
  }
}
