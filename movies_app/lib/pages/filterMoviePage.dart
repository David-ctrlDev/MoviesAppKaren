import 'package:flutter/material.dart';


class SearchList extends StatefulWidget {
  const SearchList({Key? key}) : super(key: key);

  @override
  _SearchList createState() => _SearchList();
}

class _SearchList extends State<SearchList> {
  // This holds a list of fiction Movies
  //Karen, here, you can add or change your Movies
  final List<Map<String, dynamic>> _allMovies = [
    {"id": 1, "name": "Cars", "age": 2009},
    {"id": 2, "name": "Lord Of The Rings", "age": 2002},
    {"id": 3, "name": "Jumanji", "age": 1998},
    {"id": 4, "name": "Barbara", "age": 1935},
    {"id": 5, "name": "Candy", "age": 21},
    
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundMovies = [];
  @override
  initState() {
    // Karen, at the beginning, all movies are hide, bur you can change this
    _foundMovies = [];
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _foundMovies;
    } else {
      results = _allMovies
          .where((movie) =>
              movie["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundMovies = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoviesAPP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: const InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundMovies.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundMovies.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundMovies[index]["id"]),
                        color: Colors.amberAccent,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundMovies[index]["id"].toString(),
                            style: const TextStyle(fontSize: 24),
                          ),
                          title: Text(_foundMovies[index]['name']),
                          subtitle: Text(
                              '${_foundMovies[index]["age"].toString()} '),
                        ),
                      ),
                    )
                  : const Text(
                      'Ingresa el nombre de tú peli!',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}