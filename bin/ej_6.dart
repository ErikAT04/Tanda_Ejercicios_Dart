import 'dart:io';


void main(List<String> args) async{
  File archivo = File("bin");
  Stream<FileSystemEvent> stream = archivo.watch();
  stream.listen((event){
    if(event.path == "bin\\Prueba.txt"){
      File newFile = File("historialEntradas.txt");
      String state = switch (event.type){
        FileSystemEvent.create => "creado",
        FileSystemEvent.delete => "borrado",
        FileSystemEvent.modify => "modificado",
        FileSystemEvent.move => "movido",
        _ => " ",
      };
      DateTime moment = DateTime.now();
      String fecha = "${moment.day}-${moment.month}-${moment.year}"; //Edito la fecha a mi gusto (DD-MM-YYYY)
      String hora = "${moment.hour}:${moment.minute}:${moment.second}"; //Edito la hora a mi gusto (HH:MM:SS)
      newFile.writeAsString("($fecha - $hora) ${(event.isDirectory)? "Directorio":"Archivo"} ${event.path} $state\n", mode: FileMode.append);
    }
  }, onDone: ()=> print("Finalizado"), onError: (e)=>print("Error $e"));
}