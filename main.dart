import 'contexto.dart';

main(List<String> args) {
  var tamano = 4;
  var columnas = [1, 2, 3, 4];
  var filas = [1, 2, 3, 4];
  var total_casillas = [
    [1, 1],
    [1, 2],
    [1, 3],
    [1, 4],
    [2, 1],
    [2, 2],
    [2, 3],
    [2, 4],
    [3, 1],
    [3, 2],
    [3, 3],
    [3, 4],
    [4, 1],
    [4, 2],
    [3, 4],
    [4, 4],
  ];

  var primerContexto = Contexto(total_casillas, filas, columnas, []);

  crearRamificaciones(primerContexto, total_casillas);
  var data = SingletonData();
  data.imprimir();
}

crearRamificaciones(Contexto contexto, List<List<int>> total_casillas) {
  for (var casilla in total_casillas) {
    var res = eliminarOcupadas(contexto, casilla);
    if (res.casillas.isNotEmpty)
      crearRamificaciones(res, res.casillas);
    else {
      var data = SingletonData();
      data.agregarInfo(res.reinasAnteriores);
    }
  }
}

Contexto eliminarOcupadas(Contexto contexto, List<int> nuevaReina) {
  // recibire la casilla donde estara la reina
  // y del contexto obtendre todas las listas
  // para los calculos
  // retornare un nuevo contexto
  List<List<int>> casillasLimpiar = List.from(contexto.casillas);
  List<int> columnasLibres = List.from(contexto.columnas);
  List<int> filasLibres = List.from(contexto.filas);
  List<int> crecientesOcupadas = List.from(contexto.crecientes);
  List<int> decrecientesOcupadas = List.from(contexto.decrecientes);
  List<List<int>> reinasAnteriores = List.from(contexto.reinasAnteriores);

  // eliminar de las listas las coordenadas de la reina
  columnasLibres.remove(nuevaReina.first);
  filasLibres.remove(nuevaReina.last);
  crecientesOcupadas.add(nuevaReina.first + nuevaReina.last);
  decrecientesOcupadas.add(nuevaReina.first - nuevaReina.last);

  // agregar la reina a la lista de reinas
  reinasAnteriores.add(nuevaReina);

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