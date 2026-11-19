import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<FavoriteCard> createState() {
    return _FavoriteCardState();
  }
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;
  void changeFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "title",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                Text("description"),
              ],
            ),
          ),
          IconButton(
            onPressed: changeFavorite,
            icon: Icon(
              isFavorite ?Icons.favorite: Icons.favorite_border,
              color: isFavorite ?Colors.red: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
