import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 180,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return _CastCard();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 110,
      width: 100,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/loading.gif"),
              image: NetworkImage("https://via.placeholder.com/150x300"),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "actor.name",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
