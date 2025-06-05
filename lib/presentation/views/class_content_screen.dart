import 'package:flutter/material.dart';
import 'package:libras/presentation/viewmodels/class_content_viewmodel.dart';
import 'package:provider/provider.dart';

class ClassContentScreen extends StatelessWidget {
  static const id = 'class-content-screen';
  const ClassContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final classContentViewModel = context.watch<ClassContentViewModel>();
    // if (!classContentViewModel.isFinal) {
    //   Navigator.pop(context);
    // }
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
        child:
            classContentViewModel.isLastSaudacao
                ? Center(
                  child: Container(
                    child: Text(
                      'Parabéns! Essa foi mais uma conquista na sua jornada de aprendizagem',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                : Column(
                  children: [
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).textTheme.titleMedium?.color,
                              fontSize: 20,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Esse é o sinal de ',
                                style: TextStyle(fontSize: 24),
                              ),
                              TextSpan(
                                text: "'",
                                style: TextStyle(fontSize: 30),
                              ),
                              TextSpan(
                                text: classContentViewModel.saudacaoAtive!.name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "'",
                                style: TextStyle(
                                  fontSize: 30,
                                  // fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Text(
                        //   'Bom dia',
                        //   style: TextStyle(fontSize: 25, color: Colors.grey),
                        // ),
                      ],
                    ),

                    const SizedBox(height: 50),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Image.asset(
                          classContentViewModel.saudacaoAtive!.path,
                          height: 380,
                          width: 310,
                          // fit: BoxFit.fitWidth,
                          scale: 0.01,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                elevation: 0,
              ),
              onPressed: context.read<ClassContentViewModel>().previousSaudacao,
              child: Column(
                children: const [
                  Icon(Icons.arrow_back, color: Colors.green, size: 24),
                  Text('Anterior', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                elevation: 0,
              ),
              onPressed: context.read<ClassContentViewModel>().nextSaudacao,
              child: Column(
                children: [
                  Icon(Icons.arrow_forward, color: Colors.green, size: 24),
                  classContentViewModel.isLastSaudacao
                      ? Text('Finalizar', style: TextStyle(fontSize: 16))
                      : Text('Próximo', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
