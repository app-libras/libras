import 'dart:math';

import 'package:flutter/material.dart';
import 'package:librar/data/models/question_model.dart';
import 'package:librar/data/repositories/repo/materials_repository.dart';
import 'package:librar/domain/entities/answer.dart';
import 'package:librar/domain/entities/question.dart';
import 'package:librar/domain/entities/materials.dart';

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
  double _progressValue = 0;
  double _progressFactorValue = 0.0;

  late int _indexOfLastQuestion;
  late int _indexOfLastMaterial;

  late bool _isLastMaterial;
  late bool _isFirstMaterial;

  bool _isFinalMaterial = false;
  bool _isFinalQuestion = false;

  bool get isLastMaterial => _isLastMaterial;
  bool get isFirstMaterial => _isFirstMaterial;
  bool get isFinalMaterial => _isFinalMaterial;
  bool get isFinalQuestion => _isFinalQuestion;

  double get progressValue => _progressValue;
  int get selectedAnswer => _selectedAnswer;
  int get indexOfLastQuestion => _indexOfLastQuestion;
  int get indexOfLastMaterial => _indexOfLastMaterial;

  List<Materials> get materials => _materials;
  List<Question> get questions => _questions;

  Materials? get materialAtive => _materialsAtive;
  Question? get currentQuestion => _currentQuestion;

  MaterialsViewModel(this._materialRepository);

  Future<void> loadMaterialsByAulaId(int id, int step) async {
    print('step: $step');
    try {
      _materialsNumber = step;
      _materials = await _materialRepository.getMaterialsByAulaId(id);
      // _materialsAtive = _materials[_index];
      _answers = _materials
          .map((e) => Answer(id: e.id, answer: e.name))
          .toList();
      _materialsAtive = _materials.firstWhere((e) => e.isMaterial == step);

      _indexOfLastMaterial = _materials.indexOf(_materials.last) + 1;
      _isFinalQuestion = false;
      _isFinalMaterial = false;
      _isLastMaterial = false;
      _isFirstMaterial = step == 1;

      _progressFactorValue = (1 / _indexOfLastMaterial);

      _progressValue = _progressFactorValue * step;

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
    _isFirstMaterial = true;
    _isLastMaterial = false;
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
    _questions = auxMaterials
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
    _materialsAtive = _materials.firstWhere(
      (e) => e.isMaterial == _materialsNumber,
    );
    _isFirstMaterial = _materialsNumber == 1;
    _isLastMaterial = _materialsNumber == _indexOfLastMaterial;
    _progressValue = _progressFactorValue * _materialsNumber;
    notifyListeners();
  }

  /// Goes to the previous material.
  ///
  /// If the user is in the first material, it doesn't do anything.
  void previousMaterial() {
    // If the user is in the first material, don't do anything
    if (_materialsNumber == 1) return;
    // Go to the previous material
    _materialsNumber--;
    _materialsAtive = _materials.firstWhere(
      (e) => e.isMaterial == _materialsNumber,
    );
    // Set the flag to true if the user is in the first material
    _isFirstMaterial = _materialsNumber == 1;
    _isLastMaterial = _materialsNumber == _indexOfLastMaterial;
    _progressValue = _progressValue - _progressFactorValue;
    notifyListeners();
  }
}
