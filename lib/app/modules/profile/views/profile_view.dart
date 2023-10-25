import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/no_data.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: context.theme.textTheme.bodyMedium),
        centerTitle: true,
      ),
      body: const NoData(text: 'This is Profile Screen'),
    );
  }
}
