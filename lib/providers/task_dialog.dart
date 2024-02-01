import 'package:examen_parcial_2/providers/task_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:examen_parcial_2/models/task.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class TaskDialog extends StatefulWidget {
  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Nueva Tarea'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Título'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(labelText: 'Descripción'),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            final title = titleController.text;
            final description = descriptionController.text;
            if (title.isNotEmpty && description.isNotEmpty) {
              final taskProvider = Provider.of<TaskProvider>(context, listen: false);
              taskProvider.addTask(Task(
                id: DateTime.now().toString(),
                title: title,
                description: description,
              ));
              Navigator.of(context).pop();
            }
          },
          child: Text('Guardar'),
        ),
      ],
    );
  }
}