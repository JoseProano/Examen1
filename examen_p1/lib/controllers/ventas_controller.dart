import '../models/venta_model.dart';

class VentasController {
  final List<Venta> ventas = [];

  void agregarVenta(double monto) {
    ventas.add(Venta(monto));
  }

  int contarPorCategoria(CategoriaVenta categoria) =>
      ventas.where((v) => v.categoria == categoria).length;

  double montoPorCategoria(CategoriaVenta categoria) =>
      ventas.where((v) => v.categoria == categoria).fold(0, (s, v) => s + v.monto);

  double get montoTotal =>
      ventas.fold(0, (s, v) => s + v.monto);
}