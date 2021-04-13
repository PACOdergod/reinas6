main(List<String> args) {
  var tamano = 7;
  // var columnas = [1, 2, 3, 4];
  var columnas = List.generate(tamano, (index) => index+1);
  // var filas = [1, 2, 3, 4];
  var filas = List.generate(tamano, (index) => index+1);
  List<List<int>> total_casillas = [];
  columnas.forEach((c) {
    filas.forEach((f) {
      var aux = [c, f];
      total_casillas.add(aux);
    });
  });

  print(columnas);
  print(filas);
  print(total_casillas);
}
