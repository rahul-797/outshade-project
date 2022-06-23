import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:outshade_project/views/user_details_view.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final box = GetStorage();

  late String age;
  late String gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Text(
                  "Enter details",
                  style: TextStyle(fontSize: 24, color: Colors.black87),
                ),
              ),
              SizedBox(height: 80),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Enter age"),
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter age';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    age = value!;
                    box.write("age", age);
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Enter gender"),
                  keyboardType: TextInputType.text,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter gender';
                    }
                    return null;
                  },
                  onChanged: (String? value) {
                    gender = value!;
                    box.write("gender", gender);
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                child: ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      Get.offAll(() => UserDetailsView());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
