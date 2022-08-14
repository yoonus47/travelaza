import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingScreen() {
  return Center(
    child: SpinKitCubeGrid(
      color: Color(0xFF1A395A),
      size: 50.0,
    ),
  );
}
