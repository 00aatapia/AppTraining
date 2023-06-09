class Ejercicio {
  final String id_Ejercicio;
  final String tipo;
  final String nivel;
  final String nombre_Ejercicio;
  final String foto;
  final String cantidad_Series;
  final String cantidad_repeteciones;
  final String estado;

  Ejercicio({
    required this.id_Ejercicio,
    required this.tipo,
    required this.nivel,
    required this.nombre_Ejercicio,
    required this.foto,
    required this.cantidad_Series,
    required this.cantidad_repeteciones,
    required this.estado,
  });

  factory Ejercicio.fromJson(Map<String, dynamic> json) {
    return Ejercicio(
      id_Ejercicio: json['id_Ejercicio'],
      tipo: json['tipo'],
      nivel: json['nivel'],
      nombre_Ejercicio: json['nombre_Ejercicio'],
      foto: json['foto'],
      cantidad_Series: json['cantidad_Series'],
      cantidad_repeteciones: json['cantidad_repeteciones'],
      estado: json['estado'],
    );
  }
}
