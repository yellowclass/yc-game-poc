import 'package:flame/collisions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

import '../pages/game.dart';

class Obstacle extends SpriteAnimationComponent with HasGameRef<TryGame> {
  final WidgetRef ref;

  Obstacle({required this.ref}) : super() {
    debugMode = true;
  }

  late SpriteAnimation animationRun;
  late SpriteAnimation animationIdle;
  late SpriteAnimationComponent man;
  late SpriteSheet spriteRun;
  late SpriteSheet spriteIdle;
  bool isFlipped = false;

  @override
  Future<void> onLoad() async {
    spriteIdle = SpriteSheet(
        image: await gameRef.images.load('wizard/idle.png'),
        srcSize: Vector2(128, 128));
    animationIdle = spriteIdle.createAnimation(row: 0, stepTime: 0.1);
    animation = animationIdle;
    position = Vector2(500, 70);
    size = Vector2.all(200);
    flipHorizontallyAroundCenter();
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
}
