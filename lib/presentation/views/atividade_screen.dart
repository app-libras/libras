import 'package:flutter/material.dart';
import 'package:librar/presentation/viewmodels/materials_viewmodel.dart';
import 'package:librar/presentation/widgets/congratulations_widget.dart';
import 'package:librar/presentation/widgets/exercise_widget.dart';
import 'package:librar/presentation/widgets/presentation_atividade_widget.dart';
import 'package:provider/provider.dart';

class AtividadeScreen extends StatefulWidget {
  static const id = 'atividade-screen';
  const AtividadeScreen({super.key});

  @override
  State<AtividadeScreen> createState() => _AtividadeScreenState();
}

@override
class _AtividadeScreenState extends State<AtividadeScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final materialsViewModel = context.watch<MaterialsViewModel>();
    return materialsViewModel.isFinalMaterial
        ? materialsViewModel.isFinalQuestion
              ? CongratulationsWidget(materialsViewModel: materialsViewModel)
              : ExerciseWidget(materialsViewModel: materialsViewModel)
        : PresentationAtividadeWidget(materialsViewModel: materialsViewModel);
  }
}
