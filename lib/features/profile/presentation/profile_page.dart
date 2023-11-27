import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';
import 'package:flutter_app/features/login/presentation/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({super.key});

  Future<void> onLogout(context) async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove(AppConstants.keyIsLoggedIn);
    await pref.remove(AppConstants.keyLoginUsername);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainPageWidget()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 231, 227, 227),
                      radius: 45,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/img_user.jpg"),
                        radius: 40,
                      ),
                    ),
                    _buildPostCount(50, 'Post'),
                    _buildPostCount(645, 'Followers'),
                    _buildPostCount(523, 'Following'),
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size.fromHeight(40),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              _buildHighlight(),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.grey),
                ),
                onPressed: () => onLogout(context),
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.redAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHighlight() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          20,
          (index) => _buildHightContainer(isAdd: index == 0 ? true : false),
        ),
      ),
    );
  }

  Widget _buildHightContainer({bool isAdd = false}) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 231, 227, 227),
          radius: 40,
          child: CircleAvatar(
            backgroundColor: Colors.grey[100],
            backgroundImage:
                !isAdd ? const AssetImage("assets/images/img_user.jpg") : null,
            radius: 35,
            child: isAdd
                ? const Icon(
                    Icons.add,
                    color: Colors.black,
                    size: 35,
                  )
                : null,
          ),
        ),
        const SizedBox(height: 5),
        Text(isAdd ? "New" : "Friends"),
      ],
    );
  }

  Widget _buildPostCount(int count, String countType) {
    return Column(
      children: [
        Text(
          '$count',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
        ),
        Text(countType),
      ],
    );
  }
}
