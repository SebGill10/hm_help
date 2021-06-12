import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:hm_help/src/bloc/bloc_validators/Validators.dart';

class ContratistaBloc with Validator {
  final _nombreController = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();
  final _correoController = BehaviorSubject<String>();
  final _contrasenaController = BehaviorSubject<String>();
  final _fechaController = BehaviorSubject<String>();
  final _generoController = BehaviorSubject<String>();

  Stream<String> get nombreStream => _nombreController.stream;
  Stream<String> get apellidoStram => _apellidoController.stream;
  Stream<String> get correoStream =>
      _correoController.stream.transform(validarEmail);
  Stream<String> get contrasenaStream =>
      _contrasenaController.stream.transform(validarPassword);
  Stream<String> get fechaNacimientoStream => _fechaController.stream;
  Stream<String> get generoStream => _generoController.stream;

  Stream<bool> get formValidStream =>
      Rx.combineLatest2(correoStream, contrasenaStream, (c, p) => true);

  Function(String) get changeNombre => _nombreController.sink.add;
  Function(String) get changeApellido => _apellidoController.sink.add;
  Function(String) get changeCorreo => _correoController.sink.add;
  Function(String) get changeContrasena => _contrasenaController.sink.add;
  Function(String) get changeFecha => _fechaController.sink.add;
  Function(String) get changeGenero => _generoController.sink.add;

  String? get nombre => _nombreController.value;
  String? get apellido => _apellidoController.value;
  String? get correo => _correoController.value;
  String? get contra => _contrasenaController.value;
  String? get fecha => _fechaController.value;
  String? get genero => _generoController.value;

  dispose() {
    _nombreController.close();
    _apellidoController.close();
    _correoController.close();
    _contrasenaController.close();
    _fechaController.close();
    _generoController.close();
  }
}
