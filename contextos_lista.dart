import 'contexto.dart';

class ListaContextos {
  static final ListaContextos _singleton = ListaContextos._internal();
  ListaContextos._internal();
  factory ListaContextos() => _singleton;

  int index = 0;
  List<Contexto> listaContextos = [];

  addContexto(Contexto c) => listaContextos.add(c);

  modificarContexto(int index, List<int>indicesElimC) {
    listaContextos[index].elimininarCasillas(indicesElimC);
  }

}
