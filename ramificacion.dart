import 'contexto.dart';
import 'data.dart';
import 'limpiar.dart';

// Ahora debe recibir una lista de coordenadas de las casillas
// que va a buscar
crearRamificaciones(
    Contexto contexto, List<List<int>> total_casillas, int columnaAct,
    {List<List<int>> casOcupadas = const []}) {
  // eliminar todas las casillas que sean diferentes a la columna
  List<List<int>> casillasAnalizar =
      List.from(contexto.casillas.where((cas) => cas.first == columnaAct));

  // var columnasSobrantes = data.tamano - columnaAct;
  // print("${contexto.reinasAnteriores}");
  // print("columnas sobrantes: $columnasSobrantes");
  // print("casillas sobrantes: $casillasAnalizar");

  if (casOcupadas.isNotEmpty) {
    bool estaEnCasillas = false;
    casillasAnalizar.indexWhere(
      (cas) => cas.toString() == casOcupadas.first.toString()) >= 0
      ? estaEnCasillas = true
      : estaEnCasillas = false;

    if (columnaAct == casOcupadas.first.first && estaEnCasillas) {
      // estoy en la misma columna de la casilla ocupada first
      // y las casillas a analizar contiene la casOcup
      var res = limpiar(contexto, casOcupadas.first);
      _verCasOcupada(casillasAnalizar, res, columnaAct, casOcupadas.sublist(1));
    }
    if (columnaAct != casOcupadas.first.first) {
      for (var casilla in casillasAnalizar) {
        var res = limpiar(contexto, casilla);
        _verCasOcupada(casillasAnalizar, res, columnaAct, casOcupadas);
      }
    }
  } 
  if (casOcupadas.isEmpty) {

    // if (total_casillas.length >= columnasSobrantes) {
    _verificarCasillas(casillasAnalizar, contexto, columnaAct);
    // }
  }
}

_verCasOcupada(List<List<int>> casillasAnalizar, Contexto res, int columnaAct,
    List<List<int>> casOcupadas) {
  var data = SingletonData();

  if (res.casillas.isNotEmpty) {
    crearRamificaciones(res, res.casillas, columnaAct + 1,
        casOcupadas: casOcupadas);
  } else {
    res.reinasAnteriores.sort();
    data.agregarInfo(res.reinasAnteriores);
  }
}

_verificarCasillas(
    List<List<int>> casillasAnalizar, Contexto contexto, int columnaAct) {
  var data = SingletonData();

  for (var casilla in casillasAnalizar) {
    var res = limpiar(contexto, casilla);
    if (res.casillas.isNotEmpty)
      crearRamificaciones(res, res.casillas, columnaAct + 1);
    else {
      res.reinasAnteriores.sort();
      data.agregarInfo(res.reinasAnteriores);
    }
  }
}
