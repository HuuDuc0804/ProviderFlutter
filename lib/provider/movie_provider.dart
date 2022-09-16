import 'dart:math';
import 'package:flutter/material.dart';
import 'package:learnprovider/models/movie.dart';

final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
          title: 'Moview $index',
          runtime: '${Random().nextInt(100) + 60} minutes',
        ));

class MovieProvider with ChangeNotifier {
  //Movies
  final List<Movie> _movie = initialData;
  List<Movie> get movies => _movie;

  //Favorite movies
  final List<Movie> _myList = [];
  List<Movie> get myList => _myList;

  //Add a movie to the favorites list
  void addToList(Movie movie){
    _myList.add(movie);
    notifyListeners();
  }
  
  //Removing a movie from the favorites list
  void removeFromList(Movie movie){
    _myList.remove(movie);
    notifyListeners();
  }
}
