import 'package:flutter/material.dart';
import 'package:flutter_app/stateManagement/provider/favourite_provider.dart';
import 'package:flutter_app/stateManagement/screen/favourite/my_favorite_age.dart';
import 'package:provider/provider.dart';

class FavoritePageWidget extends StatefulWidget {
  const FavoritePageWidget({super.key});

  @override
  State<FavoritePageWidget> createState() => _FavoritePageWidgetState();
}

class _FavoritePageWidgetState extends State<FavoritePageWidget> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite App"),
        actions: [
          InkWell(
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Icon(Icons.favorite),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyFavoriteItemWidget()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Consumer(builder: (context, value, child) {
            return ListTile(
              title: Text("Item $index"),
              trailing: IconButton(
                icon: favoriteProvider.selectedItem.contains(index)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_border),
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
