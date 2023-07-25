import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategoryView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CategoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
