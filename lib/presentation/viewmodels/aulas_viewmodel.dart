import 'package:flutter/material.dart';
import 'package:libras/data/models/aula_model.dart';
import 'package:libras/data/repositories/repo/aula_repository.dart';
import 'package:libras/domain/entities/aula.dart';

class AulasViewModel extends ChangeNotifier {
  final AulaRepository _aulaRepository;
  List<Aula> _aulas = [];

  late Aula _aula;

  late int _idOfFinalAula;

  bool _isFinalAula = false;

  Aula get aulaAtive => _aula;

  bool get isFinalAula => _isFinalAula;

  List<Aula> get aulas => _aulas;

  int index = 0;
  AulasViewModel(this._aulaRepository);

  Future<void> loadAulas() async {
    _aulas = await _aulaRepository.getAllAulas();
    _idOfFinalAula = _aulas[_aulas.length - 1].id;
    notifyListeners();
  }

  void setToDefault() {
    _isFinalAula = false;
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
      // _aula = newAula.toEntity();
      _aulas =
          _aulas
              .map((e) => e.id == newAula.id ? newAula.toEntity() : e)
              .toList();
    }
    notifyListeners();
  }

  void nextAula() async {
    int currentAulaId = _aula.id + 1;
    aulaFinish();
    Aula nextAula = _aulas.firstWhere((element) => element.id == currentAulaId);
    if (nextAula.id == _idOfFinalAula) {
      _isFinalAula = true;
    }
    onClickAula(nextAula);

    notifyListeners();
  }
}
