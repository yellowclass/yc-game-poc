import 'package:flame/parallax.dart';
import 'package:flame/collisions.dart';
import 'package:flame_network_assets/flame_network_assets.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:yc_game_poc/constants/images.dart';

import '../pages/game.dart';

// class Background extends ParallaxComponent<TryGame> with HasGameRef<TryGame>{
//   final WidgetRef ref;
//   Background({required this.ref}) : super() {
//     final networkImages = FlameNetworkImages();
//     debugMode = true;
//     // parallax = true;
//     parallax = Parallax([
//       ParallaxRenderer.image = await networkImages.load(ImagesSwordsman.idle);
//     ]);
//   }
//
//   @override
//   Future<void> onLoad() async {
//     // background = await gameRef.loadParallaxComponent([
//     //   ParallaxImageData('swordsman/idle.png'),
//     // ], baseVelocity: Vector2(100, 0));
//   }
//
//   @override
//   void update(double dt) {
//     super.update(dt);
//   }
// }
//
