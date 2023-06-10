import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirebase/model/user.model.dart';
import 'package:crudfirebase/repository/user.repo.dart';
import 'package:crudfirebase/screens/update.dart';
import 'package:crudfirebase/screens/users.add.dart';
import 'package:flutter/material.dart';

class AllUsers extends StatefulWidget {
  const AllUsers({super.key});

  @override
  State<AllUsers> createState() => AllUsersState();
}

class AllUsersState extends State<AllUsers> {
  @override
  Widget build(BuildContext context) {
    List<User> allUsers = [];
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
         stream: FirebaseFirestore.instance
          .collection("users")
          .orderBy('name')
          .snapshots(),
          builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container(
            child: Center(
                child: Text(
              "une erreur s'est produite lors de la lecture des donnes",
              maxLines: 2,
            )),
          );
        }
        if (snapshot.hasData) {
          allUsers = snapshot.data!.docs
              .map((doc) => User.FromJon(doc.data() as Map<String, dynamic>))
              .toList();

          return ListView.builder(
              itemCount: allUsers.length,
              itemBuilder: (context, index) {
                var age = allUsers[index].age.toString().toUpperCase();
                var name = allUsers[index].name.toString().toUpperCase();
                var id = allUsers[index].id;
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.amber,
                      child: Text(
                          allUsers[index].name.substring(0, 2).toUpperCase()),
                    ),
                    title: Text(name),
                    subtitle: Text("Age : $age"),
                    trailing: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          TextButton(
                            onPressed: (() {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("update $name"),
                                        content: Container(
                                          child: UpdateUser(
                                            name: name,
                                            age: age,
                                            id: id,
                                          ),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(
                                                    context, "annuler");
                                              },
                                              child: Text("annuler"))
                                        ],
                                      ));
                              // Navigator.pop(context, "annuler");
                            }),
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: Text("Delete $name"),
                                          content: Container(
                                              child: Center(
                                            child: Text(
                                                "coulez vous vraiment supreimer $name ?"),
                                          )),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  DeleteUser(id);
                                                  Navigator.pop(context, "oui");
                                                },
                                                child: Text("OUI")),
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context, "nom");
                                                },
                                                child: Text("Nom"))
                                          ],
                                        ));
                              },
                              child: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  ),
                );
                // return Text(allUsers[index].name);
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
