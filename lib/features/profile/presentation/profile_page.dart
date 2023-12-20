import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';
import 'package:flutter_app/features/login/presentation/main_page.dart';
import 'package:flutter_app/features/profile/presentation/widgets/drawer_page.dart';
import 'package:flutter_app/features/profile/presentation/widgets/post_list_page.dart';
import 'package:flutter_app/stateManagement/provider/login_provider.dart';
import 'package:flutter_app/stateManagement/provider/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageWidget extends ConsumerStatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  ConsumerState<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends ConsumerState<ProfilePageWidget> {
  File? profileImage;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imgTmp = File(image.path);
      setState(() {
        profileImage = imgTmp;
      });
    } catch (e) {}
  }

  Future<void> onLogout(context) async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove(AppConstants.keyIsLoggedIn);
    await pref.remove(AppConstants.keyLoginUsername);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainPageWidget()),
        (route) => false);
  }

  void openDrawer() {
    _scaffoldKey.currentState?.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const DrawerWidget(),
      body: SafeArea(
        child: Column(
          children: [
            _buildMainBar(),
            _buildHeader(),
            const Divider(),
            _buildEditButton(),
            _buildHighlight(),
            const Divider(),
            const ProfilePostGridWidget(),
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
    );
  }

  Widget _buildMainBar() {
    final theme = ref.watch(themeProvider);
    // final loginProvider = Provider.of<LoginProvider>(context);
    var isDark = theme == MyThemeType.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Spacer(),
          const SizedBox(
            width: 30,
          ),
          const Icon(
            Icons.lock,
            size: 15,
          ),
          // Consumer(builder: (context, value, child) {
          //   return Text(" ${loginProvider.userName} ");
          // }),
          const Icon(
            Icons.arrow_drop_down_outlined,
            size: 25,
          ),
          const Spacer(),
          Row(
            children: [
              const Text("Dark Theme"),
              Switch(
                value: isDark,
                onChanged: (value) {
                  ref
                      .read(themeProvider.notifier)
                      .setTheme(isDark ? MyThemeType.light : MyThemeType.dark);
                },
              ),
            ],
          ),
          IconButton(
            onPressed: () => openDrawer(),
            icon: const Icon(
              Icons.list_sharp,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEditButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(40),
        ),
        onPressed: () {
          pickImage();
        },
        child: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 231, 227, 227),
            radius: 45,
            child: CircleAvatar(
              radius: 40,
              child: ClipOval(
                child: SizedBox(
                  height: 80,
                  width: 80,
                  child: profileImage != null
                      ? Image.file(
                          profileImage!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/images/img_user.jpg",
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
          ),
          _buildPostCount(50, 'Post'),
          _buildPostCount(645, 'Followers'),
          _buildPostCount(523, 'Following'),
        ],
      ),
    );
  }

  Widget _buildHighlight() {
    return SizedBox(
      height: 120,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            20,
            (index) => _buildHightContainer(isAdd: index == 0 ? true : false),
          ),
        ),
      ),
    );
  }

  Widget _buildHightContainer({bool isAdd = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 231, 227, 227),
            radius: 40,
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              backgroundImage: !isAdd
                  ? const AssetImage("assets/images/img_user.jpg")
                  : null,
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
      ),
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
