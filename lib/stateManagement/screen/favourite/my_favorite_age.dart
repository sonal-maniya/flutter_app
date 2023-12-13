import 'package:flutter/material.dart';
import 'package:flutter_app/stateManagement/provider/favourite_provider.dart';
import 'package:provider/provider.dart';

class MyFavoriteItemWidget extends StatefulWidget {
  const MyFavoriteItemWidget({super.key});

  @override
  State<MyFavoriteItemWidget> createState() => _MyFavoriteItemWidgetState();
}

class _MyFavoriteItemWidgetState extends State<MyFavoriteItemWidget> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Favorite App"),
      ),
      body: ListView.builder(
        itemCount: favoriteProvider.selectedItem.length,
        itemBuilder: (context, index) {
          return Consumer(builder: (context, value, child) {
            return ListTile(
              title: Text("Item $index"),
              trailing: IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: () {
                  favoriteProvider.manageFavorite(index);
                },
              ),
            );
          });
        },
      ),
    );
  }
}
