import 'package:flutter/material.dart';
import 'package:librar/presentation/viewmodels/materials_viewmodel.dart';
import 'package:librar/presentation/widgets/congratulations_widget.dart';
import 'package:librar/presentation/widgets/exercise_widget.dart';
import 'package:librar/presentation/widgets/presentation_widget.dart';
import 'package:provider/provider.dart';

class MaterialsScreen extends StatefulWidget {
  static const id = 'materials-screen';
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

@override
class _MaterialsScreenState extends State<MaterialsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final materialsViewModel = context.watch<MaterialsViewModel>();
    return materialsViewModel.isFinalMaterial
        ? materialsViewModel.isFinalQuestion
              ? CongratulationsWidget(materialsViewModel: materialsViewModel)
              : ExerciseWidget(materialsViewModel: materialsViewModel)
        : PresentationWidget(materialsViewModel: materialsViewModel);
  }
}
