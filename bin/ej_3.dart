void main(){ //Función principal
  Map<String, int> personas = {"Pedro":15, "Manuel":40, "Jose":23}; //Guarda un mapa con información de las personas
  print("La edad media del mapa es ${edadMedia(personas)}");
  print("La edad más alta es ${edadMaxima(personas)}");
  print("La edad más baja es ${edadMinima(personas)}");
}
int edadMedia(Map<String, int> map){ //Función que devuelve la media de las edades:
  int media = 0; //Inicia un entero que guarda la media
  int contador = 0; //Inicia un entero que guarda la cantidad de veces que se recorre el bucle
  for(int edad in map.values){
    media += edad; //Se suma la edad de la instancia a la media
    contador++; //Se suma al contador una más
  }
  media = (media/contador) as int; //Para obtener la media, se divide la suma de las edades entre el total de personas del mapa
  return media; //Devuelve la media
}
int edadMaxima(Map<String, int> map){ //Función que devuelve la edad más alta
  int maximo = map.values.first; //Coge el primer valor del mapa y lo llama máximo
  for(int edad in map.values){ //Recorre todas las edades
    if (edad>maximo){ //Si alguna es mayor que el actual máximo, el máximo pasa a ser la nueva edad
      maximo = edad;
    }
  }
  return maximo; //Devuelve el máximo
}
int edadMinima(Map<String, int> map){ //Función que devuelve la edad más baja
  int minimo = map.values.first; //Coge el primer valor del mapa y lo guarda en mínimo
  for(int edad in map.values){ //Recorre todas las edades
    if(edad<minimo){ //Si alguna edad es menor que la marcada como mínima, se convierte en la nueva mínima
      minimo = edad;
    }
  }
  return minimo; //Devuelve el mínimo
}