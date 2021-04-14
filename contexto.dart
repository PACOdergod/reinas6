class Contexto {
  List<int> filas;
  List<int> columnas;
  List<int> crecientes;
  List<int> decrecientes;
  List<List<int>> casillas;
  List<int> reinasAnteriores;

  Contexto(
    this.casillas, this.filas, this.columnas,this.reinasAnteriores, 
    {this.crecientes = const [], this.decrecientes = const []});

  
}
