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

  Future<void> onClickAula(Aula aula) async {
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

  /// Moves to the next aula, if the current aula is the final one it
  /// sets [_isFinalAula] to true.
  ///
  /// If the user is in the last aula, it only sets [_isFinalAula] to true
  /// without moving to the next aula.
  void nextAula() async {
    final currentAulaIndex = _aulas.indexWhere(
      (element) => element.id == _aula.id,
    );
    if (currentAulaIndex == -1 || currentAulaIndex == _aulas.length - 1) return;

    // Finish the current aula
    aulaFinish();

    // Get the next aula
    final nextAula = _aulas[currentAulaIndex + 1];

    // If the next aula is the final one, set [_isFinalAula] to true
    if (nextAula.id == _idOfFinalAula) {
      _isFinalAula = true;
    }

    // Go to the next aula
    await onClickAula(nextAula);

    // Notify the listeners
    notifyListeners();
  }
}
