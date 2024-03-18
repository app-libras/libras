import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            GestureDetector(
              onTap: () {},
              child: const Stack(
                alignment: Alignment.bottomCenter,
                children: [
                 
                  // FluttermojiCircleAvatar(
                  //   radius: 100,
                    
                  // )
                  CircleAvatar(
                    // need to replace with image
                    radius: 80,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 98.0,
                    child: ElevatedButton(
                      onPressed: null,
                      child: Icon(
                        Icons.add_circle,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  )
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
            const SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: null,
                child: Text('Entrar'),
              ),
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
