import 'contexto.dart';
import 'data.dart';
import 'limpiar.dart';

main(List<String> args) {
  var tamano = 8;
  var columnas = List.generate(tamano, (index) => index+1);
  var filas = List.generate(tamano, (index) => index+1);
  List<List<int>> total_casillas = [];
  columnas.forEach((c) {
    filas.forEach((f) {
      var aux = [c, f];
      total_casillas.add(aux);
    });
  });

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
