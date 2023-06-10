import 'package:crudfirebase/model/user.model.dart';
import 'package:crudfirebase/repository/user.repo.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatelessWidget {
  var age;
  var id;
  var name;

  UpdateUser({super.key, this.name, this.age,this.id});

  @override
  Widget build(BuildContext context) {
    final useNameController = TextEditingController();
    final useAgeController = TextEditingController();
    useAgeController.text = age;
    useNameController.text = name;
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
                      id: id,
                      name: useNameController.text,
                      age: int.parse(useAgeController.text));
                  print("vous voulez metre a jour un utilisateur");
                  updateUser(user);
                  Navigator.pop(context, "annuler");
                },
                child: Container(
                  width: double.infinity,
                  child: Icon(Icons.update, size: 30),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
