import 'package:flutter/material.dart';
import 'package:food_app/classes/theme_provider_class.dart';
import 'package:food_app/models/cart_model.dart';
import 'package:provider/provider.dart';

import 'pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      title: 'Benim Uygulamam',
      debugShowCheckedModeBanner: false,
      theme: themeProvider.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const HomePage(),
    );
  }
}
//4 adet yemek dikine 
//değelendirme 
//fiyat 
//restoran 