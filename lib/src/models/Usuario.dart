// Generated by https://quicktype.io
class Usuarios {
  List<Usuario> items = [];

  Usuarios();

  Usuarios.fromJsonList(List<dynamic> jsonlist) {
    for (var item in jsonlist) {
      final contratista = new Usuario.fromJsonMap(item);
      items.add(contratista);
    }
  }
}

class Usuario {
  String? id;
  String? correo;
  String? rol;
  String? nombre;
  String? sexo;
  String? image_URL;
  String? apellido;
  String? fechaNacimiento;

  Usuario(
      {this.id,
      this.correo,
      this.rol,
      this.nombre,
      this.apellido,
      this.image_URL,
      this.fechaNacimiento,
      this.sexo});

  Usuario.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    correo = json['correo'];
    rol = json['rol'];
    nombre = json['nombre'];
    sexo = json['sexo'];
    image_URL = json['image_URL'];
    apellido = json['apellido'];
  }
}
