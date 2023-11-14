import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame_network_assets/flame_network_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/game.dart';
import 'package:yc_game_poc/game_components/player.dart';

import '../models/game_model.dart';
import 'obstacle.dart';

class GameBuilder extends FlameGame with HasCollisionDetection {
  final WidgetRef ref;
  final GameModel model;

  GameBuilder({required this.ref, required this.model});

  final networkImages = FlameNetworkImages();

  @override
  Future<void> onLoad() async {
    if (model.background != '') {
      add(SpriteComponent.fromImage(
        await networkImages.load(
          model.background,
        ),
        size: size,
      ));
    }

    add(await loadParallaxComponent(
        model.parallax.layers.map((layer) => ParallaxImageData(layer)).toList(),
        baseVelocity: Vector2(
            model.parallax.baseVelocity[0], model.parallax.baseVelocity[1]),
        velocityMultiplierDelta: Vector2(model.parallax.velocityMultiplier[0],
            model.parallax.velocityMultiplier[1])));

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
