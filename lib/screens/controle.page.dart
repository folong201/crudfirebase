import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crudfirebase/screens/search.dart';
import 'package:crudfirebase/screens/users.add.dart';
import 'package:crudfirebase/screens/all.user.dart';
import 'package:flutter/material.dart';

import '../model/user.model.dart';

class ControlePage extends StatelessWidget {
  const ControlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(title: Text("Gestion des Utilisateurs"),
          bottom: TabBar(tabs: [
            Tab(
              icon: Icon(Icons.supervised_user_circle_sharp, size: 28),
              text: "add",
            ),
            Tab(
              icon: Icon(Icons.edit, size: 28),
              text: "Edit",
            ),
            Tab(
              icon: Icon(Icons.search, size: 28),
              text: "Search",
            ),
          ])
          ),
          body:TabBarView(children: [
            Center(child: AddUserPage()),
            // Center(child: _AllUsers()),
            AllUsers(),
            Center(child: StreamBuilder<QuerySnapshot>(
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
                    var allUsers = snapshot.data!.docs
                        .map((doc) =>
                            User.FromJon(doc.data() as Map<String, dynamic>).name)
                        .toList();

                    return Search(kOptions: allUsers);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ))
          ])
        ));
  }
}
