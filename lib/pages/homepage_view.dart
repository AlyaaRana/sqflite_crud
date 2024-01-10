import 'package:flutter/material.dart';
import 'package:flutter_sql/controller/homepage_controller.dart';
import 'package:flutter_sql/models/user_model.dart';
import 'package:flutter_sql/pages/add_data_view.dart';
import 'package:flutter_sql/pages/edit_data_view.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter CRUD"),
          centerTitle: true,
        ),
        body: FutureBuilder<List<UserModel>>(
          future: controller.getDataUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  UserModel user = snapshot.data![index];
                  return ListTile(
                    title: Text(user.nama!),
                    subtitle: Text(user.email!),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.to(EditDataView(),
                                arguments: [user.id, user.nama, user.email]);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            controller.delete(user.id!);
                            Get.offAll(HomePage());
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Center(child: Text("Tidak Ada Data"));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(AddData());
          },
          child: Icon(Icons.add),
        ));
  }
}