import 'package:flutter/material.dart';
import 'add_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final List<Widget> taskCards = [
    TaskCard(
      id: "01",
      title: "Market Research",
      time: "10:00 AM",
      status: "Done",
      color: Colors.green,
    ),

    TaskCard(
      id: "02",
      title: "Competitive Analysis",
      time: "12:00 PM",
      status: "In Progress",
      color: Colors.orange,
    ),

    TaskCard(
      id: "03",
      title: "Create Wireframe",
      time: "07:00 PM",
      status: "To-Do",
      color: Colors.deepPurple,
    ),

    TaskCard(
      id: "04",
      title: "Design Sprint",
      time: "09:00 PM",
      status: "To-Do",
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        centerTitle: true,
        elevation: 1,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),

        child: ListView(children: [...taskCards]),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),

        onPressed: () => _taskData(context),
      ),
    );
  }

  Future<void> _taskData(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskScreen()),
    );

    if (result != null) {
      print("Data received: $result");
      print(result.runtimeType);
      taskCards.add(
        TaskCard(
          id: (taskCards.length + 1).toString(),
          title: result["taskDesc"],
          time: TimeOfDay.now().format(context).toString(),
          status: result["taskGroup"],
          color: result["color"],
        ),
      );
      setState(() {});
    }
  }
}

class TaskCard extends StatelessWidget {
  final String id;
  final String title;
  final String time;
  final String status;
  final Color color;
  // TODO: implement build
  TaskCard({
    super.key,
    required this.id,
    required this.title,
    required this.time,
    required this.status,
    required this.color,
  });
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text("ID: $id", style: const TextStyle(color: Colors.grey)),

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
                      style: const TextStyle(color: Colors.deepPurple),
                    ),
                  ],
                ),
              ],
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),

              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
              ),

              child: Text(
                status,
                style: TextStyle(color: color, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
