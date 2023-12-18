import 'package:flutter/material.dart';
import 'package:flutter_app/modal/user_modal.dart';
import 'package:flutter_app/riverpod/data_provider.dart';
import 'package:flutter_app/riverpod/user_detail_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Access the Provider
class UserPageWidget extends ConsumerWidget {
  const UserPageWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final _userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: _userData.when(
          data: (userData) {
            List<UserModal> userList = userData.map((e) => e).toList();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: userList.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => UserDetailWidget(
                                        userDetail: userList[index],
                                      )));
                            },
                            child: Card(
                              child: ListTile(
                                title: Text(userList[index].name),
                                subtitle: Text(userList[index].email),
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            );
          },
          error: (err, s) => Text(
                err.toString(),
              ),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
