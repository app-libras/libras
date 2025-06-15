import 'package:flutter/material.dart';
import 'package:libras/presentation/viewmodels/materials_viewmodel.dart';
import 'package:libras/presentation/widgets/exercise_of_materials.dart';
import 'package:libras/presentation/widgets/presentation_of_materials.dart';
import 'package:provider/provider.dart';

class MaterialsScreen extends StatelessWidget {
  static const id = 'materials-screen';
  const MaterialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final materialsViewModel = context.watch<MaterialsViewModel>();
    // if (!classContentViewModel.isFinal) {
    //   Navigator.pop(context);
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child:
            materialsViewModel.isLastMaterial
                ? Center(
                  child: Container(
                    child: Text(
                      'Parabéns! Essa foi mais uma conquista na sua jornada de aprendizagem',
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
                : ExerciseOfMaterials(materialsViewModel: materialsViewModel),
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
              onPressed: context.read<MaterialsViewModel>().previousSaudacao,
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
              onPressed: context.read<MaterialsViewModel>().nextMaterial,
              child: Column(
                children: [
                  Icon(Icons.arrow_forward, color: Colors.green, size: 24),
                  materialsViewModel.isLastMaterial
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
