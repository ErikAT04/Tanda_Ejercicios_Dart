void main(){
  Map<String, int> personas = {"Pedro":15, "Manuel":40, "Jose":23};
  print("La edad media del mapa es ${edadMedia(personas)}");
  print("La edad más alta es ${edadMaxima(personas)}");
  print("La edad más baja es ${edadMinima(personas)}");
}
int edadMedia(Map<String, int> map){
  int media = 0;
  int contador = 0;
  for(int edad in map.values){
    media += edad;
    contador++;
  }
  media = (media/contador) as int;
  return media;
}
int edadMaxima(Map<String, int> map){
  int maximo = map.values.first;
  for(int edad in map.values){
    if (edad>maximo){
      maximo = edad;
    }
  }
  return maximo;
}
int edadMinima(Map<String, int> map){
  int minimo = map.values.first;
  for(int edad in map.values){
    if(edad<minimo){
      minimo = edad;
    }
  }
  return minimo;
}