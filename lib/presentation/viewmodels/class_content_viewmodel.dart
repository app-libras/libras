import 'package:flutter/material.dart';
import 'package:libras/data/repositories/repo/saudacao_repository.dart';
import 'package:libras/domain/entities/saudacao.dart';

class ClassContentViewModel extends ChangeNotifier {
  final SaudacaoRepository _saudacaoRepository;

  List<Saudacao> _saudacoes = [];

  Saudacao? _saudacaoAtive;

  int _index = 0;

  bool isLastSaudacao = false;

  bool isFirstSaudacao = true;

  bool _isFinal = false;

  bool get isFinal => _isFinal;

  List<Saudacao> get saudacoes => _saudacoes;

  Saudacao? get saudacaoAtive => _saudacaoAtive;

  ClassContentViewModel(this._saudacaoRepository);

  Future<void> loadSaudacoes() async {
    try {
      _saudacoes = await _saudacaoRepository.getAllSaudacao();
      _saudacaoAtive = _saudacoes[_index];
      if (_index != 0) {
        isFirstSaudacao = false;
      } else {
        isFirstSaudacao = true;
      }

      print(_saudacoes);
    } catch (e) {
      debugPrint(e.toString());
    }
    notifyListeners();
  }

  void nextSaudacao() {
    if (_saudacoes.indexOf(_saudacaoAtive!) == _saudacoes.length - 1) {
      isFirstSaudacao = true;
      isLastSaudacao = true;
      _isFinal = true;
      notifyListeners();
      return;
    }
    _saudacaoAtive = _saudacoes[_saudacoes.indexOf(_saudacaoAtive!) + 1];
    notifyListeners();
  }

  void previousSaudacao() {
    if (_saudacoes.indexOf(_saudacaoAtive!) == 0) {
      _disablePrevious();
      return;
    }
    _saudacaoAtive = _saudacoes[_saudacoes.indexOf(_saudacaoAtive!) - 1];
    notifyListeners();
  }

  void _disablePrevious() {
    isFirstSaudacao = true;
    notifyListeners();
  }

  void disableNext() {
    isLastSaudacao = true;
    notifyListeners();
  }

  void enableNext() {
    isLastSaudacao = false;
    notifyListeners();
  }

  void enablePrevious() {
    isFirstSaudacao = false;
    notifyListeners();
  }
}
