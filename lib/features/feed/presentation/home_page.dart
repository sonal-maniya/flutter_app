import 'package:flutter/material.dart';
import 'package:flutter_app/features/feed/presentation/widgets/post_footer.dart';
import 'package:flutter_app/features/feed/presentation/widgets/post_header.dart';
import 'package:flutter_app/features/feed/presentation/widgets/story_widget.dart';
import 'package:flutter_app/widgets/logo.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  List<String> profileImage = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildTopBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStoryList(),
            const Divider(),
            _buildFeedList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildTopBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 247, 246, 246),
      foregroundColor: Colors.black,
      elevation: 1,
      centerTitle: true,
      title: const AppLogoWidget(height: 30),
      leading: IconButton(
        icon: const Icon(Icons.camera_alt_outlined),
        onPressed: () {},
      ),
      actions: [
        _buildIconWithBadge(),
        _buildMessengerIconButton(),
      ],
    );
  }

  Widget _buildIconWithBadge() {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(Icons.tv_rounded),
          onPressed: () {},
        ),
        const Positioned(
          top: 10,
          right: 7,
          child: Badge(
            smallSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildMessengerIconButton() {
    return IconButton(
      icon: Image.asset(
        'assets/icons/ic_messenger.png',
        scale: 3,
        color: Colors.black,
      ),
      iconSize: 5,
      onPressed: () {},
    );
  }

  Widget _buildStoryList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          10,
          (index) => const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 14),
                child: StoryWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeedList() {
    return Column(
      children: List.generate(
          20,
          (index) => Column(
                children: [
                  // Post Header
                  const PostHeaderWidget(),
                  // Post Image
                  Image.asset("assets/images/img_post.jpg"),
                  // Post Footer
                  const PostFooterWidget(),
                  const Divider(),
                ],
              )),
    );
  }
}
