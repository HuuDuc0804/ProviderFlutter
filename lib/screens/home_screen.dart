import 'package:flutter/material.dart';
import 'package:learnprovider/provider/movie_provider.dart';
import 'package:provider/provider.dart';

import 'my_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyListScreen(),
                ));
              },
              icon: const Icon(Icons.favorite),
              label: Text(
                'Go to my list (${myList.length})',
                style: const TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20)),
            ),
            const SizedBox(height: 15),
            Expanded(
                child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index) {
                      final currentMovie = movies[index];
                      return Card(
                        key: ValueKey(currentMovie.title),
                        color: Colors.amberAccent.shade100,
                        elevation: 4,
                        child: ListTile(
                          title: Text(currentMovie.title),
                          subtitle:
                              Text(currentMovie.runtime ?? 'No information'),
                          trailing: IconButton(
                            icon: const Icon(Icons.favorite),
                            color: myList.contains(currentMovie)
                                ? Colors.red
                                : Colors.white,
                            onPressed: () {
                              if (!myList.contains(currentMovie)) {
                                context
                                    .read<MovieProvider>()
                                    .addToList(currentMovie);
                              } else {
                                context
                                    .read<MovieProvider>()
                                    .removeFromList(currentMovie);
                              }
                            },
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
