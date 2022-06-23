import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:outshade_project/models/user_model.dart';
import 'package:outshade_project/services/api_service.dart';
import 'package:outshade_project/services/auth_service.dart';
import 'package:outshade_project/views/form_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final apiService = ApiService();
  final authService = AuthService();
  List<UserModel> users = [];
  final box = GetStorage();

  getUsers() async {
    users = await apiService.compileJson();
  }

  @override
  void initState() {
    super.initState();
    getUsers();
    Future.delayed(Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: users.isEmpty || users.length == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    users[index].id,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    users[index].name,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: ElevatedButton(
                                child: Text("Sign in"),
                                onPressed: () {
                                  box.write("name", users[index].name);
                                  authService.signInAnon();
                                  Get.offAll(() => FormView());
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
