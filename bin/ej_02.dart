import 'dart:io';

class Calculadora{ //Clase de tipo calculadora
  int Suma(num1, num2){ //Función que devuelve la suma de dos variables
    return num1+num2;
  }
  int Resta(num1, num2){ //Función que devuelve la resta de dos variables
    return num1-num2;
  }
  int Multiplicacion(num1, num2){ //Función que devuelve la multiplicación de dos variables
    return num1*num2;
  }
  int Division(num1, num2){ //Función que devuelve la división de dos variables
    return num1/num2;
  }
}

void main(){
  int opt=-1; //Se inicia la opción a -1 para evitar que se salga del bucle en caso de haber un error
  Calculadora calc = Calculadora(); //Se crea un objeto de tipo calculadora
  do{ //Inicio de bucle
    try{
      print("Elige una opción:\n1.Sumar\n2.Restar\n3.Multiplicar\n4.Dividir\n0.Salir");
      opt = int.parse(stdin.readLineSync()!); //Lee la opción del usuario por teclado
      if(1<=opt && opt<=4){ //Si la opción es entre 1 y 4 (Las opciones de los cálculos):
        print("Escribe el primer número");
        int num1 = int.parse(stdin.readLineSync()!); //Guarda el primer número
        print("Escribe el segundo número");
        int num2 = int.parse(stdin.readLineSync()!); //Guarda el segundo número
        int res = switch(opt){ //Dependiendo de la opción elegida, devuelve x resultado
          1 => calc.Suma(num1, num2), //Si la opcion es sumar, devuelve la suma
          2 => calc.Resta(num1, num2), //Si la opcion es restar, devuelve la resta
          3 => calc.Multiplicacion(num1, num2), //Si la opcion es multiplicar, devuelve la multiplicación
          4 => calc.Division(num1, num2), //Si la opcion es dividir, devuelve la división
          _ => throw UnimplementedError() //Si no es ninguna de las anteriores (No se puede dar el caso), salta una excepcion
        };
        print("El resultado es $res"); //Escribe el resultado
      } else if(opt==0){ //Si la opción es 0, se sale del programa
        print("Hasta luego!");
      } else{ //Si el usuario mete cualquier otro número:
        print("Número no válido");
      }
    }catch(e){ //Control de excepciones: El usuario ha metido mal un valor
      print("Escribe un valor numérico");
      opt = -1; //Para evitar problemas con el bucle, se convierte la opción a -1
    }
  }while (opt!=0);
}