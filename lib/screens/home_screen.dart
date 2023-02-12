import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  var gender = 'male';

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
                  print('gender ${gender}');
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
          RadioListTile(
            title: const Text('ชาย'),
            value: 'male',
            groupValue: gender,
            onChanged: (value) => setState(() => gender = value.toString()),
          ),
          RadioListTile(
            title: const Text('หญิง'),
            value: 'female',
            groupValue: gender,
            onChanged: (value) => setState(() => gender = value.toString()),
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
