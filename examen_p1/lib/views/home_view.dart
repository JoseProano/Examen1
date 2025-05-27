import 'package:flutter/material.dart';
import '../controllers/ventas_controller.dart';
import '../models/venta_model.dart';
import '../themes/app_themes.dart';
import '../themes/decorations.dart';
import '../themes/text_styles.dart';
import 'ventas_list_view.dart';

class HomeView extends StatefulWidget {
  final VentasController controller;
  final VoidCallback onToggleTheme;
  final bool isDark;

  const HomeView({
    super.key,
    required this.controller,
    required this.onToggleTheme,
    required this.isDark,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formKey = GlobalKey<FormState>();
  final _montoController = TextEditingController();

  void _agregarVenta() {
    if (_formKey.currentState!.validate()) {
      final monto = double.parse(_montoController.text);
      setState(() {
        widget.controller.agregarVenta(monto);
        _montoController.clear();
      });
    }
  }

  void _verVentas() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => VentasListView(
          controller: widget.controller,
          onToggleTheme: widget.onToggleTheme,
          isDark: widget.isDark,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ventas Tiki Taka'),
        centerTitle: true, 
        actions: [
          IconButton(
            icon: const Icon(Icons.list_alt),
            tooltip: 'Ver todas las ventas',
            onPressed: _verVentas,
          ),
          Icon(widget.isDark ? Icons.dark_mode : Icons.light_mode),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _montoController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Monto de venta',
                        border: OutlineInputBorder(),
                      ),
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Ingrese un monto';
                        if (double.tryParse(v) == null) return 'Monto inválido';
                        if (double.parse(v) <= 0) return 'Debe ser mayor a 0';
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: _agregarVenta,
                    child: const Text('Agregar'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            ...CategoriaVenta.values.map((cat) {
              final count = widget.controller.contarPorCategoria(cat);
              final monto = widget.controller.montoPorCategoria(cat);
              final color = AppThemes.colorPorCategoria(cat);
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                decoration: AppDecorations.cardDecoration(color),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: color,
                  ),
                  title: Text(
                    AppThemes.nombreCategoria(cat),
                    style: AppTextStyles.title,
                  ),
                  subtitle: Text(
                    'Cantidad: $count\nMonto: \$${monto.toStringAsFixed(2)}',
                    style: AppTextStyles.subtitle,
                  ),
                ),
              );
            }),
            const Divider(),
            ListTile(
              title: const Text('Total vendido', style: AppTextStyles.title),
              trailing: Text(
                '\$${widget.controller.montoTotal.toStringAsFixed(2)}',
                style: AppTextStyles.amount,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onToggleTheme,
        tooltip: 'Cambiar tema',
        child: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
      ),
    );
  }
}