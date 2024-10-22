import 'dart:io';
import 'package:http/http.dart' as http; //As da un nombre al paquete
void main(List<String> args) async{
  var url= Uri.https("img.freepik.com", "fotos-premium/hombre-dando-pulgar-arriba-pulgar-arriba_662214-43774.jpg");
  Future<http.Response> futureresponse = http.get(url);
  await Future.delayed(Duration(seconds: 3));
  var response = await futureresponse;
  if (response.statusCode==200){
    File file = File("Prueba.png");
    file.writeAsBytesSync(response.bodyBytes);
  }
}