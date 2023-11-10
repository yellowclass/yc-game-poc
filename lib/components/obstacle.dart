import 'package:flame/collisions.dart';
import 'package:flame_network_assets/flame_network_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:yc_game_poc/constants/images.dart';

import '../pages/game.dart';

class Obstacle extends SpriteAnimationComponent
    with HasGameRef<TryGame>, CollisionCallbacks {
  final WidgetRef ref;

  Obstacle({required this.ref}) : super() {
    // debugMode = true;
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
    SpriteSheet spriteRun = SpriteSheet(
        image: await networkImages.load(ImagesWizard.run),
        srcSize: Vector2(128, 128));
    SpriteSheet spriteIdle = SpriteSheet(
        image: await networkImages.load(ImagesWizard.idle),
        srcSize: Vector2(128, 128));
    SpriteSheet spriteWalk = SpriteSheet(
        image: await networkImages.load(ImagesWizard.walk),
        srcSize: Vector2(128, 128));
    animationIdle = spriteIdle.createAnimation(row: 0, stepTime: 0.1);
    animationRun = spriteRun.createAnimation(row: 0, stepTime: 0.1);
    animationWalk = spriteWalk.createAnimation(row: 0, stepTime: 0.1);
    // animation = animationIdle;
    animation = animationWalk;
    position = Vector2(500, 110);
    size = Vector2.all(200);
    // flipHorizontallyAroundCenter();
    add(RectangleHitbox.relative(
      Vector2(0.5, 0.6),
      parentSize: size, position: Vector2(size.y / 4, size.y / 2.5),
      // anchor: Anchor.bottomCenter
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
    super.onCollisionStart(intersectionPoints, other);
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    flipHorizontallyAroundCenter();
    super.onCollisionEnd(other);
  }
}
