import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() async{
  var url = Uri.https("pokeapi.co", "api/v2/pokemon/");
  print("Espera unos segundos a que cargue el enlace");
  var body = await getData(url);
  if (body != "noBody"){
    print("Api cargada correctamente");
    var jsonResp = convert.jsonDecode(body) as Map<String, dynamic>;
    for(String item in jsonResp.keys){
      print("$item : ${jsonResp[item]}");
    }
  } else {
    print("Error de API");
  }
}

Future<String> getData(Uri url) async{
  var response = await http.get(url);
  if (response.statusCode == 200){
    return response.body;
  } else {
    return "noBody";
  }
}
