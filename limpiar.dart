import 'contexto.dart';
import 'data.dart';

// main(List<String> args) {
//   var columnas = [1, 2, 3, 4];
//   var filas = [1, 2, 3, 4];
//   var total_casillas = [
//     [1, 1],
//     [1, 2],
//     [1, 3],
//     [1, 4],
//     [2, 1],
//     [2, 2],
//     [2, 3],
//     [2, 4],
//     [3, 1],
//     [3, 2],
//     [3, 3],
//     [3, 4],
//     [4, 1],
//     [4, 2],
//     [4, 3],
//     [4, 4],
//   ];

//   var data = SingletonData();

//   var primerContexto = Contexto(total_casillas, filas, columnas, []);
//   var res = limpiar(primerContexto, [1, 1]);

//   for (var c in res.casillas) {
//     var res2 = limpiar(res, c);
//     for (var cas in res2.casillas) {
//       var res3 = limpiar(res2, cas);

//       data.agregarInfo(res3.reinasAnteriores);
//     }
//   }

//   data.imprimir();
// }

Contexto limpiar(Contexto contexto, List<int> nuevaReina) {
  // recibire la casilla donde estara la reina
  // y del contexto obtendre todas las listas
  // para los calculos
  // retornare un nuevo contexto
  List<List<int>> casillasLimpiar = List.from(contexto.casillas);
  List<int> columnasLibres = List.from(contexto.columnas);
  List<int> filasLibres = List.from(contexto.filas);
  List<int> crecientesOcupadas = List.from(contexto.crecientes);
  List<int> decrecientesOcupadas = List.from(contexto.decrecientes);
  List<int> reinasAnteriores = List.from(contexto.reinasAnteriores);

  // eliminar de las listas las coordenadas de la reina
  columnasLibres.remove(nuevaReina.first);
  filasLibres.remove(nuevaReina.last);
  crecientesOcupadas.add(nuevaReina.first + nuevaReina.last);
  decrecientesOcupadas.add(nuevaReina.first - nuevaReina.last);

  // obtener el indice de la nuevaReina y lo agrega a la lista
  var casillas = SingletonData().casillas;
  var index = casillas.indexOf(nuevaReina.toString());
  reinasAnteriores.add(index);


  List<List<int>> casillasLibres = [];

  for (var i = 0; i < casillasLimpiar.length; i++) {
    var casAct = casillasLimpiar[i];
    // verificar que la casilla este libre
    if (columnasLibres.contains(casAct.first) &&
        filasLibres.contains(casAct.last) &&
        !crecientesOcupadas.contains(casAct.first + casAct.last) &&
        !decrecientesOcupadas.contains(casAct.first - casAct.last)) {
      // esta casilla no esta ocupada
      casillasLibres.add(casAct);
    }
  }

  // aqui construyo un nuevo contexto para los
  // futuros calculos
  return Contexto(casillasLibres, filasLibres, columnasLibres, reinasAnteriores,
      crecientes: crecientesOcupadas, decrecientes: decrecientesOcupadas);
}
