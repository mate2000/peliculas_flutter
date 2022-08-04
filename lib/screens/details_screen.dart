import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate(const [
          _PosterAndTitle(),
          _OverView(),
          _OverView(),
          _OverView(),
          CastingCards()
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      floating: true,
      pinned: true,
      expandedHeight: 200,
      flexibleSpace: const FlexibleSpaceBar(
        centerTitle: true,
        title: Text("movie.title"),
        background: FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage("https://via.placeholder.com/300x400"),
          fit: BoxFit.cover,
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent.shade200,
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/loading.gif"),
              image: NetworkImage("https://via.placeholder.com/200x300"),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "movie.title",
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              Text(
                "movie.originalTitle",
                style: textTheme.subtitle1,
                maxLines: 5,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline_outlined,
                    size: 12,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "movie.voteAverage",
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  const _OverView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        "Commodo voluptate veniam sunt consectetur elit. Deserunt sit aliqua aliqua ex consectetur proident magna occaecat. Incididunt elit exercitation laborum aliqua ipsum magna. Elit aliqua elit culpa officia. Nostrud irure aliqua ut eu tempor aliqua excepteur commodo exercitation incididunt excepteur tempor et.",
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
