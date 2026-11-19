import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];


void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ImageGallery(),
  ),
);

class ImageGallery extends StatefulWidget {
  const ImageGallery({super.key});

  @override
  State<ImageGallery> createState() {
    return _ImageGalleryState();
  }
}

class _ImageGalleryState extends State<ImageGallery> {
  int imageIndex = 0;

  void previousImage() {
    setState(() {
      if (imageIndex == 0) {
        imageIndex = images.length - 1;
      } else {
        imageIndex--;
      }
    });
  }
  void nextImage() {
    setState(() {
      if (imageIndex == images.length - 1) {
        imageIndex = 0;
      } else {
        imageIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: nextImage,
            ),
          ),
        ],
      ),
    body: SizedBox(
      width: double.infinity,
      height: double.infinity, child: Image.asset(images[imageIndex],fit: BoxFit.cover, ),),
    );
  }
}
