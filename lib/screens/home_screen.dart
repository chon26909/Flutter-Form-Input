import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  var gender = '';

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
              buildRadio(),
              ElevatedButton(
                onPressed: () {
                  print(
                      'Name: ${nameController.text} ${surnameController.text}');
                },
                child: const Text("บันทึก"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRadio() => Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const RadioListTile(
            title: Text('ชาย'),
            value: 'male',
            groupValue: 'male',
            onChanged: null,
          ),
          const RadioListTile(
            title: Text('หญิง'),
            value: 'female',
            groupValue: 'male',
            onChanged: null,
          ),
        ],
      );

  Widget buildTextField() => Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "ชื่อ",
            ),
            maxLength: 50,
            keyboardType: TextInputType.name,
            controller: nameController,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "นามสกุล",
            ),
            maxLength: 50,
            keyboardType: TextInputType.name,
            controller: surnameController,
          ),
        ],
      );
}
