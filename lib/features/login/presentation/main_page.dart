import 'package:flutter/material.dart';
import 'package:flutter_app/features/login/presentation/widgets/footer.dart';
import 'package:flutter_app/features/login/presentation/widgets/logo.dart';
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
            const AppLogoWidget(),
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
            const FooterWidget(),
          ],
        ),
      )),
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
}
