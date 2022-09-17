import 'package:flutter/material.dart';
import 'package:learnprovider/provider/movie_provider.dart';
import 'package:provider/provider.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  @override
  Widget build(BuildContext context) {
    final myList = context.watch<MovieProvider>().myList;
    return Scaffold(
        appBar: AppBar(
          title: Text('My List (${myList.length})'),
        ),
        body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: ((context, index) {
            final currentMovie = myList[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                title: Text(currentMovie.title),
                subtitle: Text(currentMovie.runtime ?? ''),
                trailing: TextButton(
                    onPressed: () {
                      context
                          .read<MovieProvider>()
                          .removeFromList(currentMovie);
                    },
                    child: const Text(
                      'Remove',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    )),
              ),
            );
          }),
        ));
  }
}
