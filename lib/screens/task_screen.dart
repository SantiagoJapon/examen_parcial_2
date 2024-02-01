// lib/screens/task_screen.dart
import 'package:flutter/material.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';
import 'package:provider/provider.dart';
import 'package:examen_parcial_2/screens/task_complete.dart';

import 'package:examen_parcial_2/providers/task_provider.dart';


class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Envuelve la parte de tu UI que depende del TaskProvider con un Consumer<TaskProvider>
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: Consumer<TaskProvider>(
        // El builder se vuelve a ejecutar cada vez que el TaskProvider llama a notifyListeners()
        builder: (context, taskProvider, child) {
          return ListView.builder(
            itemCount: taskProvider.tasks.length,
            itemBuilder: (context, index) {
              Task task = taskProvider.tasks[index];
              return ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => taskProvider.deleteTask(task.id),
                ),
                // Puedes usar un gesto para marcar la tarea como completada o no.
                onTap: () => taskProvider.toggleTaskDone(task.id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (BuildContext context){
            return AlertDialog(
              content: ScreenTask(),
            );
          });
          // Elimina Navigator.of(context).pop();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
