import 'dart:io';

bool funcEsPrimo(int num){ //Función que devuelve si un número introducido es primo
  bool esPrimo = (num>1); //0 y 1 no son primos
  for (int i=2; i<=num/2; i++){ //Bucle que recorre todos los números hasta la mitad del principal
    if(num%i==0){ //Si el numero principal dividido entre alguno de los demás tiene resto 0, no es primo
      esPrimo = false;
    }
  }
  return esPrimo; //Devuelve el resultado
}

void main(){ //Función principal
  try { //Apertura de control de excepciones
    print("Escribe el último número a comprobar: ");
    int num = int.parse(stdin.readLineSync()!); //Coge el numero escrito por teclado y lo guarda en una variable
    for(int i=2; i<=num; i++){ //Recorre todos los números de 2 al número
      if(funcEsPrimo(i)){ //Si el número es primo, lo muestra
        print(i);
      }
    }
  }catch(e){//Como el único error que puede dar es en la entrada por teclado, se escribe lo siguiente
    print("Escribe un valor numérico");
  }
}