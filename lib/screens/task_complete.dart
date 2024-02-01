import 'package:examen_parcial_2/models/task.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ScreenTask extends StatefulWidget{
  const ScreenTask({super.key});
  
  @override
  _ScreenTask createState() => _ScreenTask();
}

class _ScreenTask extends State<ScreenTask>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  void _showDetailsDialog(BuildContext context, Task task) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Tarea"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("ID: ${task.id}"),
                Text("Título: ${task.title}"),
                Text("Descripción: ${task.description}"),
                Text("Completada: ${task.isDone ? 'Sí' : 'No'}"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cerrar"),
            ),
          ],
        );
      },
    );
  }

// void _showDetailsDialog(BuildContext context){
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context){
  //         return AlertDialog(
  //           title: Text("Tarea"),
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: <Widget>[
  //                 Text(data)
  //               ],
  //             ),
  //           ),
  //
  //         );
  //       }
  //   );
  // }
}