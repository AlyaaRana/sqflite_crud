import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_sql/models/user_model.dart';
import 'package:flutter_sql/pages/homepage_view.dart';

class AddDataController extends GetxController {
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController emailTextController = TextEditingController();
  late Database? database;

  void insert() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "db_user";
    database = await openDatabase(path);

    UserModel user = UserModel(
      nama: nameTextController.text,
      email: emailTextController.text,
    );
    final data = await database!.insert('user', user.toJson());
    Get.offAll(HomePage());
  }
}