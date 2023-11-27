import 'package:flutter/material.dart';

class NotificationPageWidget extends StatefulWidget {
  const NotificationPageWidget({super.key});

  @override
  State<NotificationPageWidget> createState() => _NotificationPageWidgetState();
}

class _NotificationPageWidgetState extends State<NotificationPageWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    print(_tabController);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.grey[100],
              child: TabBar(
                indicatorColor: Colors.black54,
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(
                    child: Text(
                      ("Following"),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      ("You"),
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildList(),
                  _buildList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Container(
      color: Colors.white,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: 50,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/img_user.jpg"),
                    radius: 22,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        children: [
                          TextSpan(
                            text: "karennne ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: "liked your photo. "),
                          TextSpan(
                            text: "1h",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/img_post1.jpg",
                    height: 44,
                    width: 44,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
