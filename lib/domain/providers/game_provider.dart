import 'package:flutter/material.dart';

class Player {
  String? name;
}

class GameProvider extends ChangeNotifier {
  final Player _player = Player();

  void updatePlayerName(String name) {
    _player.name = name;
    notifyListeners();
  }

  String? get playerName => _player.name;

  GameProvider();
}
