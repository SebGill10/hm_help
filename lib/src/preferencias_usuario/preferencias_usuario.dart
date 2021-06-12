import 'package:shared_preferences/shared_preferences.dart';

/*
  Recordar instalar el paquete de:
    shared_preferences:

  Inicializar en el main
    final prefs = new PreferenciasUsuario();
    await prefs.initPrefs();
    
    Recuerden que el main() debe de ser async {...

*/

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences? _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  String get token {
    return _prefs!.getString('token') ?? '';
  }

  set token(String value) {
    _prefs!.setString('token', value);
  }

  String get nombreUsuario {
    return _prefs!.getString('nombre') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs!.setString('nombre', value);
  }

  int? get gananciaMaxima {
    return _prefs!.getInt('gananciaMaxima');
  }

  set gananciaMaxima(int? value) {
    _prefs!.setInt('gananciaMaxima', value!);
  }

  String get imageUsuario {
    return _prefs!.getString('image') ?? '';
  }

  set imageUsuario(String value) {
    _prefs!.setString('image', value);
  }

  String get cvUsuario {
    return _prefs!.getString('cvUsuario') ?? '';
  }

  set cvUsuario(String value) {
    _prefs!.setString('cvUsuario', value);
  }
}
