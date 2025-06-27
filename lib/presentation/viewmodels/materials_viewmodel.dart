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

  late int _materialsNumber;

  late int _selectedAnswer = 0;

  late int _indexOfLastQuestion;
  late int _indexOfLastMaterial;

  bool isLastMaterial = false;
  bool isFirstMaterial = true;

  bool _isFinalMaterial = false;
  bool _isFinalQuestion = false;

  bool get isFinalMaterial => _isFinalMaterial;
  bool get isFinalQuestion => _isFinalQuestion;

  int get selectedAnswer => _selectedAnswer;
  int get indexOfLastQuestion => _indexOfLastQuestion;

  List<Materials> get materials => _materials;
  List<Question> get questions => _questions;

  Materials? get materialAtive => _materialsAtive;
  Question? get currentQuestion => _currentQuestion;

  MaterialsViewModel(this._materialRepository);

  Future<void> loadMaterialsByAulaId(int id, int step) async {
    try {
      _materialsNumber = step;
      _materials = await _materialRepository.getMaterialsByAulaId(id);
      // _materialsAtive = _materials[_index];
      _answers =
          _materials.map((e) => Answer(id: e.id, answer: e.name)).toList();
      _materialsAtive = _materials.firstWhere((e) => e.isMaterial == step);

      _indexOfLastMaterial = _materials.indexOf(_materials.last)+1;
      _isFinalQuestion = false;
      _isFinalMaterial = false;
      isLastMaterial = false;

      // To generate the questions
      _generateQuestion();
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void setToDefault() {
    _isFinalMaterial = false;
    _isFinalQuestion = false;
    isFirstMaterial = true;
    isLastMaterial = false;
    _selectedAnswer = 0;
    _materialsNumber = 0;
    _indexOfLastQuestion = 0;
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
    
    if (_materialsNumber == _indexOfLastMaterial) {
      _isFinalMaterial = true;
      notifyListeners();
      return;
    }
    _materialsNumber++;
    _materialsAtive = _materials.firstWhere((e) => e.isMaterial == _materialsNumber );
    isLastMaterial = _materialsNumber == _indexOfLastMaterial;
    notifyListeners();
  }

}
