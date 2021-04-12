import 'contexto.dart';
import 'data.dart';
import 'limpiar.dart';

main(List<String> args) {
  var tamano = 4;
  var columnas = [1, 2, 3];
  var filas = [1, 2, 3];
  var total_casillas = [
    [1, 1],
    [1, 2],
    [1, 3],
    // [1, 4],
    [2, 1],
    [2, 2],
    [2, 3],
    // [2, 4],
    [3, 1],
    [3, 2],
    [3, 3],
    // [3, 4],
    // [4, 1],
    // [4, 2],
    // [4, 3],
    // [4, 4],
  ];
  var data = SingletonData();
  total_casillas.forEach((element) => data.casillas.add(element.toString()));

  var primerContexto = Contexto(total_casillas, filas, columnas, []);

  crearRamificaciones(primerContexto, total_casillas);
  data.imprimir();
}

crearRamificaciones(Contexto contexto, List<List<int>> total_casillas) {
  for (var casilla in total_casillas) {
    var res = limpiar(contexto, casilla);
    if (res.casillas.isNotEmpty)
      crearRamificaciones(res, res.casillas);
    else {
      var data = SingletonData();
      data.agregarInfo(res.reinasAnteriores);
    }
  }
}
