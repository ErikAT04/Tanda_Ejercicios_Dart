import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

main() async{
  double media = 0; //Inicio una variable de media
  File file = File("Estudiantes.csv"); //Cojo el archivo Estudiantes.csv del directorio
  var input = file.readAsStringSync(); //Guardo el contenido del archivo como String
  List<List<dynamic>> csvRes = CsvToListConverter(fieldDelimiter: ";").convert(input); //Convierto el String en una lista de listas delimitada por ;
  for(var line in csvRes){ //Recorro todas las lineas que haya
    media += (line[2] as double); //Suma la media
  }
  media = media/csvRes.length; //La media es el total de las notas entre la cantidad de líneas leídas

  List<List> resFinal = [["Nota media", media.roundToDouble()]]; //Creo otra lista de listas
  File newFile = File("Media.csv"); //Creo un archivo csv nuevo
  newFile.writeAsString(ListToCsvConverter(fieldDelimiter: ";").convert(resFinal)); //Convierto la lista de listas en un String delimitado por ; y lo subo al csv
}