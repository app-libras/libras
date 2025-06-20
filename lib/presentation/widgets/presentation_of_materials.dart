import 'package:flutter/material.dart';
import 'package:libras/presentation/methods/app_bar.dart';
import 'package:libras/presentation/viewmodels/materials_viewmodel.dart';
import 'package:provider/provider.dart';

class PresentationOfMaterials extends StatelessWidget {
  const PresentationOfMaterials({super.key, required this.materialsViewModel});

  final MaterialsViewModel materialsViewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
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
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Esse é o sinal de ',
                        style: TextStyle(fontSize: 24),
                      ),
                      TextSpan(text: "'", style: TextStyle(fontSize: 30)),
                      TextSpan(
                        text: materialsViewModel.materialAtive!.name,
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
              ],
            ),

            const SizedBox(height: 50),
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: Image.asset(
                      materialsViewModel.materialAtive!.path,
                      height: 480,
                      width: double.infinity,
                      // fit: BoxFit.fitWidth,
                      // scale: 1.6,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      right: 10,
                      left: 10,
                      top: 2,
                      bottom: 2,
                    ),
                    margin: const EdgeInsets.only(bottom: 17),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(176, 255, 255, 255),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      materialsViewModel.materialAtive!.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: const Size(150, 50),
            //     elevation: 0,
            //   ),
            //   onPressed: context.read<MaterialsViewModel>().previousSaudacao,
            //   child: Column(
            //     children: const [
            //       Icon(Icons.arrow_back, color: Colors.green, size: 24),
            //       Text('Anterior', style: TextStyle(fontSize: 16)),
            //     ],
            //   ),
            // ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(150, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 1,
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
              onPressed: context.read<MaterialsViewModel>().nextMaterial,
              child: Row(
                children: [
                  materialsViewModel.isLastMaterial
                      ? Text('Exercícios', style: TextStyle(fontSize: 16))
                      : Text('Próximo', style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 10),
                  Icon(Icons.arrow_forward, color: Colors.green, size: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
