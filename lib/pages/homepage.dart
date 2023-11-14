import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yc_game_poc/models/game_model.dart';

import '../services/api.dart';
import 'widgets/buttons.dart';
import '../game_components/game_builder.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool loading = true;
  GameModel? model;

  apiCall() async {
    model = await Api().getGameModel(1);
    Future.delayed(Duration.zero).then((value) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return !loading
        ? Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(model!.background),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: GameWidget(
                    game: GameBuilder(ref: ref, model: model!),
                  )),
              const Buttons(),
            ],
          )
        : const Center(
            child: SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  color: Colors.white,
                )),
          );
  }
}
