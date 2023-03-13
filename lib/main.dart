import 'package:brew_crew2/screens/authenticate/authenticate.dart';
import 'package:brew_crew2/screens/wrapper.dart';
import 'package:brew_crew2/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

Future<void> main() async {
  // These two lines
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamProvider<MyUser?>.value(
          catchError: (_, __) => null,
          value: AuthService().user,
          initialData: null,
          child: MaterialApp(
            home: Wrapper(),
          )),
    );
  }
}
