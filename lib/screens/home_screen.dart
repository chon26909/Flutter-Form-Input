import 'package:flutter/material.dart';
import 'package:form_input/widgets/checkbox_form_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  var gender = 'male';
  var newsletter = false;
  var driver = false;
  var married = false;
  var child = false;
  var age = 0.0;
  var channels = ['Facebook', 'Twitter', 'Instagram', 'Line']
      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
      .toList();
  var channel = 'Facebook';

  final formKey = GlobalKey<FormState>();
  var email = '';
  var agreement = false;

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
              buildCheckbox(),
              buildSwitch(),
              buildSlider(),
              buildDropdown(),
              buldForm(),
              ElevatedButton(
                onPressed: () {
                  if (!(formKey.currentState?.validate() ?? false)) return;

                  formKey.currentState?.save();
                  print(
                      'Name: ${nameController.text} ${surnameController.text}');
                  print('gender ${gender}');
                  print("newsletter ${newsletter}");
                  print("driver ${driver}");
                  print("married ${married}");
                  print("child ${child}");
                  print("age ${age}");
                  print("chanel ${channel}");
                  print("email ${email}");
                  print("agreemnt ${agreement}");
                },
                child: const Text("บันทึก"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buldForm() => Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: "อีเมล",
            ),
            maxLength: 50,
            keyboardType: TextInputType.emailAddress,
            onSaved: (value) => email = value ?? "",
            validator: (value) {
              value ??= "";
              if (value.isEmpty) return "กรุณากรอกข้อมูล";
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                return 'อีเมลไม่ถูกต้อง';
              }
              return null;
            },
          ),
          CheckboxFormField(
            title: const Text("ยอมรับข้อตกลง"),
            initialValue: agreement,
            onSaved: (value) => agreement = value ?? false,
            validator: (value) {
              value ??= false;
              if (!value) {
                return 'กรุณายอมรับข้อตกลง';
              }

              return null;
            },
          )
        ],
      ));

  Widget buildDropdown() => DropdownButton(
        value: channel,
        items: channels,
        onChanged: (value) => setState(() => channel = value.toString()),
      );

  Widget buildSlider() => Slider(
        value: age,
        min: 0.0,
        max: 100.0,
        label: age.round().toString(),
        divisions: 100,
        onChanged: (value) => setState(() => age = value),
      );

  Widget buildSwitch() => Column(
        children: [
          SwitchListTile(
            title: const Text("แต่งงาน"),
            value: married,
            onChanged: (value) => setState(() => married = value),
          ),
          SwitchListTile(
            title: const Text("มีบุตร"),
            value: child,
            onChanged: (value) => setState(() => child = value),
          )
        ],
      );

  Widget buildCheckbox() => Column(
        children: [
          CheckboxListTile(
            title: const Text("สมัครรับจดหมายข่าว"),
            value: newsletter,
            onChanged: (value) => setState(() => newsletter = value ?? false),
          ),
          CheckboxListTile(
            title: const Text("มีใบขับขี่รถยนต์"),
            value: driver,
            onChanged: (value) => setState(() => driver = value ?? false),
          )
        ],
      );

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
