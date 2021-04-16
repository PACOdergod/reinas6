import 'contexto.dart';
import 'data.dart';
import 'limpiar.dart';

main(List<String> args) {
  var tamano = 5;
  var columnas = List.generate(tamano, (index) => index + 1);
  var filas = List.generate(tamano, (index) => index + 1);
  List<List<int>> total_casillas = [];
  columnas.forEach((c) {
    filas.forEach((f) {
      var aux = [c, f];
      total_casillas.add(aux);
    });
  });

  List<List<int>> listaInicio = List.from(total_casillas.take(tamano));

  var data = SingletonData();
  data.tamano = tamano;
  total_casillas.forEach((element) => data.casillas.add(element.toString()));

  // aqui inicia el algoritmo
  var primerContexto = Contexto(total_casillas, filas, columnas, []);
  // for (var c in listaInicio) {
  //   var con = limpiar(primerContexto, c);
  //   crearRamificaciones(con, con.casillas);
  // }
  List<List<int>> casillasIniciales = [
    [5,2]
    
  ];
  crearRamificaciones(primerContexto, listaInicio, 1,
      casOcupadas: casillasIniciales);

  // una vez terminado el calculo hay que limpiar
  // la data y guardarla
  data.limpiarDuplicados();
  data.imprimir();
  // data.guardarData(tamano);
}

// Ahora debe recibir una lista de coordenadas de las casillas
// que va a buscar
crearRamificaciones(
    Contexto contexto, List<List<int>> total_casillas, int columnaAct,
    {List<List<int>> casOcupadas = const []}) {
  // eliminar todas las casillas que sean diferentes a la columna
  List<List<int>> casillasAnalizar =
      List.from(contexto.casillas.where((cas) => cas.first == columnaAct));

  var data = SingletonData();
  // var columnasSobrantes = data.tamano - columnaAct;
  // print("${contexto.reinasAnteriores}");
  // print("columnas sobrantes: $columnasSobrantes");
  // print("casillas sobrantes: $casillasAnalizar");

  // si la lista casOcup no esta vacia debo analizarla
  if (casOcupadas.isNotEmpty) {
    print("casillas ocupadas no esta vacia");
    if (columnaAct == casOcupadas.first.first && casillasAnalizar.indexWhere((cas) => cas.toString() == casOcupadas.first.toString())>= 0) {
      print(casillasAnalizar);
      // estoy en la misma columna de la casilla a analizar
      var res = limpiar(contexto, casOcupadas.first);
      if (res.casillas.isNotEmpty) {
        print(res.casillas);
        crearRamificaciones(res, res.casillas, columnaAct + 1,
            casOcupadas: casOcupadas.sublist(1));
      } else {
        res.reinasAnteriores.sort();
        data.agregarInfo(res.reinasAnteriores);
      }
    } else if (columnaAct != casOcupadas.first.first) {
      for (var casilla in casillasAnalizar) {
        var res = limpiar(contexto, casilla);
        if (res.casillas.isNotEmpty)
          crearRamificaciones(res, res.casillas, columnaAct + 1,
              casOcupadas: casOcupadas);
        else {
          res.reinasAnteriores.sort();
          data.agregarInfo(res.reinasAnteriores);
        }
      }
    }
  } else {
    print("casillas ocupadas esta vacia");
    // TODO: hacer todo esto una funcion
    // if (total_casillas.length >= columnasSobrantes) {
    for (var casilla in casillasAnalizar) {
      var res = limpiar(contexto, casilla);
      if (res.casillas.isNotEmpty)
        crearRamificaciones(res, res.casillas, columnaAct + 1);
      else {
        res.reinasAnteriores.sort();
        data.agregarInfo(res.reinasAnteriores);
      }
    }
    // }
  }
}
