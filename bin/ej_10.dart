import 'dart:io';
import 'package:pdf/widgets.dart' as PdfWidget;

void main() async{
  print("Escribe el nombre que quieras poner");
  String nombre = stdin.readLineSync()!;
  print("Escribe ahora el apellido");
  String apellido = stdin.readLineSync()!;
  print("Escribe un email");
  String email = stdin.readLineSync()!;
  print("Escribe una dirección");
  String direc = stdin.readLineSync()!;
  var pdf = PdfWidget.Document();
  pdf.addPage(PdfWidget.Page(build: (PdfWidget.Context context){
    return PdfWidget.Text("Nombre: $nombre\nApellido: $apellido\nEmail: $email\nDirección: $direc");
  }));
  File file = new File("$nombre-$apellido-${DateTime.now().day}.pdf");
  file.writeAsBytesSync(await pdf.save());
  print("Escrito correctamente");
}