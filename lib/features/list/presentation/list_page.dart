import 'package:flutter/material.dart';
import 'package:flutter_app/features/list/presentation/controller/list_controller.dart';
import 'package:flutter_app/modal/post_modal.dart';
import 'package:flutter_app/offlinedb/car.dart';
import 'package:flutter_app/services/api.dart';
import 'package:realm/realm.dart';

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
    final config = Configuration.local([Car.schema]);
    final realm = Realm(config);

    final cars = <Car>[];
    cars.addAll([
      Car("Toyota", miles: 50000, model: "Corolla"),
      Car('Ford', model: 'Mustang', miles: 25000),
      Car('Honda', model: 'Accord', miles: 30000),
      Car('Chevrolet', model: 'Camaro', miles: 40000),
      Car('BMW', miles: 20000)
    ]);
    // realm.write(() => {realm.addAll(cars)});

    final carData = realm.all<Car>();

    // Get All
    for (var car in carData) {
      print(car.model);
    }

    // Query
    final accordCar = realm.all<Car>().query("model == 'Accord'");
    for (var car in accordCar) {
      print("Query...===============.");
      print(car.model);
    }

    realm.close();
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
