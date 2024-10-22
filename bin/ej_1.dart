import 'dart:io';

bool funcEsPrimo(int num){
  bool esPrimo = (num>1); //0 y 1 no son primos
  for (int i=2; i<=num/2; i++){ //Bucle que recorre todos los números hasta la mitad del principal
    if(num%i==0){ //Si el numero principal dividido entre alguno de los demás tiene resto 0, no es primo
      esPrimo = false;
    }
  }
  return esPrimo; //Devuelve el resultado
}

void main(){
  try {
    print("Escribe el último número a comprobar: ");
    int num = int.parse(stdin.readLineSync()!);
    for(int i=2; i<=num; i++){
      if(funcEsPrimo(i)){
        print(i);
      }
    }
  }catch(e){
    print("Escribe un valor numérico");
  }
}