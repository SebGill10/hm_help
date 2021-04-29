import 'package:flutter/material.dart';
import 'package:hm_help/src/bloc/login_bloc.dart';
import 'package:hm_help/src/bloc/provider.dart';
import 'package:hm_help/src/provider/usuario_provider.dart';
import 'package:hm_help/src/pages/registro_usuario.dart';

class LoginScreenUser extends StatelessWidget {
  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Logo(),
              _form(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
        height: 600,
        color: Colors.white,
        child: Column(children: [
          _usuario(bloc),
          _correo(bloc),
          _passWord(bloc),
          _logupButton(),
          SizedBox(
            height: 30,
          ),
        ]));
  }
}

Widget _usuario(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        height: 75,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: TextField(
          scrollPadding: EdgeInsets.only(bottom: 15),
          autocorrect: false,
          //maxLength: 25,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusColor: Colors.blue,
              fillColor: Colors.grey.shade300,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Usuario',
              hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 21,
                  fontWeight: FontWeight.bold)),
          onChanged: (value) => bloc.changeEmail(value),
        ),
      );
    },
  );
}

Widget _correo(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.emailStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        height: 75,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: TextField(
          scrollPadding: EdgeInsets.only(bottom: 15),
          autocorrect: false,
          //maxLength: 25,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusColor: Colors.blue,
              fillColor: Colors.grey.shade300,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Email',
              hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 21,
                  fontWeight: FontWeight.bold)),
          onChanged: (value) => bloc.changeEmail(value),
        ),
      );
    },
  );
}

Widget _passWord(LoginBloc bloc) {
  return StreamBuilder(
    stream: bloc.passwordStream,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        height: 75,
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: TextField(
          scrollPadding: EdgeInsets.only(bottom: 15),
          autocorrect: false,
          obscureText: true,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              focusColor: Colors.blue,
              fillColor: Colors.grey.shade300,
              filled: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Contraseña',
              hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 21,
                  fontWeight: FontWeight.bold)),
        ),
      );
    },
  );
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: double.infinity,
      color: Colors.blue.shade300,
      child: Image(
        height: 250,
        width: 250,
        image: AssetImage('assets/logo.png'),
        //fit: BoxFit.contain,
      ),
    );
  }
}

class _logupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      height: 60,
      margin: const EdgeInsets.only(top: 25),
      child: ElevatedButton(
          child: Text('Registrate'),
          style: ElevatedButton.styleFrom(
              shape: StadiumBorder(),
              textStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          onPressed: () {}),
    );
  }
}
