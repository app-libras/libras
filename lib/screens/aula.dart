import 'package:flutter/material.dart';

class AulaScreen extends StatefulWidget {
  const AulaScreen({super.key});
  static const id = 'aula_screen';
  @override
  _AulaScreenState createState() => _AulaScreenState();
}

class _AulaScreenState extends State<AulaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alfabeto "),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20),
                child: Image.asset('assets/aulas/abc_gif/A.gif'),
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color,
                    fontSize: 20,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: 'Esse é o sinal do alfabeto ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: '?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   child: Image.asset('assets/aulas/abc_gif/A.gif'),
              // ),
              Container(
                // padding: const EdgeInsets.all(20),
                // child: const Center(
                //   child: Text(
                //     'A',
                //     style: TextStyle(
                //       fontSize: 20,
                //     ),
                //   ),
                // ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () => null,
                          child: const Text('Option 1',
                              style: TextStyle(color: Colors.black)),
                        ),
                        ElevatedButton(
                          onPressed: () => null,
                          child: const Text(
                            'Option 2',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => null,
                          child: const Text(
                            'Option 3',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => null,
                              child: const Text(
                                'Option 3',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        )
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     ElevatedButton(
                        //       onPressed: () => null,
                        //       child: const Text('Option 1'),
                        //     ),
                        //     ElevatedButton(
                        //       onPressed: () => null,
                        //       child: const Text('Option 1'),
                        //     ),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //   ],
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
