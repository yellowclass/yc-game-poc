import 'package:flame/parallax.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';

import '../pages/game.dart';

class Background extends ParallaxComponent<TryGame> with HasGameRef<TryGame> {
  final WidgetRef ref;

  Background({required this.ref}) : super() {
    
    debugMode = true;
  }
  late ParallaxComponent background;
  @override
  Future<void> onLoad() async {
    background= await gameRef.loadParallaxComponent([
      ParallaxImageData('background.jpg'),
    ],
    baseVelocity: Vector2(100, 0)
    );
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
