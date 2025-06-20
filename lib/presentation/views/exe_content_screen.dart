import 'package:flutter/material.dart';

class ClassContentScreen extends StatelessWidget {
  static const id = 'class-content-screen';
  const ClassContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).textTheme.titleMedium?.color,
                      fontSize: 20,
                    ),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Que sinal é esse',
                        style: TextStyle(fontSize: 30),
                      ),
                      TextSpan(
                        text: '?',
                        style: TextStyle(
                          fontSize: 30,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Escolha resposta correta abaixo',
                  style: TextStyle(fontSize: 25, color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 20),
            Center(
              child: Container(
                padding: const EdgeInsets.only(right: 50, left: 50),
                child: Image.asset(
                  'assets/aulas/1/part_1/bomdia.gif',
                  height: 350,
                  width: 300,
                  // fit: BoxFit.fitWidth,
                  scale: 0.01,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.only(right: 50, left: 50),
              child: Wrap(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // padding: const EdgeInsets.all(15),
                      // backgroundColor: Theme.of(context).colorScheme.secondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 187, 186, 186),
                          width: 1,
                        ),
                      ),
                      minimumSize: const Size(150, 50),
                      elevation: 0,
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Bom dia',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
