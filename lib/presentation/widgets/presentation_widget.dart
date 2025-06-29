import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:librar/presentation/viewmodels/aulas_viewmodel.dart';
import 'package:librar/presentation/viewmodels/materials_viewmodel.dart';

class PresentationWidget extends StatelessWidget {
  const PresentationWidget({super.key, required this.materialsViewModel});

  final MaterialsViewModel materialsViewModel;

  void _nextMaterial(BuildContext context) {
    final aulasViewModel = context.read<AulasViewModel>();
    final currentStep = aulasViewModel.aulaAtive.step;
    final newStep = materialsViewModel.isFinalMaterial
        ? materialsViewModel.indexOfLastMaterial
        : currentStep + 1;
    aulasViewModel.updateAulaStep(newStep);
    context.read<AulasViewModel>().updateAulaStep(
      materialsViewModel.materialAtive!.isMaterial + 1,
    );
    materialsViewModel.nextMaterial();
  }

  void _previousMaterial(BuildContext context) {
    final aulasViewModel = context.read<AulasViewModel>();
    final currentStep = aulasViewModel.aulaAtive.step;
    final newStep = materialsViewModel.isFirstMaterial ? 1 : currentStep - 1;
    aulasViewModel.updateAulaStep(newStep);
    materialsViewModel.previousMaterial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: myAppBar(context, context.watch<AulasViewModel>().aulaAtive.name),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: context.watch<AulasViewModel>().aulaAtive.name,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Text(
                          context.watch<AulasViewModel>().aulaAtive.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(
                              context,
                            ).textTheme.titleMedium?.color,
                          ),
                        ),
                        Icon(Icons.flag, color: Colors.orange[700], size: 35),
                      ],
                    ),
                  ),
                  LinearProgressIndicator(
                    color: Colors.orange[700],
                    backgroundColor: Colors.grey[300],
                    value: materialsViewModel.progressValue,
                  ),
                ],
              ),
            ),
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
              child: Hero(
                tag: materialsViewModel.materialAtive!.name,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(right: 20, left: 20),
                      child: Image.asset(
                        materialsViewModel.materialAtive!.path,
                        gaplessPlayback: true,
                        isAntiAlias: true,

                        // height: 320,
                        width: double.infinity,
                        filterQuality: FilterQuality.high,
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
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: materialsViewModel.isLastMaterial ? 150 : 100,
        color: Colors.transparent,
        child: materialsViewModel.isLastMaterial
            ? BtmBtnColumn(
                materialsViewModel: materialsViewModel,
                nextMaterial: () => _nextMaterial(context),
                previousMaterial: () => _previousMaterial(context),
              )
            : BtmBtnRow(
                materialsViewModel: materialsViewModel,
                nextMaterial: () => _nextMaterial(context),
                previousMaterial: () => _previousMaterial(context),
              ),
      ),
    );
  }
}

class BtmBtnRow extends StatelessWidget {
  const BtmBtnRow({
    super.key,
    required this.materialsViewModel,
    required this.nextMaterial,
    required this.previousMaterial,
  });

  final MaterialsViewModel materialsViewModel;
  final void Function() nextMaterial;
  final void Function() previousMaterial;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        context.watch<MaterialsViewModel>().isFirstMaterial
            ? const SizedBox()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: previousMaterial,
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'Anterior',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 1,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: nextMaterial,
          child: Row(
            children: [
              materialsViewModel.isLastMaterial
                  ? Text('Vamos aos Exercícios', style: TextStyle(fontSize: 24))
                  : Text('Próximo', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 10),
              Icon(Icons.arrow_forward, color: Colors.green, size: 30),
            ],
          ),
        ),
      ],
    );
  }
}

class BtmBtnColumn extends StatelessWidget {
  const BtmBtnColumn({
    super.key,
    required this.materialsViewModel,
    required this.nextMaterial,
    required this.previousMaterial,
  });

  final MaterialsViewModel materialsViewModel;
  final void Function() nextMaterial;
  final void Function() previousMaterial;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 1,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
          ),
          onPressed: nextMaterial,
          child: Row(
            children: [
              materialsViewModel.isLastMaterial
                  ? Text('Vamos aos Exercícios', style: TextStyle(fontSize: 24))
                  : Text('Próximo', style: TextStyle(fontSize: 24)),
              const SizedBox(width: 10),
              Icon(Icons.arrow_forward, color: Colors.green, size: 30),
            ],
          ),
        ),
        context.watch<MaterialsViewModel>().isFirstMaterial
            ? const SizedBox()
            : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 1,
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                onPressed: previousMaterial,
                child: Row(
                  children: const [
                    Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    SizedBox(width: 10),
                    Text(
                      'Anterior',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
