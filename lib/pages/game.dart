import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/game.dart';
import 'package:yc_game_poc/components/obstacle.dart';
import 'package:yc_game_poc/components/player.dart';

import '../components/background.dart';

class TryGame extends FlameGame with HasCollisionDetection {
  final WidgetRef ref;

  TryGame({required this.ref});

  @override
  Future<void> onLoad() async {
    // add(Background(ref: ref));
    // add(parallaxComponent);

    ParallaxComponent background = await loadParallaxComponent([
      ParallaxImageData('background/8.png'),
      ParallaxImageData('background/7.png'),
      ParallaxImageData('background/6.png'),
      ParallaxImageData('background/5.png'),
      ParallaxImageData('background/4.png'),
      ParallaxImageData('background/3.png'),
      ParallaxImageData('background/2.png'),
      ParallaxImageData('background/1.png'),
    ], baseVelocity: Vector2(1, 0), velocityMultiplierDelta: Vector2(1.635, 0));

    // add(backgroundStatic);
    add(background);

    add(Obstacle(ref: ref));
    add(Player(ref: ref));
    // camera.follow(man);
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
