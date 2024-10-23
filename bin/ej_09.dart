import 'package:logger/logger.dart'; //Paquete Logger

void initTask(){
  Logger().i("Tarea iniciada correctamente"); //Manda un log de información
}
void modifyTask(){
  Logger().w("Tarea modificada"); //Manda un log de aviso
}
void deleteTask(){
  Logger().e("Tarea eliminada"); //Manda un log de error
}

void main(){
  initTask();
  modifyTask();
  deleteTask();
}