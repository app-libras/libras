import 'dart:math';

import 'package:flutter/material.dart';
import 'package:libras/data/models/answer_model.dart';
import 'package:libras/data/models/question_model.dart';
import 'package:libras/data/repositories/repo/aula_repository.dart';
import 'package:libras/data/repositories/repo/materials_repository.dart';
import 'package:libras/domain/entities/answer.dart';
import 'package:libras/domain/entities/aula.dart';
import 'package:libras/domain/entities/question.dart';
import 'package:libras/domain/entities/materials.dart';

class MaterialsViewModel extends ChangeNotifier {
  final MaterialsRepository _materialRepository;
  final AulaRepository _aulaRepository;

  List<Materials> _materials = [];
  List<Question> _questions = [];
  List<Answer> _answers = [];

  late Aula _aula;
  late Materials _materialsAtive;
  late Question _currentQuestion;

  late int _index;

  bool isLastMaterial = false;

  bool isFirstMaterial = true;

  bool _isFinal = false;

  bool get isFinal => _isFinal;

  List<Materials> get materials => _materials;
  List<Question> get questions => _questions;

  Materials? get materialAtive => _materialsAtive;
  Question? get currentQuestion => _currentQuestion;

  MaterialsViewModel(this._materialRepository, this._aulaRepository);

  Future<void> loadMaterialsByAulaId(int id) async {
    try {
      _aula = await _aulaRepository.getAulaById(id);
      _materials = await _materialRepository.getMaterialsByAulaId(id);
      // _materialsAtive = _materials[_index];
      _answers =
          _materials.map((e) => Answer(id: e.id, answer: e.name)).toList();
      _materialsAtive = _materials[_aula.step];
      // To generate the questions
      generateQuestion();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  /// Generates a list of questions based on the materials.
  ///
  /// This method iterates over the materials and for each one,
  /// it creates a question with the material as the answer.
  /// The questions are then added to the list of questions.
  void generateQuestion() {
    List<Materials> auxMaterials = _materials;
    auxMaterials.shuffle(Random());
    _questions =
        auxMaterials
            .map((e) => QuestionModel.fromMaterial(e, _answers).toEntity())
            .toList();
    _currentQuestion = _questions[_index];
    notifyListeners();
  }

  void nextMaterial() {
    if (_materials.indexOf(_materialsAtive) == _materials.length - 1) {
      // isFirstMaterial = true;
      isLastMaterial = true;
      _isFinal = true;
      notifyListeners();
      return;
    }
    _materialsAtive = _materials[_materials.indexOf(_materialsAtive) + 1];
    notifyListeners();
  }

  void setRandomQuestion() {
    notifyListeners();
  }

  void previousSaudacao() {
    if (_materials.indexOf(_materialsAtive) == 0) {
      _disablePrevious();
      return;
    }
    _materialsAtive = _materials[_materials.indexOf(_materialsAtive) - 1];
    notifyListeners();
  }

  void _disablePrevious() {
    isFirstMaterial = true;
    notifyListeners();
  }

  void disableNext() {
    isLastMaterial = true;
    notifyListeners();
  }

  void enableNext() {
    isLastMaterial = false;
    notifyListeners();
  }

  void enablePrevious() {
    isFirstMaterial = false;
    notifyListeners();
  }
}
