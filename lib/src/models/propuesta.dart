import 'package:intl/intl.dart';

class Propuestas {
  List<Propuesta> items = [];

  Propuestas();

  Propuestas.fromJsonList(List<dynamic> jsonlist) {
    for (var item in jsonlist) {
      final propuesta = new Propuesta.fromJsonMap(item);
      items.add(propuesta);
    }
  }
}

class Propuesta {
  String? rubro;
  String? nombreUsuario;
  String? nombreContratista;
  String? nombre;
  String? descripcion;
  double? monto;
  String? id;
  DateTime? created;
  DateTime? updated;
  String? status;

  Propuesta({
    this.rubro,
    this.nombreUsuario,
    this.nombreContratista,
    this.nombre,
    this.descripcion,
    this.monto,
    this.id,
    this.created,
    this.updated,
    this.status,
  });

  Propuesta.fromJsonMap(Map<String, dynamic> json) {
    rubro = json['rubro'];
    nombreUsuario = json['nombreUsuario'];
    nombreContratista = json['nombreContratista'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    monto = json['monto'];
    id = json['id'];
    created = castStringtoDate(json['created']);
    updated = castStringtoDate(json['updated']);
    status = json['status'];
  }

  DateTime castStringtoDate(String fecha) {
    DateTime date = DateTime.parse(fecha.replaceAll('T', ' '));
    DateFormat("MMMM yyyy").format(date);
    return date;
  }
}

class MesAgrupado {
  String? mes;
  double? suma;

  MesAgrupado(
    this.mes,
    this.suma,
  );
}
