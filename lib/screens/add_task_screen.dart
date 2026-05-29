import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  AddTaskScreen();

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final taskGroup = TextEditingController();
  final taskDesc = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // Choice Chip list
  final Map<String, Color> group = {
    "Done": Colors.green,
    "In Progress": Colors.orange,
    "To-Do": Colors.deepPurple,
  };
  String selectedValue = '';

  @override
  void dispose() {
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

        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Wrap(
                spacing: 10,
                children: group.entries.map((item) {
                  return ChoiceChip(
                    label: Text(item.key),
                    backgroundColor: item.value.withAlpha(150),
                    selectedColor: item.value,
                    labelStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    checkmarkColor: Colors.white,
                    selected: selectedValue == item.key,
                    onSelected: (selected) {
                      setState(() {
                        selectedValue = selected ? item.key : '';
                        taskGroup.text = selected ? item.key : '';
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextFormField(
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter some text";
                  }
                  return null;
                },
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
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context, {
                        'taskGroup': taskGroup.text,
                        'taskDesc': taskDesc.text,
                        Color: group[selectedValue],
                      });
                    }
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
      ),
    );
  }
}
