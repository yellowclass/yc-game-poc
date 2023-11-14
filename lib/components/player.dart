import 'package:flame/collisions.dart';
import 'package:flame_network_assets/flame_network_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:yc_game_poc/constants/images.dart';
import 'package:yc_game_poc/providers/providers.dart';

import '../models/game_model.dart';
import 'game_builder.dart';

class GamePlayer extends SpriteAnimationComponent with HasGameRef<GameBuilder> {
  final WidgetRef ref;
  final Player player;

  GamePlayer({required this.ref, required this.player}) : super() {
    debugMode = true;
  }

  final networkImages = FlameNetworkImages();
  late SpriteAnimation animationRun;
  late SpriteAnimation animationIdle;
  late SpriteAnimation animationWalk;
  bool isFlipped = false;

  @override
  Future<void> onLoad() async {
    animationRun = SpriteSheet(
            image: await networkImages.load(player.sprites.run.url),
            srcSize: Vector2(player.sprites.run.spriteSectionSize[0],
                player.sprites.run.spriteSectionSize[1]))
        .createAnimation(row: 0, stepTime: player.sprites.run.stepTime);
    animationIdle = SpriteSheet(
            image: await networkImages.load(player.sprites.idle.url),
            srcSize: Vector2(player.sprites.idle.spriteSectionSize[0],
                player.sprites.idle.spriteSectionSize[1]))
        .createAnimation(row: 0, stepTime: player.sprites.idle.stepTime);
    animationWalk = SpriteSheet(
            image: await networkImages.load(player.sprites.walk.url),
            srcSize: Vector2(player.sprites.walk.spriteSectionSize[0],
                player.sprites.walk.spriteSectionSize[1]))
        .createAnimation(row: 0, stepTime: player.sprites.walk.stepTime);

    animation = animationIdle;
    position = Vector2(player.position[0], player.position[1]);
    size = Vector2(player.size[0], player.size[1]);

    add(RectangleHitbox.relative(
      Vector2(player.hitboxRelation[0], player.hitboxRelation[1]),
      parentSize: size,
      position: Vector2(size.x / player.hitboxSizeDivider[0],
          size.y / player.hitboxSizeDivider[1]),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
    int direction = ref.read(directionProvider);
    if (direction > 0) {
      animation = animationRun;
      position.x += dt * player.runSpeedMultiplier;
    }
    if (direction == 0) {
      if (position.x < player.leftBoundaryLimit) {
        animation = animationWalk;
      } else {
        animation = animationIdle;
        position.x += dt * player.idlePenaltyMultiplier;
      }
    }
  }
}
