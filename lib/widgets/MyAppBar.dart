import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
   MyAppBar({super.key, required this.title, this.actionRefresh});
  final String title;
  final actionRefresh;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.teal,
        title: Text(title, style: TextStyle(color: Colors.white),),
        centerTitle: true,
        actions: [
          IconButton( // An icon button for a search action
            color: Colors.white,
            tooltip: 'Recherche', // A tooltip for the button
            icon: const Icon( // The search icon
              Icons.search,
            ),
            onPressed: () {}, // An empty method that can be replaced with custom functionality
          ),
        ],
      );
  }
}
