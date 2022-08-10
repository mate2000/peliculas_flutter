import 'package:flutter/material.dart';
import 'package:peliculas/models/models.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Pelicula';
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () => query = '', icon: const Icon(Icons.cancel_outlined))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("buildResults");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
    return query.isEmpty
        ? _emptyContainer()
        : FutureBuilder(
            future: moviesProvider.searchMovie(query),
            builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
              return !snapshot.hasData
                  ? _emptyContainer()
                  : ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) =>
                          _MovieItem(movie: snapshot.data![index]),
                    );
            },
          );
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 100,
      ),
    );
  }
}

class _MovieItem extends StatelessWidget {
  const _MovieItem({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        style: ListTileStyle.list,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
            placeholder: const AssetImage("assets/no-image.jpg"),
            image: NetworkImage(movie.fullPosterImg),
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
        title: Text(movie.title),
        onTap: () => Navigator.pushNamed(context, 'detail', arguments: movie),
      ),
    );
  }
}
