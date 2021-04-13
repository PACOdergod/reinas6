class SingletonData {
  static final SingletonData _singleton = SingletonData._internal();

  factory SingletonData() {
    return _singleton;
  }

  SingletonData._internal();

  List<String> casillas = [];

  List<String> _data = [];
  agregarInfo(List<int> reinas) => _data.add(reinas.toString());
  List<String> get listaReinas => _data;

  limpiarDuplicados() {
    _data = _data.toSet().toList();
  }

  imprimir() {
    for (var reinas in _data) print(reinas);
  }
}
