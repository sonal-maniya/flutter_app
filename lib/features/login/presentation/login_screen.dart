import 'package:flutter/material.dart';
import 'package:flutter_app/features/feed/presentation/home_screen.dart';
import 'package:flutter_app/routes/routing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
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
    debugPrint("${isValidUserName} isValidUserName");
    debugPrint("${isValidPassword} isValidPassword");
    if (username.isNotEmpty && password.isNotEmpty) {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("username", username);
      await pref.setString("password", password);
      // Navigator.repl(context, Routing.homePage);
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 50),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Colors.black12,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Don't have account?",
              style: TextStyle(color: Colors.black45),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Sign up.",
              ),
            ),
          ],
        ),
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
