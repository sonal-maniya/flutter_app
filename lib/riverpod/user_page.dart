import 'package:flutter/material.dart';
import 'package:flutter_app/modal/user_modal.dart';
import 'package:flutter_app/riverpod/data_provider.dart';
import 'package:flutter_app/riverpod/user_detail_page.dart';
import 'package:flutter_app/stateManagement/provider/name_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final name = ref.read(nameProvider);
        return Text(name);
      },
    );
  }
}

// Access the Provider
class UserPageWidget extends ConsumerWidget {
  const UserPageWidget({super.key});

  void onSubmitted(WidgetRef ref, String value) {
    ref.read(updateNameProvider.notifier).update((state) => value);

    ref.read(userProvider.notifier).updateName(value);
    ref.read(userProvider.notifier).updateAge(28);

    ref.read(employeeChangeNotifierProvider).updateEmployeeSalary(340000);
  }

  @override
  Widget build(BuildContext context, ref) {
    final _name = ref.watch(nameProvider);
    final _updateName = ref.watch(updateNameProvider) ?? "-";
    final _userData = ref.watch(userDataProvider);

    // rerun if the value of name or age update
    final _user = ref.watch(userProvider);

    // way to read -> Read, Watch, Select
    // only rerun if name update
    final _userName = ref.watch(userProvider.select((value) => value.name));

    // Change Notifier
    final _employee = ref.watch(employeeChangeNotifierProvider).employee;

    final _post = ref.watch(postFutureProvider);

    final _streamData = ref.watch(streamProvider);

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
                  Text(_name),
                  Text(_updateName),
                  TextField(
                    onSubmitted: (value) => onSubmitted(ref, value),
                  ),
                  Text("Name ${_user.name}"),
                  Text("Age ${_user.age.toString()}"),
                  Text(
                      "Employee Name: ${_employee.name} Salary: ${_employee.salary}"),
                  _streamData.when(
                    data: (data) {
                      return Text("\nStream data: ${_streamData.toString()}\n");
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => const CircularProgressIndicator(),
                  ),
                  Expanded(
                    flex: 1,
                    child: _post.when(
                      data: (data) => Column(children: [
                        Text(data.title),
                        const Divider(),
                        Text(data.body),
                      ]),
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stackTrace) => Center(
                        child: Text(error.toString()),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
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
