import 'dart:io';


void main(List<String> args) async{ //Función principal
  File archivo = File("bin"); //Guarda el directorio bin en un objeto File
  Stream<FileSystemEvent> stream = archivo.watch(); //Crea un stream con la propiedad watch del archivo
  stream.listen((event){ //Crea el listener
    if(event.path == "bin\\Prueba.txt"){ //Si el archivo editado es Prueba.txt:
      File newFile = File("historialEntradas.txt"); //Abre el archivo HistorialEntradas
      String state = switch (event.type){ //Según el tipo de evento que registra watch, da un estado u otro
        FileSystemEvent.create => "creado",
        FileSystemEvent.delete => "borrado",
        FileSystemEvent.modify => "modificado",
        FileSystemEvent.move => "movido",
        _ => " ",
      };
      DateTime moment = DateTime.now(); //Guardo el momento del listen
      String fecha = "${moment.day}-${moment.month}-${moment.year}"; //Edito la fecha a mi gusto (DD-MM-YYYY)
      String hora = "${moment.hour}:${moment.minute}:${moment.second}"; //Edito la hora a mi gusto (HH:MM:SS)
      newFile.writeAsString("($fecha - $hora) ${(event.isDirectory)? "Directorio":"Archivo"} ${event.path} $state\n", mode: FileMode.append);
    }
  }, onDone: ()=> print("Finalizado"), onError: (e)=>print("Error $e"));
}