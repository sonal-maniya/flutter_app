import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_app/constants/app_constants.dart';
import 'package:flutter_app/features/feed/presentation/app_tab_page.dart';
import 'package:flutter_app/features/login/presentation/widgets/footer.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isValidUserName = true;
  bool isValidPassword = true;

  Future<void> _onLoginPress(BuildContext context) async {
    String username = emailController.text;
    String password = passwordController.text;
    setState(() {
      isValidUserName = username.isNotEmpty;
      isValidPassword = password.isNotEmpty;
    });
    if (username.isNotEmpty && password.isNotEmpty) {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString(AppConstants.keyLoginUsername, username);
      await pref.setBool(AppConstants.keyIsLoggedIn, true);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => AppTabWidget()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white10,
          elevation: 0,
          foregroundColor: Colors.black87),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildHeader(),
                const SizedBox(height: 40),
                _buildInput(emailController, 'Username'),
                _buildInput(passwordController, 'Password', isPassword: true),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                        ),
                      ),
                      child: const Text(
                        "Forgot Password?",
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
                _buildButton(context),
                TextButton(
                  onPressed: () {},
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/icons/ic_facebook.png'),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Log in with Facebook",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          _buildOptions(),
          _buildFooter(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Image(
      image: AssetImage('assets/images/img_logo.png'),
      height: 50,
    );
  }

  Widget _buildInput(
    TextEditingController controller,
    String label, {
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 1),
          ),
          border: const OutlineInputBorder(),
          hintText: label,
          labelStyle: const TextStyle(fontSize: 15, color: Colors.black87),
          filled: true,
          fillColor: const Color.fromARGB(255, 237, 237, 237),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          error: (isPassword && !isValidPassword) || !isValidUserName
              ? Text(
                  "$label cannot be empty",
                  style: const TextStyle(color: Colors.redAccent),
                )
              : null,
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(45)),
        onPressed: () => _onLoginPress(context),
        child: const Text("Log in"),
      ),
    );
  }

  Widget _buildOptions() {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: EdgeInsets.only(
          bottom: const Size.fromHeight(50).height,
        ),
        child: const FooterWidget(),
      ),
    );
  }

  Widget _buildFooter() {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: const Center(
            child: Text(
          "Instagram от Facebook",
          style: TextStyle(color: Colors.black54),
        )),
      ),
    );
  }
}
