import 'package:flutter/material.dart';
import 'package:libras/data/repositories/repo/aula_repository.dart';
import 'package:libras/domain/entities/aula.dart';

class AulasViewModel extends ChangeNotifier {
  final AulaRepository _aulaRepository;
  List<Aula> _aulas = [];

  List<Aula> get aulas => _aulas;
  int index = 0;
  AulasViewModel(this._aulaRepository);

  Future<void> loadAulas() async {
    _aulas = await _aulaRepository.getAllAulas();
    notifyListeners();
  }
}
