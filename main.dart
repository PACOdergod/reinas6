import 'contexto.dart';
import 'data.dart';
import 'limpiar.dart';
import 'ramificacion.dart';

main(List<String> args) {
  var tamano = 4;
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
    [1,2]
    // [4,3]
  ];
  crearRamificaciones(primerContexto, listaInicio, 1,
      casOcupadas: casillasIniciales);

  // una vez terminado el calculo hay que limpiar
  // la data y guardarla
  data.limpiarDuplicados();
  data.imprimir();
  // data.guardarData(tamano);
}
