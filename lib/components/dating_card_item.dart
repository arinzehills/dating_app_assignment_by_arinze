import 'dart:ffi';

import 'package:dating_app_assignment/constants/colors.dart';
import 'package:dating_app_assignment/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DatingCardItem extends StatefulWidget {
  DatingCardItem(
      {super.key,
      required this.cardImages,
      required this.name,
      required this.description,
      this.likeCount,
      this.location,
      required this.age});
  List cardImages;
  String name;
  String description;
  int? likeCount;
  String? location;
  int age;
  @override
  State<DatingCardItem> createState() => _DatingCardItemState();
}

class _DatingCardItemState extends State<DatingCardItem> {
  int _selectedIndex = 0;
  // List<String> cardImages =?? [
  //   'https://domf5oio6qrcr.cloudfront.net/medialibrary/6372/202ebeef-6657-44ec-8fff-28352e1f5999.jpg',
  //   'ttps://cdn.britannica.com/92/13192-050-6644F8C3/bananas-bunch.jpg?w=400&h=300&c=crop',
  //   'https://www.applesfromny.com/wp-content/uploads/2020/05/20Ounce_NYAS-Apples2.png',
  // ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildCard(widget.cardImages[_selectedIndex]),
        _buildIndicators(_selectedIndex),
        _buildShade()
      ],
    );
  }

  Widget _buildCard(imagePath) {
    return GestureDetector(
      onTapDown: _handleChangeImage,
      child: Container(
        margin: EdgeInsets.all(16).copyWith(top: 30),
        height: size(context).height * 0.67,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
          image: DecorationImage(
            image: NetworkImage(
                imagePath), // Use NetworkImage for images from network URLs
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  _handleChangeImage(details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double tapX = details.localPosition.dx;
    final double tapY = details.localPosition.dy;
    if (tapX < (screenWidth / 3) && tapY < (screenHeight / 3)) {
      setState(() => _selectedIndex = _selectedIndex == 0
          ? widget.cardImages.length - 1
          : _selectedIndex - 1);
    }
    if (tapX > (2 * screenWidth / 3) && tapY < (screenHeight / 3)) {
      setState(() => _selectedIndex == widget.cardImages.length - 1
          ? _selectedIndex = 0
          : _selectedIndex += 1);
    }
  }

  Widget _buildIndicators(selectedIndex) {
    return Align(
      alignment: Alignment.topCenter,
      // top: 20,
      // right: 20,
      // left: 20,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 45, horizontal: 20),
        height: 5,
        child: ListView.builder(
            itemCount: widget.cardImages.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: size(context).width * 0.6 / widget.cardImages.length,
                height: 5,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? mypink
                        : Colors.grey.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15)),
              );
            }),
      ),
    );
  }

  Widget _buildShade() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Stack(
        children: [
          Container(
            height: 180, // Adjust the height of the gradient overlay as needed
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(3, 126, 126, 126),
                  Colors.black.withOpacity(0.99), // Adjust opacity as needed
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(1, -1),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Icon(Icons.star_rate_rounded),
                        Text('${widget.likeCount}')
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 28),
                          ),
                          Text(
                            widget.description,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Image.asset('assets/icons/loveicon.png')
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
