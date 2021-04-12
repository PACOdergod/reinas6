class SingletonData {
  static final SingletonData _singleton = SingletonData._internal();

  factory SingletonData() {
    return _singleton;
  }

  SingletonData._internal();

  List<String> data = [];
  agregarInfo(List<List<int>> reinas) => data.add(reinas.toString());

  imprimir() {
    for (var reinas in data) print(reinas);
  }
}