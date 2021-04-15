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
  crearRamificaciones(primerContexto, listaInicio, 0);

  // una vez terminado el calculo hay que limpiar
  // la data y guardarla
  data.limpiarDuplicados();
  data.imprimir();
  // data.guardarData(tamano);
}

crearRamificaciones(
    Contexto contexto, List<List<int>> total_casillas, int columna) {
  // eliminar todas las casillas que sean diferentes a la columna
  var casillasAnalizar =
      List.from(contexto.casillas.where((cas) => cas.first == columna+1));

  
  var data = SingletonData();
  var columnasSobrantes = data.tamano - columna;
  print("${contexto.reinasAnteriores}");
  print("columnas sobrantes: $columnasSobrantes");
  print("casillas sobrantes: $casillasAnalizar");


  if (total_casillas.length >= columnasSobrantes) {
    for (var casilla in casillasAnalizar) {
      var res = limpiar(contexto, casilla);
      if (res.casillas.isNotEmpty)
        crearRamificaciones(res, res.casillas, columna + 1);
      else {
        res.reinasAnteriores.sort();
        data.agregarInfo(res.reinasAnteriores);
      }
    }
  }
  
}
