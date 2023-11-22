import 'package:flutter/material.dart';
import 'package:flutter_app/features/search/presentation/widgets/filter_list.dart';
import 'package:flutter_app/features/search/presentation/widgets/post_grid_list.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(),
            FilterTypeList(),
            Expanded(
              child: PostGridList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                filled: true,
                fillColor: Colors.grey[200]!,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[100]!, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                border: const OutlineInputBorder(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                prefixIcon: const Icon(Icons.search_outlined),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset('assets/icons/ic_live.png', scale: 3),
        ],
      ),
    );
  }
}
