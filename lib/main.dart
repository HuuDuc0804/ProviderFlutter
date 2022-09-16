import 'package:flutter/material.dart';
import 'package:learnprovider/provider/movie_provider.dart';
import 'package:learnprovider/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MovieProvider>(
    child: const MyApp(),
    create: (context) => MovieProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomeScreen());
  }
}
