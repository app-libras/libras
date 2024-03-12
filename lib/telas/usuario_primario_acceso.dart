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
      // appBar: AppBar(
      //   backgroundColor: const Color.fromARGB(244, 4, 245, 149),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     const Column(
            //       children: <Widget>[
            //         Text(
            //           'Seja Bem Vindo',
            //           style: TextStyle(
            //             fontSize: 25,
            //             fontWeight: FontWeight.w500,
            //           ),
            //         ),
            //         SizedBox(
            //           height: 5,
            //         ),
            //         Row(
            //           children: <Widget>[
            //             Text(
            //               'ao',
            //               style: TextStyle(
            //                 fontSize: 25,
            //                 fontStyle: FontStyle.italic,
            //               ),
            //             ),
            //             Text(
            //               ' LIBRAR.',
            //               style: TextStyle(
            //                 fontSize: 30,
            //                 fontWeight: FontWeight.bold,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),
            //     Image.asset(
            //       'assets/images/sign.png',
            //       height: 100,
            //     ),
            //   ],
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            GestureDetector(
              onTap: () {},
              child: const Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    radius: 80,
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 140,
                    child: Icon(
                      Icons.add_circle,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                ],
              ),
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
              child: Text('Entrar'),
            )
          ],
        ),
      ),
      // bottomNavigationBar: const BottomAppBar(
      //   color: Color.fromARGB(244, 4, 245, 149),
      //   height: 50,
      // ));
    );
  }
}
