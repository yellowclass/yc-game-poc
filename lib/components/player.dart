import 'package:flame/collisions.dart';
import 'package:flame_network_assets/flame_network_assets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:yc_game_poc/constants/images.dart';
import 'package:yc_game_poc/providers/providers.dart';

import '../pages/game.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<TryGame> {
  final WidgetRef ref;

  Player({required this.ref}) : super() {
    // debugMode = true;
  }

  final networkImages = FlameNetworkImages();
  late SpriteAnimation animationRun;
  late SpriteAnimation animationIdle;
  late SpriteAnimation animationWalk;
  bool isFlipped = false;

  @override
  Future<void> onLoad() async {
    SpriteSheet spriteRun = SpriteSheet(
        image: await networkImages.load(ImagesSwordsman.run),
        srcSize: Vector2(128, 128));
    SpriteSheet spriteIdle = SpriteSheet(
        image: await networkImages.load(ImagesSwordsman.idle),
        srcSize: Vector2(128, 128));
    SpriteSheet spriteWalk = SpriteSheet(
        image: await networkImages.load(ImagesSwordsman.walk),
        srcSize: Vector2(128, 128));
    animationIdle = spriteIdle.createAnimation(row: 0, stepTime: 0.1);
    animationRun = spriteRun.createAnimation(row: 0, stepTime: 0.1);
    animationWalk = spriteWalk.createAnimation(row: 0, stepTime: 0.1);

    animation = animationIdle;
    position = Vector2(0, 110);
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
    // if (flipped != isFlipped) {
    //   flipHorizontallyAroundCenter();
    //   isFlipped = flipped;
    // }
    if (direction > 0) {
      animation = animationRun;
      position.x += dt * 70;
    }
    // if (direction < 0) {
    //   animation = animationRun;
    //   position.x -= dt * 100;
    // }
    if (direction == 0) {
      if(position.x < -20 ) {
        animation = animationWalk;
      } else {
        animation = animationIdle;
        position.x -= dt * 50;

      }
    }
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
