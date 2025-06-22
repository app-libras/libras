import 'dart:math';

import 'package:flutter/material.dart';
import 'package:libras/data/models/question_model.dart';
import 'package:libras/data/repositories/repo/materials_repository.dart';
import 'package:libras/domain/entities/answer.dart';
import 'package:libras/domain/entities/question.dart';
import 'package:libras/domain/entities/materials.dart';

class MaterialsViewModel extends ChangeNotifier {
  final MaterialsRepository _materialRepository;

  List<Materials> _materials = [];
  List<Question> _questions = [];
  List<Answer> _answers = [];

  // late Aula _aula;
  late Materials _materialsAtive;
  late Question _currentQuestion;

  late int _materialsId;

  late int _selectedAnswer = 0;

  late int _indexOfLastQuestion;

  bool isLastMaterial = false;

  bool isFirstMaterial = true;

  bool _isFinalMaterial = false;
  bool _isFinalQuestion = false;

  bool get isFinalMaterial => _isFinalMaterial;

  int get selectedAnswer => _selectedAnswer;

  bool get isFinalQuestion => _isFinalQuestion;

  List<Materials> get materials => _materials;
  List<Question> get questions => _questions;

  Materials? get materialAtive => _materialsAtive;
  Question? get currentQuestion => _currentQuestion;

  MaterialsViewModel(this._materialRepository);

  Future<void> loadMaterialsByAulaId(int id, int step) async {
    try {
      _materialsId = step;
      _materials = await _materialRepository.getMaterialsByAulaId(id);
      // _materialsAtive = _materials[_index];
      _answers =
          _materials.map((e) => Answer(id: e.id, answer: e.name)).toList();
      _materialsAtive = _materials[_materialsId];

      _isFinalMaterial = _materials.length == _materialsId + 1;

      if (!_isFinalMaterial) isLastMaterial = false;

      if (!_isFinalQuestion) _isFinalMaterial = false;

      // To generate the questions
      _generateQuestion();
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
  void _generateQuestion() {
    List<Materials> auxMaterials = _materials;
    auxMaterials.shuffle(Random());
    _questions =
        auxMaterials
            .map((e) => QuestionModel.fromMaterial(e, _answers).toEntity())
            .toList();
    _currentQuestion = _questions[_questions.indexOf(_questions.first)];
    _indexOfLastQuestion = _questions.indexOf(_questions.last);
    notifyListeners();
  }

  void selectAnswer(int value) {
    _selectedAnswer = value;
    notifyListeners();
  }

  void nextQuestion() {
    if (_selectedAnswer == 0) {
      return;
    }
    if (_questions.indexOf(_currentQuestion) == _indexOfLastQuestion) {
      _isFinalQuestion = true;
      notifyListeners();
      return;
    }
    _currentQuestion = _questions[_questions.indexOf(_currentQuestion) + 1];
    _selectedAnswer = 0;
    notifyListeners();
  }

  void nextMaterial() {
    if (_materials.indexOf(_materialsAtive) + 1 == _materials.length) {
      _isFinalMaterial = true;
      notifyListeners();
      return;
    }
    print(_materials.indexOf(_materialsAtive) + 1);
    print(_materials.length);
    if (_materials.indexOf(_materialsAtive) == _materials.length - 1) {
      // isFirstMaterial = true;
      isLastMaterial = true;
      notifyListeners();
      return;
    }
    _materialsAtive = _materials[_materials.indexOf(_materialsAtive) + 1];
    isFirstMaterial = false;
    isLastMaterial = false;
    notifyListeners();
  }
}
