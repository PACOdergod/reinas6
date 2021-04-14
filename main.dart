import 'contexto.dart';
import 'contextos_lista.dart';
import 'data.dart';
import 'limpiar.dart';

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

  // crear la lista de los primeros contextos
  var primerContexto = Contexto(total_casillas, filas, columnas, []);
  var primerosContextos = ListaContextos();
  listaInicio.forEach((casilla) {
    var cont = limpiar(primerContexto, casilla);
    primerosContextos.addContexto(cont);
  });
  
  // inicio del algoritmo
  primerosContextos.listaContextos.forEach((contex) {
    crearRamificaciones(contex, total_casillas.skip(tamano).toList());
  });
    // crearRamificaciones(primerContexto, listaInicio);

  // una vez terminado el calculo hay que limpiar
  // la data y guardarla
  // data.limpiarDuplicados();
  data.imprimir();
  // data.guardarData(tamano);
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
