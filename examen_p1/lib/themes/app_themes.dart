import 'package:flutter/material.dart';
import '../models/venta_model.dart';

class AppThemes {
  static final light = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: Colors.teal,
      secondary: Colors.orange,
      surface: Colors.white,
    ),
    fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.teal, 
      foregroundColor: Colors.white,
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.tealAccent[700]!, 
      secondary: Colors.orange[300]!,
      surface: Colors.grey[850]!,
    ),
    fontFamily: 'Montserrat',
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF00BFAE), 
      foregroundColor: Colors.white,
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.grey[850],
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
      foregroundColor: Colors.white,
    ),
  );

  static Color colorPorCategoria(CategoriaVenta cat) {
    switch (cat) {
      case CategoriaVenta.mayor1000:
        return Colors.green;
      case CategoriaVenta.entre500y1000:
        return Colors.blue;
      case CategoriaVenta.menorIgual500:
        return Colors.red;
    }
  }

  static String nombreCategoria(CategoriaVenta cat) {
    switch (cat) {
      case CategoriaVenta.mayor1000:
        return 'Mayor a \$1000';
      case CategoriaVenta.entre500y1000:
        return 'Entre \$500 y \$1000';
      case CategoriaVenta.menorIgual500:
        return 'Menor o igual a \$500';
    }
  }
}