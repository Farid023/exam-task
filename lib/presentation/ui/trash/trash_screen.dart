import 'package:e_commerce_task/presentation/ui/trash/trash_view.dart';
import 'package:flutter/material.dart';

class TrashScreen extends StatelessWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trash"),
      ),
      body: const TrashView(),
    );
  }
}
