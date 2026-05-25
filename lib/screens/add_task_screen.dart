import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskGroup = TextEditingController();
  final taskDesc = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    taskGroup.dispose();
    taskDesc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),

      body: Padding(
        padding: const EdgeInsets.all(20.0),

        child: Column(
          children: [
            TextFormField(
              controller: taskGroup,
              decoration: InputDecoration(
                labelText: "Task Group",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              maxLines: 5,
              controller: taskDesc,
              decoration: InputDecoration(
                labelText: "Description",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),

                onPressed: () {
                  Navigator.pop(context, {
                    'taskGroup': taskGroup.text,
                    'taskDesc': taskDesc.text,

                  });
                },

                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
