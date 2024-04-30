import 'package:flutter/material.dart';

class DatingCardsScreen extends StatefulWidget {
  @override
  _DatingCardsScreenState createState() => _DatingCardsScreenState();
}

class _DatingCardsScreenState extends State<DatingCardsScreen> {
  List<String> cardImages = [
    'https://domf5oio6qrcr.cloudfront.net/medialibrary/6372/202ebeef-6657-44ec-8fff-28352e1f5999.jpg',
    'ttps://cdn.britannica.com/92/13192-050-6644F8C3/bananas-bunch.jpg?w=400&h=300&c=crop',
    'https://www.applesfromny.com/wp-content/uploads/2020/05/20Ounce_NYAS-Apples2.png',
    // 'assets/images/hey.jpg',
    // 'assets/images/hey2.jpg',
    // 'assets/images/hey3.jpg',
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dating Cards'),
      ),
      body: Stack(
        children: [
          if (currentIndex < cardImages.length)
            _buildCard(cardImages[currentIndex]),
          if (currentIndex < cardImages.length - 1)
            Positioned(
              top: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentIndex > 0) {
                      currentIndex--;
                    }
                  });
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
          if (currentIndex < cardImages.length - 1)
            Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (currentIndex < cardImages.length - 1) {
                      currentIndex++;
                    }
                  });
                },
                child: Icon(Icons.arrow_forward),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCard(String imagePath) {
    return GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx < 0 || details.delta.dy > 0) {
          setState(() {
            if (currentIndex < cardImages.length) {
              currentIndex++;
            }
          });
        }
      },
      child: Container(
        margin: EdgeInsets.all(16),
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
}
