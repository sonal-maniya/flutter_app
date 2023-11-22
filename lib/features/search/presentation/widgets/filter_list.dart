import 'package:flutter/material.dart';

class FilterTypes {
  final IconData? icon;
  final String label;

  FilterTypes({required this.label, this.icon});
}

class FilterTypeList extends StatelessWidget {
  FilterTypeList({super.key});

  final List<FilterTypes> filterTypes = [
    FilterTypes(icon: Icons.tv_off_rounded, label: 'IGTV'),
    FilterTypes(icon: Icons.shop_2_rounded, label: 'Shop'),
    FilterTypes(label: 'Style'),
    FilterTypes(label: 'Sports'),
    FilterTypes(label: 'Auto'),
    FilterTypes(label: 'Music'),
    FilterTypes(label: 'News'),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filterTypes
            .map(
              (FilterTypes filterType) => Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Chip(
                  padding: const EdgeInsets.all(5),
                  label: Text(filterType.label),
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                    side: BorderSide(
                        width: 1, color: Color.fromARGB(255, 224, 224, 224)),
                  ),
                  avatar: filterType.icon != null
                      ? Icon(
                          filterType.icon,
                          size: 16,
                        )
                      : null,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
