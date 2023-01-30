import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/models/shoes_model.dart';
import 'package:shoes_app/screens/shoes_description_screen.dart';
import 'package:shoes_app/screens/shoes_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ShoesModels(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shoes App',
        home: ShoesScreen(),
      ),
    );
  }
}
