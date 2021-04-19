import 'dart:convert';
import 'dart:io';

class SingletonData {
  static final SingletonData _singleton = SingletonData._internal();

  factory SingletonData() {
    return _singleton;
  }

  SingletonData._internal();

  int tamano = 0;
  List<String> casillas = [];
  // List<List<String>> totalCasillas = [];

  List<String> _coordenadas = [];
  List<String> _indices = [];
  agregarInfo(List<int> indexReinas) {
    if (indexReinas.length >= tamano) {
      var listAux = [];
      indexReinas.forEach((i) => listAux.add(casillas[i]));
      _coordenadas.add(listAux.toString());
    }
  }

  List<String> get listaReinas => _coordenadas;

  limpiarDuplicados() {
    _coordenadas = _coordenadas.toSet().toList();
  }

  imprimir() {
    for (var reinas in _coordenadas) print(reinas);
    print(_coordenadas.length);
  }

  guardarData(int t) {
    var file = new File('${t}x${t}.json');
    file.writeAsString(jsonEncode(_coordenadas));
  }

  int _numeroRamificaciones = 0;
  nuevaRama() => _numeroRamificaciones += 1;
  get cantidadRamas => _numeroRamificaciones;
}
