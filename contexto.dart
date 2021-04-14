import 'data.dart';

class Contexto {
  List<int> filas;
  List<int> columnas;
  List<int> crecientes;
  List<int> decrecientes;
  List<List<int>> casillas;
  List<int> reinasAnteriores;

  Contexto(
    this.casillas, this.filas, this.columnas,this.reinasAnteriores, 
    {this.crecientes = const [], this.decrecientes = const []});

  elimininarCasillas(List<int> indexCasElim) {
    var data = SingletonData();
    indexCasElim.forEach((c) {
      casillas.removeWhere((element) => element.toString() == data.casillas[c]);
    });
  }
}
