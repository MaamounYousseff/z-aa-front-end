import 'package:aa_frontend/core/routing/app_router.dart';
import 'package:aa_frontend/core/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdvertisementApp extends StatefulWidget {
  const AdvertisementApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<StatefulWidget> createState() => _AdvertisementAppState();
}

class _AdvertisementAppState extends State<AdvertisementApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Advertisement App',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        onGenerateRoute: widget.appRouter.onGenerateRoute,
        initialRoute: Routes.onBoardingScreen,
      ),
    );
  }
}
