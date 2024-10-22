import 'dart:io';

class Calculadora{
  int Suma(num1, num2){
    return num1+num2;
  }
  int Resta(num1, num2){
    return num1-num2;
  }
  int Multiplicacion(num1, num2){
    return num1*num2;
  }
  int Division(num1, num2){
    return num1/num2;
  }
}

void main(){
  int opt=-1;
  Calculadora calc = Calculadora();
  do{
    try{
      print("Elige una opción:\n1.Sumar\n2.Restar\n3.Multiplicar\n4.Dividir\n0.Salir");
      opt = int.parse(stdin.readLineSync()!);
      if(1<=opt && opt<=4){
        print("Escribe el primer número");
        int num1 = int.parse(stdin.readLineSync()!);
        print("Escribe el segundo número");
        int num2 = int.parse(stdin.readLineSync()!);
        int res = switch(opt){
          1 => calc.Suma(num1, num2),
          2 => calc.Resta(num1, num2),
          3 => calc.Multiplicacion(num1, num2),
          4 => calc.Division(num1, num2),
          _ => throw UnimplementedError()
        };
        print("El resultado es $res");
      } else if(opt==0){
        print("Hasta luego!");
      } else{
        print("Número no válido");
      }
    }catch(e){
      print("Escribe un valor numérico");
    }
  }while (opt!=0);
}