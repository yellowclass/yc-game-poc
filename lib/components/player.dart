import 'dart:convert';

import 'package:flame/collisions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:http/http.dart' as http;
import 'package:yc_game_poc/providers/providers.dart';

import '../pages/game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<TryGame>, CollisionCallbacks {
  final WidgetRef ref;

  Player({required this.ref}) : super() {
    debugMode = true;
  }

  late SpriteAnimation animationRun;
  late SpriteAnimation animationIdle;
  bool isFlipped = false;

  @override
  Future<void> onLoad() async {
    http.Response responseIdle = await http.get(Uri.parse(
        'https://firebasestorage.googleapis.com/v0/b/contract-522d7.appspot.com/o/idle.png?alt=media&token=29a17254-8fd4-4e8f-98f1-0d5bdc01fc50&_gl=1*fo4f63*_ga*ODM1MDc4NzMyLjE2OTgxNTU1MTc.*_ga_CW55HF8NVT*MTY5ODU3Njc0Ny4zLjEuMTY5ODU3NzkzMi42MC4wLjA'));
    String runPlayer = base64Encode(responseIdle.bodyBytes);

    responseIdle = await http.get(Uri.parse("https://firebasestorage.googleapis.com/v0/b/contract-522d7.appspot.com/o/run.png?alt=media&token=bcfd007b-8f48-4492-b3af-5c6291de91ea&_gl=1*mw4pak*_ga*ODM1MDc4NzMyLjE2OTgxNTU1MTc.*_ga_CW55HF8NVT*MTY5ODU3Njc0Ny4zLjEuMTY5ODU3Nzg3OC41MS4wLjA."));
    String idlePlayer = base64Encode(responseIdle.bodyBytes);
    SpriteSheet spriteRun = SpriteSheet(
        image: await gameRef.images.fromBase64("2", idlePlayer),
        srcSize: Vector2(128, 128));
    SpriteSheet spriteIdle = SpriteSheet(
        image: await gameRef.images.fromBase64("3", runPlayer),
        srcSize: Vector2(128, 128));
    animationIdle = spriteIdle.createAnimation(row: 0, stepTime: 0.1);
    animationRun = spriteRun.createAnimation(row: 0, stepTime: 0.1);

    animation = animationIdle;
    position = Vector2(20, 200);
    size = Vector2.all(200);
    add(RectangleHitbox.relative(
      Vector2(0.5, 0.6),
      parentSize: size, position: Vector2(size.y / 4, size.y / 2.5),
      // anchor: Anchor.bottomCenter
    ));
    // gameRef.camera.follow(this);
  }

  @override
  void update(double dt) {
    super.update(dt);
    int direction = ref.read(directionProvider);
    bool flipped = ref.read(flippedProvider);
    if (flipped != isFlipped) {
      flipHorizontallyAroundCenter();
      isFlipped = flipped;
    }
    if (direction > 0) {
      animation = animationRun;
      position.x += dt * 100;
    }
    if (direction < 0) {
      animation = animationRun;
      position.x -= dt * 100;
    }
    if (direction == 0) {
      animation = animationIdle;
    }
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    print('HOLAA');
    super.onCollisionStart(intersectionPoints, other);
  }

  // @override
  // void onCollisionEnd(PositionComponent other) {
  //   super.onCollisionEnd(other);
  //   if (isColliding) {
  //     print('23232s');
  //     remove(this);
  //   }
  // }
}
