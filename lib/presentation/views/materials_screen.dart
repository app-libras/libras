import 'package:flutter/material.dart';
import 'package:libras/presentation/viewmodels/materials_viewmodel.dart';
import 'package:libras/presentation/widgets/congratulations_widget.dart';
import 'package:libras/presentation/widgets/exercise_widget.dart';
import 'package:libras/presentation/widgets/presentation_widget.dart';
import 'package:provider/provider.dart';

class MaterialsScreen extends StatefulWidget {
  static const id = 'materials-screen';
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  @override
  Widget build(BuildContext context) {
    final materialsViewModel = context.watch<MaterialsViewModel>();
    // if (!classContentViewModel.isFinal) {
    //   Navigator.pop(context);
    // }
    return materialsViewModel.isFinalMaterial
        ? materialsViewModel.isFinalQuestion
            ? CongratulationsWidget(materialsViewModel: materialsViewModel)
            : ExerciseWidget(materialsViewModel: materialsViewModel)
        : PresentationWidget(materialsViewModel: materialsViewModel);
  }
}
