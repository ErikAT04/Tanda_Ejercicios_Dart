import 'dart:async';

void main() async { //Función principal
  int maxSegundos = 10;
  Stream<int> temporizador = Stream.periodic(Duration(seconds: 1), (segundosContados) => maxSegundos-segundosContados).takeWhile((valor) => valor!=0);
  temporizador.forEach(print);
Stream<int> contador = Stream.periodic(Duration(seconds: 1), (x) => x);
contador.listen((x){
  print(x);
},
onDone: () => print("Finalizado"),
onError: (e) => print("Error: ${e.toString()}"));
}