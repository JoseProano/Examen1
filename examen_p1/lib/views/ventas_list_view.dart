import 'package:flutter/material.dart';
import '../controllers/ventas_controller.dart';
import '../themes/app_themes.dart';
import '../themes/text_styles.dart';
import '../themes/decorations.dart'; 

class VentasListView extends StatelessWidget {
  final VentasController controller;
  final VoidCallback onToggleTheme;
  final bool isDark;

  const VentasListView({
    super.key,
    required this.controller,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final ventas = controller.ventas;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todas las Ventas'),
        actions: [
          Icon(isDark ? Icons.dark_mode : Icons.light_mode),
        ],
      ),
      body: ventas.isEmpty
          ? const Center(child: Text('No hay ventas registradas.'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: ventas.length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, i) {
                final venta = ventas[i];
                final color = AppThemes.colorPorCategoria(venta.categoria);
                return Container(
                  decoration: AppDecorations.cardDecoration(
                    color,
                    isDark: Theme.of(context).brightness == Brightness.dark,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: color,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            venta.monto.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16, // Puedes ajustar este valor si lo deseas más pequeño
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      '\$${venta.monto.toStringAsFixed(2)}',
                      style: AppTextStyles.amount,
                    ),
                    subtitle: Text(
                      AppThemes.nombreCategoria(venta.categoria),
                      style: AppTextStyles.subtitle,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: onToggleTheme,
        tooltip: 'Cambiar tema',
        child: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
}