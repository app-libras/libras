import 'package:flutter/material.dart';

class UsuarioAcceso extends StatefulWidget {
  const UsuarioAcceso({super.key});

  @override
  State<UsuarioAcceso> createState() => _UsuarioAccesoState();
}

class _UsuarioAccesoState extends State<UsuarioAcceso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ingreso de usuario')),
      body: SafeArea(child: Text('hello  world!')),
    );
  }
}
