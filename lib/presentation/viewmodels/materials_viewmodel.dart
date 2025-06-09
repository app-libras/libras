import 'package:flutter/material.dart';
import 'package:libras/data/repositories/repo/materials_repository.dart';
import 'package:libras/domain/entities/materials.dart';

class MaterialsViewModel extends ChangeNotifier {
  final MaterialsRepository _materialRepository;

  List<Materials> _materials = [];

  late Materials _materialsAtive;

  int _index = 0;

  bool isLastMaterial = false;

  bool isFirstMaterial = true;

  bool _isFinal = false;

  bool get isFinal => _isFinal;

  List<Materials> get materials => _materials;

  Materials? get materialAtive => _materialsAtive;

  MaterialsViewModel(this._materialRepository);

  Future<void> loadMaterialsByAulaId(int id) async {
    print(id);
    try {
      _materials = await _materialRepository.getMaterialsByAulaId(id);
      // _materialsAtive = _materials[_index];
      _materialsAtive = _materials[0];
      print(_materials);
    } catch (e) {
      print(e);
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void nextMaterial() {
    if (_materials.indexOf(_materialsAtive) == _materials.length - 1) {
      isFirstMaterial = true;
      isLastMaterial = true;
      _isFinal = true;
      notifyListeners();
      return;
    }
    _materialsAtive = _materials[_materials.indexOf(_materialsAtive) + 1];
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
