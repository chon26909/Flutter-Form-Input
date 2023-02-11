import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final nameController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ลงทะเบียน")),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              buildTextField(),
              ElevatedButton(
                onPressed: () {
                  print('Name: ${nameController.text}');
                },
                child: const Text("บันทึก"),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextField buildTextField() => TextField(
        decoration: const InputDecoration(
          labelText: "ชื่อ",
        ),
        maxLength: 50,
        keyboardType: TextInputType.name,
        controller: nameController,
      );
}
