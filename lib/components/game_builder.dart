import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/game.dart';
import 'package:yc_game_poc/components/player.dart';

import '../models/game_model.dart';
import 'obstacle.dart';

class GameBuilder extends FlameGame with HasCollisionDetection {
  final WidgetRef ref;
  final GameModel model;

  GameBuilder({required this.ref, required this.model});

  @override
  Future<void> onLoad() async {

    add(await loadParallaxComponent(
        model.parallax.layers.map((e) => ParallaxImageData(e)).toList(),
        baseVelocity: Vector2(1, 0),
        velocityMultiplierDelta: Vector2(1.635, 0)));

    for (var obstacle in model.obstacles) {
      add(GameObstacle(ref: ref, obstacle: obstacle));
    }

    add(GamePlayer(ref: ref, player: model.player));
    // camera.follow(man);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
