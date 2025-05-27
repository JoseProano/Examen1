import 'package:flutter/material.dart';
import 'controllers/ventas_controller.dart';
import 'themes/app_themes.dart';
import 'views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;
  final VentasController _controller = VentasController();

  void _toggleTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ventas Tiki Taka',
      theme: AppThemes.light,
      darkTheme: AppThemes.dark,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomeView(
        controller: _controller,
        onToggleTheme: _toggleTheme,
        isDark: _isDark,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
