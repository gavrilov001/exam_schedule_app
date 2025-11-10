import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  final String studentIndex = "191211";

  ExamListScreen({super.key});

  final List<Exam> exams = [
    // 🔵 Идни испити
    Exam(subjectName: "Програмирање 1", dateTime: DateTime(2025, 12, 22, 12, 0), rooms: ["Барака 1"]),
    Exam(subjectName: "Физика 1", dateTime: DateTime(2025, 12, 25, 10, 30), rooms: ["Л12"]),
    Exam(subjectName: "Математика 2", dateTime: DateTime(2025, 11, 25, 9, 0), rooms: ["Барака 2"]),
    Exam(subjectName: "Програмирање 2", dateTime: DateTime(2025, 11, 15, 13, 0), rooms: ["ЛАБ 128"]),
    Exam(subjectName: "Алгоритми", dateTime: DateTime(2025, 11, 20, 9, 0), rooms: ["ЛАБ АБ"]),

    // ⚪ Веќе одржани испити
    Exam(subjectName: "Математика 1", dateTime: DateTime(2024, 12, 20, 9, 0), rooms: ["Л2", "Л3"]),
    Exam(subjectName: "Електротехника", dateTime: DateTime(2024, 11, 25, 10, 30), rooms: ["ЛАБ 128"]),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime(2024, 10, 15, 10, 0), rooms: ["Барака 1"]),
    Exam(subjectName: "Компјутерски мрежи", dateTime: DateTime(2024, 9, 10, 9, 30), rooms: ["Барака 2"]),
    Exam(subjectName: "Оперативни системи", dateTime: DateTime(2024, 8, 30, 11, 0), rooms: ["ЛАБ 215"]),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $studentIndex'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100), // ова е клучно
        itemCount: exams.length,
        itemBuilder: (context, index) => ExamCard(exam: exams[index]),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.list_alt, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              "Вкупно испити: ${exams.length}",
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
