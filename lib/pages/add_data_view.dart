import 'package:flutter/material.dart';
import 'package:flutter_sql/controller/add_data_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_sql/controller/add_data_controller.dart';

class AddData extends StatelessWidget {
  AddData({super.key});
  final controller = Get.put(AddDataController());

  @override
  Widget build(BuildContext context) {
    Widget textInput(String label, String hint, TextEditingController textEditingController) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Create Data"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            textInput("Nama", "Masukkan Nama", controller.nameTextController),
            textInput("Email", "Masukkan Email", controller.emailTextController),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.insert();
                },
                child: Text("Simpan data"))
          ],
        ));
  }
}