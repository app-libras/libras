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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Column(
                  children: <Widget>[
                    Text(
                      'Seja Bem Vindo',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'ao',
                          style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          ' LIBRAR.',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/sign.png',
                  height: 100,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: null,
                  backgroundColor: Colors.blueAccent,
                ),
                Text(
                  'avatar',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    decoration: TextDecoration.underline,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Seu Nome:",
                  hintText: 'Digite seu nome',
                  hintStyle: const TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                textCapitalization: TextCapitalization.words,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('Iniciar'),
            )
          ],
        ),
      ),
    );
  }
}
