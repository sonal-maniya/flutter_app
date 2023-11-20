import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routing.dart';

const String profileImage =
    'https://fastly.picsum.photos/id/517/200/300.jpg?hmac=xpkz9Xo5Fd9o6IumOFou6GwHqhMUTxxhyYfNiawb1Qk';

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            _buildHeader(),
            const SizedBox(
              height: 40,
            ),
            _buildAvatar(),
            _buildButton(context),
            TextButton(
              onPressed: () {},
              child: const Text("Switch accounts"),
            ),
            const Spacer(),
            _buildFooter(),
          ],
        ),
      )),
    );
  }

  Widget _buildHeader() {
    return const Image(
      image: AssetImage('assets/images/img_logo.png'),
      height: 50,
    );
  }

  Widget _buildAvatar() {
    return const CircleAvatar(
      radius: 40,
      backgroundImage: NetworkImage(profileImage),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(45)),
        onPressed: () {
          Navigator.pushNamed(context, Routing.loginPage);
        },
        child: const Text("Log in"),
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
