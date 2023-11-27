import 'package:flutter/material.dart';
import 'package:flutter_app/features/list/presentation/controller/list_controller.dart';
import 'package:flutter_app/modal/post_modal.dart';
import 'package:flutter_app/services/api.dart';

class ListPageWidget extends StatefulWidget {
  const ListPageWidget({super.key});

  @override
  State<ListPageWidget> createState() => _ListPageWidgetState();
}

class _ListPageWidgetState extends State<ListPageWidget> {
  late Future<List<Post>> futurePost;
  final ApiClient apiClient = ApiClient();
  final ListDataManager listDataManager = ListDataManager();

  @override
  void initState() {
    super.initState();
    futurePost = listDataManager.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Data"),
      ),
      body: Center(
          child: FutureBuilder<List<Post>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.separated(
                itemCount: snapshot.data?.length ?? 0,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final post = snapshot.data![index];
                  return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
