import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';

main() async{
  double media = 0;
  File file = File("Estudiantes.csv");
  var input = file.readAsStringSync();
  List<List<dynamic>> csvRes = CsvToListConverter(fieldDelimiter: ";").convert(input);
  for(var line in csvRes){
    media += (line[2] as double);
  }
  media = media/csvRes.length;

  List<List> resFinal = [["Nota media", media.roundToDouble()]];
  File newFile = File("Media.csv");
  newFile.writeAsString(ListToCsvConverter(fieldDelimiter: ";").convert(resFinal));
}