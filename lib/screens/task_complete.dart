import 'package:examen_parcial_2/models/task.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

import '../providers/task_provider.dart';

class ScreenTask extends StatefulWidget{
  const ScreenTask({super.key});

  @override
  _ScreenTask createState() => _ScreenTask();
}

class _ScreenTask extends State<ScreenTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Tarea'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Crear Nueva Tarea',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título de la Tarea'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Descripción de la Tarea'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Aquí puedes agregar la lógica para guardar la nueva tarea
                final title = titleController.text;
                final description = descriptionController.text;
                if (title.isNotEmpty && description.isNotEmpty) {
                  final taskProvider = Provider.of<TaskProvider>(context, listen: false);
                  taskProvider.addTask(Task(
                    id: DateTime.now().toString(),
                    title: title,
                    description: description,
                  ));
                  // Cierra la pantalla de detalles después de agregar la tarea
                  Navigator.of(context).pop();
                }
              },
              child: Text('Guardar Tarea'),
            ),
          ],
        ),
      ),
    );
  }

// Resto del código del _ScreenTask, incluyendo el método _showDetailsDialog
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
