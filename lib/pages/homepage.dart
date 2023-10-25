import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'buttons.dart';
import 'game.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  // final game = FlameGame();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        GameWidget(
          game: TryGame(ref: ref),
        ),
        const Buttons(),
      ],
    );
  }
}


