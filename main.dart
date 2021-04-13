import 'contexto.dart';
import 'data.dart';
import 'limpiar.dart';

main(List<String> args) {
  var tamano = 7;
  var columnas = [1, 2, 3, 4, 5, 6, 7];
  var filas = [1, 2, 3, 4, 5, 6, 7];
  var total_casillas = [
    [1, 1],
    [1, 2],
    [1, 3],
    [1, 4],
    [1, 5],
    [1, 6],
    [1, 7],
    [2, 1],
    [2, 2],
    [2, 3],
    [2, 4],
    [2, 5],
    [2, 6],
    [2, 7],
    [3, 1],
    [3, 2],
    [3, 3],
    [3, 4],
    [3, 5],
    [3, 6],
    [3, 7],
    [4, 1],
    [4, 2],
    [4, 3],
    [4, 4],
    [4, 5],
    [4, 6],
    [4, 7],
    [5, 1],
    [5, 2],
    [5, 3],
    [5, 4],
    [5, 5],
    [5, 6],
    [5, 7],
    [6, 1],
    [6, 2],
    [6, 3],
    [6, 4],
    [6, 5],
    [6, 6],
    [6, 7],
    [7, 1],
    [7, 2],
    [7, 3],
    [7, 4],
    [7, 5],
    [7, 6],
    [7, 7]
  ];

  // [
  //   [1, 1],
  //   [1, 2],
  //   [1, 3],
  //   [1, 4],
  //   [2, 1],
  //   [2, 2],
  //   [2, 3],
  //   [2, 4],
  //   [3, 1],
  //   [3, 2],
  //   [3, 3],
  //   [3, 4],
  //   [4, 1],
  //   [4, 2],
  //   [4, 3],
  //   [4, 4],
  // ];

  var data = SingletonData();
  data.tamano = tamano;
  total_casillas.forEach((element) => data.casillas.add(element.toString()));

  var primerContexto = Contexto(total_casillas, filas, columnas, []);

  crearRamificaciones(primerContexto, total_casillas);

  data.limpiarDuplicados();
  // data.imprimir();
  data.guardarData(tamano);
}

crearRamificaciones(Contexto contexto, List<List<int>> total_casillas) {
  for (var casilla in total_casillas) {
    var res = limpiar(contexto, casilla);
    if (res.casillas.isNotEmpty)
      crearRamificaciones(res, res.casillas);
    else {
      var data = SingletonData();
      res.reinasAnteriores.sort();
      data.agregarInfo(res.reinasAnteriores);
    }
  }
}
