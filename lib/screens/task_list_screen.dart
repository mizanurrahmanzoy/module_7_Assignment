import 'package:flutter/material.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),

        child: ListView(
          children: [

            taskCard(
              id: "01",
              title: "Market Research",
              time: "10:00 AM",
              status: "Done",
              color: Colors.green,
            ),

            taskCard(
              id: "02",
              title: "Competitive Analysis",
              time: "12:00 PM",
              status: "In Progress",
              color: Colors.orange,
            ),

            taskCard(
              id: "03",
              title: "Create Wireframe",
              time: "07:00 PM",
              status: "To-Do",
              color: Colors.deepPurple,
            ),

            taskCard(
              id: "04",
              title: "Design Sprint",
              time: "09:00 PM",
              status: "To-Do",
              color: Colors.blue,
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },
      ),
    );
  }

  Widget taskCard({
    required String id,
    required String title,
    required String time,
    required String status,
    required Color color,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),

      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Text(
                  "ID: $id",
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [

                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Colors.deepPurple,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                )
              ],
            ),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),

              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                status,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}