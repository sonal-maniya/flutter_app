import 'package:flutter/material.dart';
import 'package:flutter_app/features/feed/presentation/widgets/page_indicator.dart';

class PostImageWidget extends StatefulWidget {
  final int imageCount;
  const PostImageWidget({Key? super.key, this.imageCount = 1});

  @override
  State<PostImageWidget> createState() => _PostImageWidgetState();
}

class _PostImageWidgetState extends State<PostImageWidget> {
  int currentPage = 0;

  void _onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.imageCount == 1) {
      return Image.asset("assets/images/img_post.jpg");
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: PageView(
            onPageChanged: _onPageChanged,
            allowImplicitScrolling: true,
            scrollDirection: Axis.horizontal,
            children: List.generate(
              widget.imageCount,
              (index) => _buildImageWidget(),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -30,
          height: 10,
          child: PageIndicatorWidget(
            currentPage: currentPage,
            totalPages: widget.imageCount,
          ),
        )
      ],
    );
  }

  Widget _buildImageWidget() {
    return Container(
      color: const Color.fromRGBO(242, 244, 244, 1),
      child: Image.asset(
        "assets/images/img_post.jpg",
        scale: 1,
        fit: BoxFit.cover,
      ),
    );
  }
}
