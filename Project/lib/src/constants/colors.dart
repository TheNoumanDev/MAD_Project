import 'package:flutter/material.dart';

// Gradient Color
const LinearGradient backgroundColorGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    Color.fromRGBO(37, 24, 78, 0.4),
    Color.fromRGBO(37, 24, 78, 0.6),
    Color.fromRGBO(37, 24, 78, 0.8),
    Color.fromRGBO(37, 24, 78, 1),
  ],
  stops: [0.1, 0.4, 0.7, 0.9],
);
