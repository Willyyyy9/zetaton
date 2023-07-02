import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zetaton/app/data/constants.dart';
import 'package:zetaton/app/data/my_app.dart';
import 'package:zetaton/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.configureLoading();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
