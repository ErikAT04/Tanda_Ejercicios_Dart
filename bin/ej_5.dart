import 'dart:convert' as convert; //Paquete de conversión de datos (JSON en este caso)
import 'package:http/http.dart' as http; //Paquete de requests de HTTP

void main() async{
  var url = Uri.https("pokeapi.co", "api/v2/pokemon/"); //Guarda un url de http: la primera parte es el dominio y la segunda es la dirección
  print("Espera unos segundos a que cargue el enlace");
  var body = await getData(url); //El programa espera a que termine de buscar datos
  if (body != "noBody"){ //Si tiene cuerpo guardado (Se ha cargado bien:)
    print("Api cargada correctamente");
    var jsonResp = convert.jsonDecode(body) as Map<String, dynamic>; //Convierte la API a un mapa
    for(String item in jsonResp.keys){ //Por cada key del mapa:
      print("$item : ${jsonResp[item]}"); //Imprime el mapa entero
    }
  } else { //Si no recibe un cuerpo de la API:
    print("Error de API");
  }
}

Future<String> getData(Uri url) async{ //Función que recibe una url y devuelve el cuerpo del API
  var response = await http.get(url); //Busca la url pasada
  if (response.statusCode == 200){ //Si el statusCode es 200 (Conexión realizada correctamente)
    return response.body; //Devuelve el body de la búsqueda
  } else { //Si no, devuelve simplemente noBody
    return "noBody";
  }
}
