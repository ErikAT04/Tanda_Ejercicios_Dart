import 'dart:io';
import 'package:http/http.dart' as http; //As da un nombre al paquete
void main(List<String> args) async{
  //Creo una url de https (primer string es el dominio y el segundo es la ubicación de lo que quiero)
  var url= Uri.https("img.freepik.com", "fotos-premium/hombre-dando-pulgar-arriba-pulgar-arriba_662214-43774.jpg");
  Future<http.Response> futureresponse = http.get(url); //Guardo la futura respuesta
  await Future.delayed(Duration(seconds: 3)); //Espero 3 segundos
  var response = await futureresponse; //Llamo a la futura respuesta y guardo el http.get() en una variable
  if (response.statusCode==200){ //Si la respuesta es correcta (codigo 200)
    File file = File("Prueba.png"); //Creo un nuevo archivo
    file.writeAsBytesSync(response.bodyBytes); //Todo lo recibido en el body en bytes pasa al archivo como bytes
    /*
    EXPLICACION DE POR QUÉ DE LOS BYTES:
    Los archivos se pueden desestructurar en binario, en grupos de bytes. Esto guarda toda su información
    Para pasar una imágen de web a archivo, cojo todos los bytes de la imagen y las pongo en un nuevo archivo png
    */
  }
}