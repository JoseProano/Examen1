class Venta {
  final double monto;

  Venta(this.monto);

  CategoriaVenta get categoria {
    if (monto > 1000) return CategoriaVenta.mayor1000;
    if (monto > 500) return CategoriaVenta.entre500y1000;
    return CategoriaVenta.menorIgual500;
  }
}

enum CategoriaVenta { mayor1000, entre500y1000, menorIgual500 }