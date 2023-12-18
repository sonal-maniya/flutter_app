import 'package:flutter/material.dart';
import 'package:flutter_app/modal/user_modal.dart';

class UserDetailWidget extends StatelessWidget {
  const UserDetailWidget({super.key, required this.userDetail});
  final UserModal userDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              userDetail.name,
            ),
          ),
          Text(
            userDetail.email,
          ),
        ],
      ),
    );
  }
}
