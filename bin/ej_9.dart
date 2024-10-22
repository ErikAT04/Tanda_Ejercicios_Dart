import 'package:logger/logger.dart';

void initTask(){
  Logger().i("Tarea iniciada correctamente");
}
void modifyTask(){
  Logger().w("Tarea modificada");
}
void deleteTask(){
  Logger().e("Tarea eliminada");
}

void main(){
  initTask();
  modifyTask();
  deleteTask();
}