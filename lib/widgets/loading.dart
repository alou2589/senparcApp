import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0288D1),
      child: const Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 50.0,
          duration: Duration(seconds: 5),
        ),
      ),
    );
  }
}
