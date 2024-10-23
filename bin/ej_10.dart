import 'dart:io';
import 'package:pdf/widgets.dart' as PdfWidget; //Paquete de edición de PDFs

void main() async{
  print("Escribe el nombre que quieras poner");
  String nombre = stdin.readLineSync()!; //Guarda el nombre
  print("Escribe ahora el apellido");
  String apellido = stdin.readLineSync()!; //Guarda el apellido
  print("Escribe un email");
  String email = stdin.readLineSync()!; //Guarda el email
  print("Escribe una dirección");
  String direc = stdin.readLineSync()!; //Guarda la dirección
  var pdf = PdfWidget.Document(); //Crea un nuevo pdf
  pdf.addPage(PdfWidget.Page(build: (PdfWidget.Context context){ //Añade una página y le añade Context (contenido del pdf)
    //En esa página, mete el siguiente String en formato de texto plano
    return PdfWidget.Text("Nombre: $nombre\nApellido: $apellido\nEmail: $email\nDirección: $direc");
  })); //Fin de edición de la página
  File file = new File("$nombre-$apellido-${DateTime.now().day}.pdf"); //Crea un archivo pdf
  file.writeAsBytesSync(await pdf.save()); //Guarda la información e introduce el pdf como bytes en el archivo nuevo
  print("Escrito correctamente");
}