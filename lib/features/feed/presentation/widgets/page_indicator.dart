import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final double indicatorSize = 4;
  final Color selectedIndicatorColor = const Color.fromARGB(255, 3, 186, 237);
  final Color indicatorColor = const Color.fromARGB(255, 194, 193, 193);

  const PageIndicatorWidget(
      {Key? super.key, this.currentPage = 0, this.totalPages = 2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          totalPages,
          (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: CircleAvatar(
                  radius: indicatorSize,
                  backgroundColor: index == currentPage
                      ? selectedIndicatorColor
                      : indicatorColor,
                ),
              )),
    );
  }
}
