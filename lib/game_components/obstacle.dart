import 'package:flame/collisions.dart';
import 'package:flame_network_assets/flame_network_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:yc_game_poc/constants/images.dart';

import '../models/game_model.dart';
import 'game_builder.dart';

class GameObstacle extends SpriteAnimationComponent
    with HasGameRef<GameBuilder>, CollisionCallbacks {
  final WidgetRef ref;
  final Obstacle obstacle;

  GameObstacle({required this.ref, required this.obstacle}) : super() {
    debugMode = true;
  }

  final networkImages = FlameNetworkImages();
  late SpriteAnimation animationRun;
  late SpriteAnimation animationIdle;
  late SpriteAnimation animationWalk;
  late SpriteAnimationComponent man;
  late SpriteSheet spriteRun;
  late SpriteSheet spriteIdle;
  late SpriteSheet spriteWalk;
  bool isFlipped = false;

  @override
  Future<void> onLoad() async {
    animationRun = SpriteSheet(
            image: await networkImages.load(obstacle.sprites.run.url),
            srcSize: Vector2(obstacle.sprites.run.spriteSectionSize[0],
                obstacle.sprites.run.spriteSectionSize[1]))
        .createAnimation(row: 0, stepTime: obstacle.sprites.run.stepTime);
    animationIdle = SpriteSheet(
            image: await networkImages.load(obstacle.sprites.idle.url),
            srcSize: Vector2(obstacle.sprites.idle.spriteSectionSize[0],
                obstacle.sprites.idle.spriteSectionSize[1]))
        .createAnimation(row: 0, stepTime: obstacle.sprites.idle.stepTime);
    animationWalk = SpriteSheet(
            image: await networkImages.load(obstacle.sprites.walk.url),
            srcSize: Vector2(obstacle.sprites.walk.spriteSectionSize[0],
                obstacle.sprites.walk.spriteSectionSize[1]))
        .createAnimation(row: 0, stepTime: obstacle.sprites.walk.stepTime);

    animation = animationWalk;
    position = Vector2(obstacle.position[0], obstacle.position[1]);
    size = Vector2(obstacle.size[0], obstacle.size[1]);

    add(RectangleHitbox.relative(
      Vector2(obstacle.hitboxRelation[0], obstacle.hitboxRelation[1]),
      parentSize: size,
      position: Vector2(size.x / obstacle.hitboxSizeDivider[0], size.y / obstacle.hitboxSizeDivider[1]),
    ));
  }

  @override
  void update(double dt) {
    super.update(dt);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    flipHorizontallyAroundCenter();
    print(obstacle.collisionMessage);
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    flipHorizontallyAroundCenter();
    super.onCollisionEnd(other);
  }
}
