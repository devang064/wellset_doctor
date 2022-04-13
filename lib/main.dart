import 'package:doctor_1/ui/page1.dart';
//import 'package:doctor/page3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: Size(375,812),
      builder:() =>
       MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          body: p1(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
