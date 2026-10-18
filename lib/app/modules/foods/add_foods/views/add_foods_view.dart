import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_foods_controller.dart';

class AddFoodsView extends GetView<AddFoodsController> {
  const AddFoodsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddFoodsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddFoodsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
