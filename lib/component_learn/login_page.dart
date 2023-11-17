import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
            image: const AssetImage('assets/images/ic_back.jpg'),
            fit: BoxFit.cover,
            colorFilter:
                ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop)),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(top: 80, child: _buildTop()),
            Positioned(bottom: 0, child: _buildBottom()),
          ],
        ),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_sharp,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "GO MAP",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
              color: myColor, fontSize: 30, fontWeight: FontWeight.w500),
        ),
        _buildGrayText("Please login with your information"),
        const SizedBox(
          height: 60,
        ),
        _buildGrayText("Email"),
        _buildInputField(emailController),
        const SizedBox(height: 40),
        _buildGrayText("Password"),
        _buildInputField(passwordController, isPassword: true),
        _buildRememberForgot(),
        const SizedBox(
          height: 20,
        ),
        _buildLoginButton(),
        const SizedBox(
          height: 20,
        ),
        _buildOtherLogin(),
      ],
    );
  }

  Widget _buildGrayText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false}) {
    return (TextField(
      controller: controller,
      decoration: InputDecoration(
          suffix: isPassword
              ? const Icon(Icons.remove_red_eye)
              : const Icon(Icons.done)),
      obscureText: isPassword,
    ));
  }

  Widget _buildRememberForgot() {
    return Row(
      children: [
        Checkbox(
            value: rememberUser,
            onChanged: (value) {
              setState(() {
                rememberUser = value ?? false;
              });
            }),
        _buildGrayText("Remember me"),
        TextButton(
            onPressed: () {}, child: _buildGrayText("I forgot my password?"))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
        onPressed: () {
          debugPrint("Email ${emailController.text}");
          debugPrint("Password ${passwordController.text}");
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: myColor,
          minimumSize: const Size.fromHeight(55),
        ),
        child: const Text("LOGIN"));
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(children: [
        _buildGrayText("or Login with"),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tab(
              icon: Image.asset('assets/images/ic_facebook.png'),
              height: 30.0,
            ),
            Tab(
              icon: Image.asset('assets/images/ic_whatsapp.png'),
              height: 30.0,
            ),
            Tab(
              icon: Image.asset('assets/images/ic_linkedin.png'),
              height: 30.0,
            ),
            Tab(
              icon: Image.asset('assets/images/ic_github.png'),
              height: 30.0,
            ),
          ],
        )
      ]),
    );
  }
}
