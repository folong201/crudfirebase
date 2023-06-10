import 'package:crudfirebase/model/user.model.dart';
import 'package:crudfirebase/repository/user.repo.dart';
import 'package:flutter/material.dart';

class AddUserPage extends StatelessWidget {

   AddUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final useNameController = TextEditingController();
    final useAgeController = TextEditingController();
    
    return Scaffold(
      // appBar: AppBar(title: Text("Add User")),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: useNameController,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                      labelText: 'name',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40))))),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: useAgeController,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                  decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(40))))),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  final user = User(
                      name: useNameController.text,
                      age: int.parse(useAgeController.text));
                  print("vous voulez enregistrer un utilisateur");
                  print(user);
                  addUser(user);
                  useNameController.text = "";
                  useAgeController.text = '';
                },
                child: Container(
                  width: double.infinity,
                  child: Icon(Icons.add, size: 18),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
