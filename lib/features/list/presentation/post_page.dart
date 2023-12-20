import 'package:flutter/material.dart';
import 'package:flutter_app/features/list/presentation/controller/post_controller.dart';
import 'package:flutter_app/modal/album_modal.dart';

class PostListPageWidget extends StatefulWidget {
  const PostListPageWidget({super.key});

  @override
  State<PostListPageWidget> createState() => _PostListPageWidgetState();
}

class _PostListPageWidgetState extends State<PostListPageWidget> {
  late Future<List<Album>> futurePost;
  final PostDataManager listDataManager = PostDataManager();

  @override
  void initState() {
    super.initState();
    futurePost = listDataManager.fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Album"),
      ),
      body: Center(
          child: FutureBuilder<List<Album>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.separated(
                itemCount: snapshot.data?.length ?? 0,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final post = snapshot.data![index];
                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            post.title,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            post.url,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
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
