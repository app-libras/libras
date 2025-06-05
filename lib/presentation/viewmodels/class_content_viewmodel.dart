import 'package:flutter/material.dart';
import 'package:libras/data/repositories/repo/materials_repository.dart';
import 'package:libras/domain/entities/materials.dart';

class ClassContentViewModel extends ChangeNotifier {
  final MaterialsRepository _materialRepository;

  List<Materials> _materials = [];

  Materials? _materialAtive;

  int _index = 0;

  bool isLastMaterial = false;

  bool isFirstMaterial = true;

  bool _isFinal = false;

  bool get isFinal => _isFinal;

  List<Materials> get materials => _materials;

  Materials? get materialAtive => _materialAtive;

  ClassContentViewModel(this._materialRepository);

  Future<void> loadMaterials() async {
    try {
      _materials = await _materialRepository.getAllMaterials();
      _materialAtive = _materials[_index];
      if (_index != 0) {
        isFirstMaterial = false;
      } else {
        isFirstMaterial = true;
      }

      print(_materials);
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void nextMaterial() {
    if (_materials.indexOf(_materialAtive!) == _materials.length - 1) {
      isFirstMaterial = true;
      isLastMaterial = true;
      _isFinal = true;
      notifyListeners();
      return;
    }
    _materialAtive = _materials[_materials.indexOf(_materialAtive!) + 1];
    notifyListeners();
  }

  void previousSaudacao() {
    if (_materials.indexOf(_materialAtive!) == 0) {
      _disablePrevious();
      return;
    }
    _materialAtive = _materials[_materials.indexOf(_materialAtive!) - 1];
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
