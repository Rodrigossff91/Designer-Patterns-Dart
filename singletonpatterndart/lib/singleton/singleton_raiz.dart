import 'dart:math';

class SingletonRaiz {
  static SingletonRaiz? _instance;

  int id = Random().nextInt(100);

// Construtor Privado
  SingletonRaiz._();

// Metodo para criar instance
  static get instance {
    _instance ??= SingletonRaiz._();

    return _instance;
  }
}
