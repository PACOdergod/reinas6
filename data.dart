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

  List<String> _data = [];
  agregarInfo(List<int> reinas) {
    // if (reinas.length >= tamano)
    _data.add(reinas.toString());
  }

  List<String> get listaReinas => _data;

  limpiarDuplicados() {
    _data = _data.toSet().toList();
  }

  imprimir() {
    // for (var reinas in _data) print(reinas);
    print(_data.length);
  }

  guardarData(int t) {
    var file = new File('${t}x${t}.json');
    file.writeAsString(jsonEncode(_data));
  }
}
