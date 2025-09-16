import 'package:aa_frontend/advertisement_app.dart';
import 'package:aa_frontend/core/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  // debugPaintSizeEnabled = true; // Add this line
  runApp(AdvertisementApp(appRouter: AppRouter()));
}
