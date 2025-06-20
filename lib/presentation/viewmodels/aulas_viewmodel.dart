import 'package:flutter/material.dart';
import 'package:libras/data/models/aula_model.dart';
import 'package:libras/data/repositories/repo/aula_repository.dart';
import 'package:libras/domain/entities/aula.dart';

class AulasViewModel extends ChangeNotifier {
  final AulaRepository _aulaRepository;
  List<Aula> _aulas = [];

  late Aula _aula;

  Aula get aulaAtive => _aula;

  List<Aula> get aulas => _aulas;

  int index = 0;
  AulasViewModel(this._aulaRepository);

  Future<void> loadAulas() async {
    _aulas = await _aulaRepository.getAllAulas();
    notifyListeners();
  }

  void onClickAula(Aula aula) async {
    AulaModel newAula = AulaModel.fromEntity(aula);
    if (!newAula.isStart) {
      newAula.isStart = true;
      await _aulaRepository.updateAula(newAula);
      await loadAulas();
    }
    _aula = newAula.toEntity();
    notifyListeners();
  }

  void updateAulaStep(int index) async {
    // _aula.step = index;
    AulaModel newAula = AulaModel.fromEntity(_aula);
    newAula.step = index;
    await _aulaRepository.updateAula(newAula);
    _aula = newAula.toEntity();
    _aulas =
        _aulas.map((e) => e.id == newAula.id ? newAula.toEntity() : e).toList();
    notifyListeners();
  }

  void aulaFinish() async {
    AulaModel newAula = AulaModel.fromEntity(_aula);
    if (!newAula.isFinish) {
      newAula.isFinish = true;
      await _aulaRepository.updateAula(newAula);
      _aula = newAula.toEntity();
      _aulas =
          _aulas
              .map((e) => e.id == newAula.id ? newAula.toEntity() : e)
              .toList();
    }
    notifyListeners();
  }
}
