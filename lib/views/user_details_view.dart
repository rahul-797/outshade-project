import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:outshade_project/services/auth_service.dart';
import 'package:outshade_project/views/home_view.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();

    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Name: ${box.read("name")}",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                "Age: ${box.read("age")}",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 24),
            Center(
              child: Text(
                "Gender: ${box.read("gender")}",
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 80),
            Center(
              child: ElevatedButton(
                child: Text("Sign out"),
                onPressed: () async {
                  box.erase();
                  await AuthService().signout();
                  Get.offAll(() => HomeView());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
